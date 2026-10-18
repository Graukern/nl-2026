package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

main :: proc() {
	data, err := os.read_entire_file("numbers.txt", context.allocator)
	if err != nil do return
	defer delete(data)

	sum, count, passed := 0, 0, 0
	text := string(data)
	for line in strings.split_lines_iterator(&text) {
		n := strconv.parse_int(strings.trim_space(line)) or_continue
		sum += n
		count += 1
		if n >= 60 do passed += 1
	}
	average := f64(sum) / f64(count)

	out, _ := os.create("result.txt")
	defer os.close(out)
	fmt.fprintfln(out, "Average: %.2f", average)
	fmt.fprintfln(out, "Passed: %d of %d", passed, count)
}
