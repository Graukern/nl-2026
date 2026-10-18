package main

import "core:fmt"

square :: proc(x: int) -> int {
	return x * x
}

// несколько результатов
div_mod :: proc(a, b: int) -> (int, int) {
	return a / b, a % b
}

// параметр со значением по умолчанию
greet :: proc(name: string, greeting := "Hello") {
	fmt.println(greeting, name)
}

main :: proc() {
	fmt.println(square(5))         // 25
	q, r := div_mod(17, 5)         // 3 2
	fmt.println(q, r)
	greet("Anna")                  // Hello Anna
	greet("Bob", greeting = "Hi")  // именованный аргумент
}
