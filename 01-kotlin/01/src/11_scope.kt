open class Base {
    val a = 1          // public (по умолчанию)
    private val b = 2  // только Base
    protected val c = 3 // Base + наследники
    internal val d = 4  // внутри модуля
}

fun main() {
    // Example: let
    val length = "test".let {
        println(it) // it == "test"
        it.length   // результат лямбды
    }
    println(length) // 4

    // Пример с apply (this, возвращает сам объект)
    data class City(var name: String, var population: Int = 0)

    val moscow = City("Moscow").apply {
        population = 15_000_000 // this.population
        println(this)
    }
    // moscow == City("Moscow"), population = 15_000_000
}