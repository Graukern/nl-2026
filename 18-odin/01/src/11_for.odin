package main

import "core:fmt"

main :: proc() {
	for i := 0; i < 3; i += 1 { fmt.print(i, "") } // 0 1 2  (как в C)

	j := 0
	for j < 3 { j += 1 }        // как while

	for i in 0..<5 { fmt.print(i, "") } // 0 1 2 3 4
	for i in 1..=5 { fmt.print(i, "") } // 1 2 3 4 5

	for { break }               // бесконечный цикл
	fmt.println()
}
