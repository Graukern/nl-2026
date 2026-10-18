package main

import "core:fmt"
import "core:strconv"

parse_age :: proc(s: string) -> (age: int, ok: bool) {
	age = strconv.parse_int(s) or_return // при ok == false — выход
	return age, age >= 0
}

main :: proc() {
	if age, ok := parse_age("21"); ok {
		fmt.println("age:", age)
	}

	_, ok := parse_age("abc")
	fmt.println(ok) // false

	m := map[string]int{}
	defer delete(m)
	v := m["missing"] or_else -1 // значение по умолчанию
	fmt.println(v) // -1
}
