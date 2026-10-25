// Замкнутый диапазон включает обе границы.
for lessonNumber in 1...3 {
    print("Занятие: \(lessonNumber)")
}

// Полуоткрытый диапазон исключает верхнюю границу.
for index in 0..<3 {
    print("Индекс: \(index)")
}

// while проверяет условие до каждого повторения.
var remainingAttempts = 2
while remainingAttempts > 0 {
    print("Осталось попыток: \(remainingAttempts)")
    remainingAttempts -= 1
}

// repeat-while проверяет условие после выполнения блока.
var checkCount = 0
repeat {
    checkCount += 1
    print("Проверка: \(checkCount)")
} while checkCount < 2

// continue пропускает шаг, break завершает цикл.
for number in 1...6 {
    if number % 2 == 0 {
        continue
    }
    if number > 4 {
        break
    }
    print("Нечётное число: \(number)")
}
