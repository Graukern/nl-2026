// Первый аргумент содержит путь к программе, следующие — данные пользователя.
let section = CommandLine.arguments.dropFirst().first ?? "Основы"
print("Раздел: \(section)")

// readLine возвращает nil при завершении стандартного ввода.
if let rawCount = readLine(), let count = Int(rawCount), count >= 0 {
    print("Задач: \(count)")
} else {
    print("Нет корректного неотрицательного числа")
}
