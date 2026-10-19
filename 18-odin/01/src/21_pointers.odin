package main

import "core:fmt"

Counter :: struct { value: int }

increment :: proc(c: ^Counter) {
	c.value += 1     // авто-разыменование для полей
}

main :: proc() {
	x := 10
	p: ^int = &x     // указатель на x
	p^ = 20          // разыменование
	fmt.println(x)   // 20

	c := Counter{}
	increment(&c)
	increment(&c)
	fmt.println(c.value) // 2
}
