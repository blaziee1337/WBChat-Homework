import Foundation

// MARK: - Custom Hash String

// реализует простую хеш-функцию, которая суммирует Unicode значения символов в строке
private func simpleSumHash(_ input: String) -> Int {
    var hashValue = 0
    for char in input {
        hashValue += Int(char.unicodeScalars.first?.value ?? 0)
    }
    return hashValue
}

// Пример использования:
private let inputString1 = "Swift"
private let hashValue1 = simpleSumHash(inputString1)
print("Хеш-значение строки '\(inputString1)': \(hashValue1)")
