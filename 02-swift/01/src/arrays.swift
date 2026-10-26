// Array хранит элементы в определённом порядке.
var topics = ["Типы", "Условия"]
topics.append("Циклы")
let index = 2
if topics.indices.contains(index) {
    print(topics[index])
}

// Индекс предварительно проверяется перед обращением к элементу.
let requestedIndex = 5
if topics.indices.contains(requestedIndex) {
    print("Найдено: \(topics[requestedIndex])")
} else {
    print("Индекс \(requestedIndex) вне диапазона")
}

// first возвращает первый элемент или nil, если массив пуст.
if let firstTopic = topics.first {
    print("Первый раздел: \(firstTopic)")
}

// enumerated возвращает смещения и соответствующие значения.
for (offset, topic) in topics.enumerated() {
    print("\(offset): \(topic)")
}
print("Количество разделов: \(topics.count)")
