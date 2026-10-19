package main

import "core:fmt"

main :: proc() {
	x: int         // объявление: x == 0
	y: int = 10    // тип + значение
	z := 20        // тип выводится: int
	name := "Odin" // string

	x = y + z      // присваивание
	a, b := 1, 2
	a, b = b, a    // множественное присваивание

	fmt.println(x, name, a, b) // 30 Odin 2 1
}
