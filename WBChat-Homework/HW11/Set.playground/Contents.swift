import Foundation

// MARK: - SET

// Создание множества из целых чисел
private var intSet: Set = [1, 2, 3, 4, 5]

// Добавление нескольких элементов в множество
intSet.insert(6)
intSet.insert(7)
print(intSet)

// Удаление одного элемента
intSet.remove(3)
print(intSet)

// Проверка существования определенного элемента в множестве
private let exists = intSet.contains(4)
print("Существует ли элемент 4 в множестве? \(exists)")

// Вывод множества после добавления и удаления элементов
print("Множество после изменений: \(intSet)")

// Создание второго множества
private let anotherSet: Set = [6, 7, 8, 9]

// Объединение множеств (union)
private let unionSet = intSet.union(anotherSet)
print("Объединение множеств: \(unionSet)")

// Пересечение множеств (intersection)
private let intersectionSet = intSet.intersection(anotherSet)
print("Пересечение множеств: \(intersectionSet)")

// Разность множеств (subtracting)
private let subtractingSet = intSet.subtracting(anotherSet)
print("Разность множеств: \(subtractingSet)")

