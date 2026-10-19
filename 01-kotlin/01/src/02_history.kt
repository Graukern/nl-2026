// Слайд 2: просто пример маленькой программы на Kotlin
import kotlin.random.Random

fun main() {
    val secretNumber = Random.nextInt(1, 101)
    var attempts = 0

    println("Игра 'Угадай число'!")
    println("Я загадал число от 1 до 100.")

    while (true) {
        println("Твой вариант: ")
        val guess = readln().toIntOrNull()

        if (guess == null) {
            println("Введи целое число.")
            continue
        }

        attempts++

        when {
            guess < secretNumber -> println("Больше!")
            guess > secretNumber -> println("Меньше!")
            else -> {
                println("Угадал за $attempts попыток.")
                break
            }
        }
    }
}