package main

import "core:bufio"
import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

main :: proc() {
	r: bufio.Reader
	bufio.reader_init(&r, os.to_reader(os.stdin))
	defer bufio.reader_destroy(&r)

	fmt.print("Enter your name: ")
	line, _ := bufio.reader_read_string(&r, '\n', context.temp_allocator)
	name := strings.trim_space(line)

	fmt.print("Enter your age: ")
	line, _ = bufio.reader_read_string(&r, '\n', context.temp_allocator)
	age, ok := strconv.parse_int(strings.trim_space(line))
	if !ok {
		fmt.println("Not a number!")
		return
	}

	fmt.printfln("Hello, %s!", name)
	fmt.printfln("Next year: %d", age + 1)
}
