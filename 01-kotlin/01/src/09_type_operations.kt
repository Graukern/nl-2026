fun main() {
    val a = 10
    val b = 3
    val sum = a + b      // вызов a.plus(b)
    val diff = a - b     // вызов a.minus(b)
    val prod = a * b     // вызов a.times(b)
    val quot = a / b     // вызов a.div(b) → 3

    // Явное преобразование чисел
    val i: Int = 10
    // val l: Long = i           // НЕЛЬЗЯ: автоматического расширения нет
    val l: Long = i.toLong()     // МОЖНО: вызываем метод преобразования
    val d: Double = i.toDouble()
    val s: String = i.toString()
}