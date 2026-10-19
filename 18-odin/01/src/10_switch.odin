package main

import "core:fmt"

main :: proc() {
	code := 404
	switch code {
	case 200:      fmt.println("OK")
	case 404, 410: fmt.println("Not Found") // break не нужен
	case 500..<600: fmt.println("Server Error")
	case:          fmt.println("Unknown")   // default
	}

	age := 30
	switch { // switch без условия = цепочка if-else
	case age < 18: fmt.println("Minor")
	case age < 65: fmt.println("Adult")
	case:          fmt.println("Senior")
	}
}
