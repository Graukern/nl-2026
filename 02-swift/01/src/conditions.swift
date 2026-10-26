// Проверки выполняются по порядку до первого подходящего условия.
let score = 72
if score >= 80 {
    print("Высокий результат")
} else if score >= 50 {
    print("Зачёт")
} else {
    print("Повторить тему")
}

// guard отделяет недопустимые случаи от основного пути выполнения.
func accessDecision(for age: Int, hasTicket: Bool) -> String {
    guard age >= 16 else {
        return "Доступ запрещён по возрасту"
    }
    guard hasTicket else {
        return "Требуется билет"
    }
    return "Доступ разрешён"
}

print(accessDecision(for: 19, hasTicket: true))
print(accessDecision(for: 15, hasTicket: true))
print(accessDecision(for: 19, hasTicket: false))
