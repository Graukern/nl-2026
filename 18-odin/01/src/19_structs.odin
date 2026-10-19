package main

import "core:fmt"

Vec2 :: struct {
	x, y: f32,
}

Player :: struct {
	name:  string,
	pos:   Vec2,
	hp:    int,
}

main :: proc() {
	p := Player{name = "Hero", hp = 100} // pos = {0, 0}
	p.pos.x = 5

	q := Vec2{1, 2}               // позиционная запись
	fmt.println(p)
	fmt.println(q.x + q.y)        // 3
}
