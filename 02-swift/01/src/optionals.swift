// Преобразование строки в число может вернуть nil.
let rawQuantity = "15"
let quantity: Int? = Int(rawQuantity)

// Привязка if let безопасно извлекает значение из Optional.
if let quantity {
    print("Количество: \(quantity)")
} else {
    print("Некорректное число")
}

// Отсутствие значения обрабатывается явно.
let missingQuantity: Int? = Int("нет")
if let missingQuantity {
    print("Получено: \(missingQuantity)")
} else {
    print("Значение отсутствует")
}

// guard let прекращает выполнение функции при неудачном преобразовании.
func printQuantity(from source: String) {
    guard let parsedQuantity = Int(source) else {
        print("Не удалось прочитать количество: \(source)")
        return
    }
    print("Прочитано: \(parsedQuantity)")
}

printQuantity(from: "24")
printQuantity(from: "двадцать четыре")
