// Set оставляет только уникальные элементы.
let uniqueTopics: Set<String> = ["Типы", "Типы", "Циклы"]
let scores = ["Типы": 90, "Циклы": 85]
print(uniqueTopics.contains("Циклы"))
if let score = scores["Типы"] {
    print(score)
}

// Проверка наличия ключа не требует принудительного извлечения.
if let missingScore = scores["Условия"] {
    print("Оценка: \(missingScore)")
} else {
    print("Оценка для раздела отсутствует")
}

// Порядок Set и Dictionary не гарантирован, поэтому сортируем ключи.
for topic in uniqueTopics.sorted() {
    print("Уникальный раздел: \(topic)")
}
for topic in scores.keys.sorted() {
    if let score = scores[topic] {
        print("\(topic): \(score)")
    }
}

// Добавление значения по ключу изменяет словарь.
var revisedScores = scores
revisedScores["Условия"] = 75
print("Число оценок: \(revisedScores.count)")
