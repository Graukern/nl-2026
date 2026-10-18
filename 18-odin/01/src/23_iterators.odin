package main

import "core:fmt"
import "core:strings"

Countdown :: struct { n: int }

// итератор: процедура, последний результат которой — bool
countdown_next :: proc(it: ^Countdown) -> (value: int, ok: bool) {
	if it.n <= 0 do return 0, false
	it.n -= 1
	return it.n + 1, true
}

main :: proc() {
	it := Countdown{3}
	for v in countdown_next(&it) { fmt.print(v, "") } // 3 2 1
	fmt.println()

	text := "first\nsecond\nthird"
	for line in strings.split_lines_iterator(&text) {
		fmt.println(">", line)
	}
}
