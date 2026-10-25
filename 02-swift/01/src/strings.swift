// Строки поддерживают конкатенацию и интерполяцию значений.
let topic = "Swift"
let headline = "Курс: " + topic
let report = "\(headline), символов: \(headline.count)"
print(report)

// Комбинируемый знак ударения не образует отдельный Character.
let accentedWord = "cafe\u{301}"
print("Строка: \(accentedWord)")
print("Символов: \(accentedWord.count)")
print("Байт UTF-8: \(accentedWord.utf8.count)")

// У строк используются собственные индексы, не целочисленные смещения.
let initialCharacter = accentedWord[accentedWord.startIndex]
print("Первый символ: \(initialCharacter)")
