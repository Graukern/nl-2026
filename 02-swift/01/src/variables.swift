// Константа хранит значение, которое нельзя переназначить.
let courseTitle = "Основы Swift"

// Переменную можно изменять после объявления.
var completedLessons = 0
completedLessons += 1

// Аннотация типа задаётся после двоеточия.
let totalLessons: Int = 20
let courseStarted = completedLessons > 0

print("Курс: \(courseTitle)")
print("Пройдено: \(completedLessons) из \(totalLessons)")
print("Начат: \(courseStarted)")
