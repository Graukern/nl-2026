package main

import "core:fmt"
import "core:os"

main :: proc() {
	f, err := os.create("result.txt")
	if err != nil {
		fmt.eprintln("cannot create file:", err)
		return
	}
	defer os.close(f)

	fmt.fprintln(f, "Hello, Odin!")
	fmt.fprintfln(f, "Answer: %d", 42)

	// или одной строкой:
	_ = os.write_entire_file("short.txt", "Hellope!\n")
}
