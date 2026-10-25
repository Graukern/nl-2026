// Массив соответствует Sequence и предоставляет итератор.
let chapters = ["Типы", "Условия", "Циклы"]
var iterator = chapters.makeIterator()
while let chapter = iterator.next() {
    print("Следующий: \(chapter)")
}

// for-in выполняет тот же перебор без явной работы с итератором.
for chapter in chapters {
    print("Раздел: \(chapter)")
}

// next возвращает nil после завершения перебора.
if let nextChapter = iterator.next() {
    print("Дополнительный раздел: \(nextChapter)")
} else {
    print("Последовательность завершена")
}
