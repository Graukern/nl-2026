package main

import "core:fmt"

main :: proc() {
	a, b := 10, 3

	fmt.println(a + b, a * b)    // 13 30
	fmt.println(a / b)           // 3: целочисленное
	fmt.println(-7 % 3)          // -1: остаток
	fmt.println(-7 %% 3)         // 2: модуль
	fmt.println(a > b && b != 0) // true
	fmt.println(a ~ b)           // 9: XOR
}
