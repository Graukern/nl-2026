package main

import "core:fmt"

main :: proc() {
	age := 20

	if age >= 18 {
		fmt.println("Adult")
	} else {
		fmt.println("Minor")
	}

	// init-оператор: x виден только внутри if/else
	if x := age * 2; x > 30 {
		fmt.println("x =", x)
	}

	if age > 0 do fmt.println("one-liner") // do вместо {}

	// if — оператор, а не выражение; для значений есть тернарный
	status := "Adult" if age >= 18 else "Minor"
	fmt.println(status)
}
