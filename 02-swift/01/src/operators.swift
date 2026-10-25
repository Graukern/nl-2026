// Арифметика с целыми числами выполняется без неявного перехода к Double.
let completedTasks = 7
let totalTasks = 10
let completionPercent = completedTasks * 100 / totalTasks

// Сравнения возвращают Bool; логические операторы объединяют условия.
let shouldContinue = completedTasks < totalTasks && completionPercent >= 50
let allCompleted = completedTasks == totalTasks
let requiresReview = shouldContinue || allCompleted

// Деление Int возвращает целую часть, а % — остаток.
let fullGroups = completedTasks / 3
let remainingTasks = completedTasks % 3

print("Выполнено: \(completionPercent)%")
print("Продолжить: \(shouldContinue)")
print("Проверить результат: \(requiresReview)")
print("Полных групп: \(fullGroups), остаток: \(remainingTasks)")
