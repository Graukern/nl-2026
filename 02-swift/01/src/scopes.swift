// Внешнее объявление доступно во вложенной области.
let mode = "обычный"
print("До блока: \(mode)")

do {
    // Локальное объявление временно скрывает внешнее имя.
    let mode = "тестовый"
    let localMessage = "Внутренняя область"
    print("\(localMessage): \(mode)")
}

// После закрытия блока доступно только внешнее имя mode.
print("После блока: \(mode)")

let shouldDisplay = true
if shouldDisplay {
    // Сообщение существует только внутри данного блока if.
    let scopedMessage = "Условный блок выполнен"
    print(scopedMessage)
}
