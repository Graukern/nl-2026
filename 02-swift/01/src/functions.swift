// Параметры указываются с типами, результат — после стрелки.
func progressMessage(for completed: Int, outOf total: Int) -> String {
    return "\(completed) из \(total)"
}
print(progressMessage(for: 3, outOf: 5))

// Возврат Optional позволяет явно сообщить о неверных аргументах.
func completionPercentage(for completedTasks: Int, outOf totalTasks: Int) -> Int? {
    guard totalTasks > 0, completedTasks >= 0, completedTasks <= totalTasks else {
        return nil
    }
    return completedTasks * 100 / totalTasks
}

if let percentage = completionPercentage(for: 3, outOf: 4) {
    print("Выполнено: \(percentage)%")
} else {
    print("Не удалось рассчитать процент")
}

// Неверное общее количество обрабатывается без аварийного завершения.
if let percentage = completionPercentage(for: 3, outOf: 0) {
    print("Выполнено: \(percentage)%")
} else {
    print("Общее количество должно быть положительным")
}
