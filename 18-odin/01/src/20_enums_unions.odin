package main

import "core:fmt"

Direction :: enum { North, East, South, West }

Shape :: union { Circle, Rect }
Circle :: struct { r: f32 }
Rect   :: struct { w, h: f32 }

area :: proc(s: Shape) -> f32 {
	switch v in s {   // switch по типу
	case Circle: return 3.14 * v.r * v.r
	case Rect:   return v.w * v.h
	}
	return 0          // s == nil
}

main :: proc() {
	d := Direction.North
	d = .West                     // неявный селектор
	fmt.println(d)                // West

	fmt.println(area(Rect{2, 3})) // 6
}
