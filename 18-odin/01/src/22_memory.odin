package main

import "core:fmt"

main :: proc() {
	n := new(int)          // выделить память под int
	defer free(n)          // освободить в конце области
	n^ = 42

	nums := make([]int, 5) // срез из 5 элементов в куче
	defer delete(nums)

	// временная память: всё освобождается разом
	msg := fmt.tprintf("n = %d, len = %d", n^, len(nums))
	fmt.println(msg)
	free_all(context.temp_allocator)
}
