fun describe(obj: Any): String {
    // НЕЛЬЗЯ: obj.length — у Any нет такого свойства
    if (obj is String) {
        // МОЖНО: внутри if компилятор знает, что это String (smart cast)
        return "Строка длиной ${obj.length}"
    }
    return "Не строка"
}

fun main() {
    val obj: Any = "Kotlin"

    // as — строгое: упадёт с ошибкой, если тип не совпал
    // val num = obj as Int      // ClassCastException!

    // as? — безопасное: вернёт null при несовпадении
    val num = obj as? Int        // null
    val str = obj as? String     // "Kotlin"

    println(describe(obj))
}