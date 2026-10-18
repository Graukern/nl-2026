package main

import "core:fmt"

main :: proc() {
	names := []string{"Ann", "Bob", "Max"}

	for name in names     { fmt.println("Hello,", name) }
	for name, i in names  { fmt.println(i, name) }

	for r in "Odin"       { fmt.print(r, "") }  // по рунам
	fmt.println()

	#reverse for name in names { fmt.print(name, "") } // с конца
	fmt.println()

	nums := [3]int{1, 2, 3}
	for &n in nums { n *= 10 }   // по ссылке: можно менять
	fmt.println(nums)            // [10, 20, 30]
}
