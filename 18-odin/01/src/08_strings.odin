package main

import "core:fmt"
import "core:strconv"

main :: proc() {
	name, age := "Anna", 21

	fmt.println(name, "is", age)          // Anna is 21
	fmt.printfln("%s is %d", name, age)   // как в C
	fmt.printfln("%v: %v", name, age + 1) // Anna: 22

	s := fmt.tprintf("%d%%", 42) // "42%"
	fmt.println(len(s))          // 3 (байта)

	n, ok := strconv.parse_int("123")
	fmt.println(n, ok)           // 123 true
}
