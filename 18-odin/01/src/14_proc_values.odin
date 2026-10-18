package main

import "core:fmt"

// явная перегрузка: группа процедур под одним именем
to_str_int  :: proc(x: int)  -> string { return "int" }
to_str_bool :: proc(x: bool) -> string { return "bool" }
to_str :: proc{to_str_int, to_str_bool}

apply :: proc(xs: []int, f: proc(int) -> int) {
	for &x in xs { x = f(x) }
}

main :: proc() {
	fmt.println(to_str(1), to_str(true)) // int bool

	nums := []int{1, 2, 3}
	apply(nums, proc(x: int) -> int { return x * 2 }) // литерал процедуры
	fmt.println(nums) // [2, 4, 6]
}
