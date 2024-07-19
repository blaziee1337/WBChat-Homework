import Foundation

//MARK: - HASH

// Функция для получения хеша строки с использованием встроенной функции hash()
private func hashString(string: String) -> Int {
    return string.hash
}

// Пример использования:
private let inputString = "Hash"
private let hashValue = hashString(string: inputString)
print("Хеш-значение строки '\(inputString)': \(hashValue)")
