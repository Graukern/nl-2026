fun greetUser(name: String, greeting: String = "Привет") {
    println("$greeting, $name!")
}

fun main() {
    greetUser("Анна")
    greetUser(name = "Иван", greeting = "Добрый день")
}
