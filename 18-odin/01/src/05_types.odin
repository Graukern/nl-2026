package main

import "core:fmt"

main :: proc() {
	age:    int    = 21
	small:  u8     = 255
	price:  f64    = 19.99
	active: bool   = true
	letter: rune   = 'O'
	name:   string = "Odin"

	fmt.println(age, small, price, active, letter, name)
}
