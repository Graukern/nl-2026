package main

import "core:fmt"

main :: proc() {
	arr := [5]int{1, 2, 3, 4, 5} // фиксированный массив
	arr[0] = 100

	s := arr[1:4]                // срез: [2, 3, 4]
	fmt.println(len(arr), s)     // 5 [2, 3, 4]

	dyn: [dynamic]int            // динамический массив
	defer delete(dyn)            // память освобождаем сами
	append(&dyn, 10, 20, 30)
	fmt.println(dyn, len(dyn))   // [10, 20, 30] 3

	a := [3]f32{1, 2, 3}
	b := [3]f32{4, 5, 6}
	fmt.println(a + b, a * 2)    // [5, 7, 9] [2, 4, 6]
}
