fun main() {
    val age: Int = 25
    val temperature: Double = 36.6
    val isEnabled: Boolean = false
    val grade: Char = 'A'
    val city: String = "Amsterdam"

    // String — гарантированно не содержит null
    // String? — может содержать null
    val nullableCity: String? = null

    // Any — корень иерархии (аналог Object)
    val anyValue: Any = city

    // Nothing — нижний тип (код, который никогда не завершается успешно)
    fun fail(message: String): Nothing {
        throw IllegalStateException(message)
    }
}