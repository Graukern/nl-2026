// Пакет = папка с .odin-файлами
package main

import "core:fmt" // пакет из коллекции core

/* Многострочный комментарий
   /* может быть вложенным */ */

GREETING :: "Hello, Odin!" // константа

main :: proc() {
	fmt.println(GREETING)
}
