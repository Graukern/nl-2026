package main

import "core:fmt"

PI :: 3.14159        // нетипизированная константа
MAX_USERS : int : 100 // типизированная константа

main :: proc() {
	radius := 2.0
	area := PI * radius * radius

	// PI = 3 // ошибка: константу нельзя изменить
	fmt.println(area, MAX_USERS)
}
