fun countdown(n: Int) {
    if (n <= 0) {
        println("Старт!")
        return
    }
    println(n)
    countdown(n - 1)
}

fun main() {
    countdown(3)
}
