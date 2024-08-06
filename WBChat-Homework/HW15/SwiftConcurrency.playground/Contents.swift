import Foundation

struct SomeTask {
    let id: UUID
    let data: String
    
    init(data: String) {
        self.id = UUID()
        self.data = data
    }
}

actor ClientActor {
    let id: UUID
    var isAvailable: Bool = true
    
    init() {
        self.id = UUID()
    }
    
    func connect(to server: ServerActor) async {
        await server.registerClient(self)
    }
    
    func disconnect(from server: ServerActor) async {
        await server.unregisterClient(self)
    }
    
    func startTask(_ task: SomeTask) async throws -> String {
        isAvailable = false
        defer { isAvailable = true } // Устанавливаем доступность после выполнения
        
        // Имитация выполнения задачи с возможностью возникновения ошибки
        try await Task.sleep(nanoseconds: 1_000_000_000) // Имитация задержки
        if Bool.random() { // 50% шанс на ошибку
            throw NSError(domain: "ClientError", code: 1, userInfo: nil)
        }
        
        let result = "Processed \(task.data)"
        return "Processed \(task.data)"
    }
}

actor ServerActor {
    private var clients = [UUID: ClientActor]()
    private var taskQueue = [SomeTask]()
    private var taskResults = [UUID: String]()
    private var taskErrors = [UUID: Error]()
    
    func registerClient(_ client: ClientActor) async {
        clients[client.id] = client
        print("Client \(client.id) connected")
        await distributeTasks()
    }
    
    func unregisterClient(_ client: ClientActor) async {
        clients.removeValue(forKey: client.id)
        print("Client \(client.id) disconnected")
    }
    
    func submitTask(_ task: SomeTask) async {
        taskQueue.append(task)
        await distributeTasks()
    }
    
    private func distributeTasks() async {
        while !taskQueue.isEmpty {
            guard let task = taskQueue.first else { break }
            
            for client in clients.values where await client.isAvailable {
                taskQueue.removeFirst()
                Task {
                    do {
                        let result = try await client.startTask(task)
                        await submitResult(task.id, result: result)
                    } catch {
                        await handleTaskError(task.id, error: error)
                    }
                }
                break
            }
        }
    }
    
    private func submitResult(_ taskId: UUID, result: String) async {
        print("Server received result for task \(taskId): \(result)")
        taskResults[taskId] = result
    }
    
    
    private func handleTaskError(_ taskId: UUID, error: Error) async {
        print("Error occurred for task \(taskId): \(error.localizedDescription)")
        taskErrors[taskId] = error
        
    }
}

class TaskManager {
    private let server: ServerActor
    
    init(server: ServerActor) {
        self.server = server
    }
    
    func createAndSubmitTask(data: String) async {
        let task = SomeTask(data: data)
        await server.submitTask(task)
    }
}

let server = ServerActor()
let client1 = ClientActor()
let client2 = ClientActor()

Task {
    await client1.connect(to: server)
    await client2.connect(to: server)
    
    let taskManager = TaskManager(server: server)
    await taskManager.createAndSubmitTask(data: "Task data 1")
    await taskManager.createAndSubmitTask(data: "Task data 2")
    await taskManager.createAndSubmitTask(data: "Task data 3")
}

