package main

import "core:fmt"

x := 10 // переменная уровня пакета

example :: proc() {
	y := 20                   // видна в процедуре
	if x > 0 {
		z := 30               // видна только в блоке if
		fmt.println(x + y + z) // 60
	}
	// fmt.println(z)         // ошибка: z не объявлена

	{
		y := 99 // затенение (odin -vet запрещает)
		fmt.println(y) // 99
	}
	fmt.println(y) // 20
}

main :: proc() { example() }
