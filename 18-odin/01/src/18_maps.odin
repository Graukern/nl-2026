package main

import "core:fmt"

main :: proc() {
	ages := make(map[string]int)
	defer delete(ages)

	ages["Anna"] = 21
	ages["Bob"]  = 25

	if age, ok := ages["Anna"]; ok {
		fmt.println("Anna:", age)
	}
	fmt.println("Max" in ages)    // false

	delete_key(&ages, "Bob")

	for name, age in ages {
		fmt.println(name, age)
	}
}
