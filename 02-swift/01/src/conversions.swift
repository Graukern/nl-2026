// Явное преобразование Int в Double сохраняет дробную часть результата.
let count = 5
let average = Double(count) / 2
print("Среднее: \(average)")

// Преобразование Double в Int отбрасывает дробную часть.
let truncated = Int(3.8)
print("Целая часть: \(truncated)")

// Преобразование String в Int возвращает Optional.
let source = "42"
if let parsed = Int(source) {
    print("Следующее число: \(parsed + 1)")
} else {
    print("Строку нельзя преобразовать в Int")
}

let invalidSource = "42a"
if let parsed = Int(invalidSource) {
    print("Получено: \(parsed)")
} else {
    print("Некорректный ввод: \(invalidSource)")
}
