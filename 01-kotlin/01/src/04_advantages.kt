// Слайд 4: еще один пример маленькой программы на Kotlin

fun main() {
    val grades = listOf(4, 5, 3, 2, 5, 4, 3, 5, 2, 4, 5, 3, 4, 4, 5)

    var sum = 0
    var max = grades[0]
    var min = grades[0]
    var bad = 0

    for (grade in grades) {
        sum += grade

        if (grade > max) {
            max = grade
        } else if (grade < min) {
            min = grade
        }

        if (grade <= 2) {
            bad++
        }
    }

    val average = sum.toDouble() / grades.size
    println("Всего оценок: ${grades.size}")
    println("Средний балл: %.2f".format(average))
    println("Максимум: $max")
    println("Минимум: $min")
    println("Задолженностей: $bad")

    when {
        average >= 4.5 -> println("Группа отличников")
        average >= 3.5 -> println("Хорошая успеваемость")
        average >= 2.5 -> println("Средняя успеваемость")
        else -> println("Требуется пересдача")
    }
}