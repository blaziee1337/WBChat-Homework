import Foundation

//MARK: - Dictionary

// Создание словаря, где ключи — названия городов, а значения — их население
private var cityPopulation: [String: Int] = [
    "Москва": 12655050,
    "Санкт-Петербург": 5384342,
    "Набережные Челны": 545750
]

// Добавление нескольких пар ключ-значение в словарь
cityPopulation["Стамбул"] = 15907951
cityPopulation["Казань"] = 1308660

// Удаление одной пары ключ-значение
cityPopulation.removeValue(forKey: "Санкт-Петербург")

// Обновление значения для одного из ключей
cityPopulation["Казань"] = 1318604

// Получение значения для одного из ключей
private let population = cityPopulation["Набережные Челны"]
    if let population = population {
        print("Население Набережных Челнов: \(population)")
    } else {
        print("Данных о населении нет")
}

// Вывод словаря после изменений
print("Словарь после изменений: \(cityPopulation)")


