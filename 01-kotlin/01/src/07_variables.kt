// Слайд 7: Переменные
fun main() {
    val language: String = "KotLin" // Тип указан явно
    val version = 2.4              // Тип определяется автоматически (Double)
    // language = "Java"           // Ошибка: val нельзя перезаписать

    var counter = 0
    counter += 1                   // Ок: значение var можно обновлять

    val list = mutableListOf("KotLin", "Java")
    list.add("Swift")              // OK
    list[0] = "Kotlin 2.0"         // OK
    // list = mutableListOf()      // Ошибка
}