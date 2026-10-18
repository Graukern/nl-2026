fun makeCounter(): () -> Int {
    var count = 0
    return {
        count += 1
        count
    }
}

fun main() {
    val counter = makeCounter()
    println(counter())
    println(counter())

    val anotherCounter = makeCounter()
    println(anotherCounter())
}
