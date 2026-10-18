package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
	data, err := os.read_entire_file("numbers.txt", context.allocator)
	if err != nil {
		fmt.eprintln("cannot read file:", err)
		return
	}
	defer delete(data)

	text := string(data)
	for line in strings.split_lines_iterator(&text) {
		fmt.println(line)
	}
}
