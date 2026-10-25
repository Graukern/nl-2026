// switch выбирает первую ветвь с подходящим образцом.
let statusCode = 404
switch statusCode {
case 200...299: print("Успех")
case 404: print("Не найдено")
default: print("Другой статус")
}

// Диапазоны также могут выступать образцами сопоставления.
let examScore = 73
switch examScore {
case 0..<50:
    print("Ниже порога")
case 50...100:
    print("Порог пройден")
default:
    print("Оценка вне диапазона")
}
