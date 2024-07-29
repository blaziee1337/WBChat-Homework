import Foundation

class Person {
    var fullName: String
    var age: Int
    var passport: Passport?
    
    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
        print("\(fullName) инициализирован.")
    }
    
    deinit {
        print("\(fullName) деинициализирован.")
    }
}

class Passport {
    var series: String
    var number: String
    var dateOfIssue: Date
    weak var person: Person?
    
    init(series: String, number: String, dateOfIssue: Date, person: Person?) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
        self.person = person
        print("Паспорт \(series) \(number) инициализирован.")
    }
    
    deinit {
        print("Паспорт \(series) \(number) деинициализирован.")
    }
}

class Material {
    var name: String
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.name = name
        self.quantity = quantity
        print("Материал \(name) инициализирован.")
    }
    
    deinit {
        print("Материал \(name) деинициализирован.")
    }
}


class Factory {
    var name: String
    var workers: [Person] = []
    var materials: [Material] = []
    
    init(name: String) {
        self.name = name
        print("Фабрика \(name) инициализирована.")
    }
    
    func addWorker(_ worker: Person) {
        workers.append(worker)
        print("Работник \(worker.fullName) добавлен на фабрику.")
    }
    
    func addMaterial(_ material: Material) {
        materials.append(material)
        print("Материал \(material.name) добавлен на фабрику.")
    }
    
    deinit {
        print("Фабрика \(name) деинициализирована.")
    }
}

func factory() {
    do {
        let factory = Factory(name: "Строительная Фабрика")
        
        let person1 = Person(fullName: "Иван Иванов", age: 30)
        let passport1 = Passport(series: "1234", number: "567890", dateOfIssue: Date(), person: person1)
        person1.passport = passport1
        
        let person2 = Person(fullName: "Никита Васильев", age: 25)
        let passport2 = Passport(series: "2345", number: "678901", dateOfIssue: Date(), person: person2)
        person2.passport = passport2
        
        factory.addWorker(person1)
        factory.addWorker(person2)
        
        let material1 = Material(name: "Цемент", quantity: 100)
        let material2 = Material(name: "Песок", quantity: 200)
        
        factory.addMaterial(material1)
        factory.addMaterial(material2)
    }
    
}

factory()
