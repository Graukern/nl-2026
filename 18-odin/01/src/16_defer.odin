package main

import "core:fmt"

main :: proc() {
	fmt.println("start")
	defer fmt.println("1: выполнится последним")
	defer fmt.println("2: выполнится раньше")

	{
		defer fmt.println("конец вложенного блока")
		fmt.println("внутри блока")
	}
	fmt.println("end")
}
