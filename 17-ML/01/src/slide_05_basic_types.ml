(* Слайд 5. Базовые типы данных.
   Запуск: ocaml slide_05_basic_types.ml *)

let integer = 42
let negative_integer = -7
let real_number = 3.14
let another_real = 2.0
let yes = true
let no = false
let letter = 'A'
let text = "hello"
let nothing = ()

let () =
  Printf.printf "int: %d, %d\n" integer negative_integer;
  Printf.printf "float: %.2f, %.1f\n" real_number another_real;
  Printf.printf "bool: %b, %b\n" yes no;
  Printf.printf "char: %c\nstring: %s\n" letter text;
  let () = nothing in
  print_endline "unit: ()"

(* Ожидаемый вывод:
   int: 42, -7
   float: 3.14, 2.0
   bool: true, false
   char: A
   string: hello
   unit: ()
*)
