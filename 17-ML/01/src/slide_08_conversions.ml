(* Слайд 8. Преобразование и приведение типов.
   Запуск: ocaml slide_08_conversions.ml *)

let real_number = float_of_int 3
let integer = int_of_float 3.9
let text = string_of_int 42
let parsed_number = int_of_string_opt "42"
let parsed_invalid = int_of_string_opt "abc"

(* Намеренно ошибочный фрагмент из подписи слайда оставлен в комментарии.
   Если раскомментировать следующую строку, проверка типов завершится ошибкой:

   let invalid = (3 : float)

   Аннотация : float не преобразует int в float.
   Корректное преобразование: float_of_int 3.
*)

let show_option = function
  | Some n -> "Some " ^ string_of_int n
  | None -> "None"

let () =
  Printf.printf "float_of_int 3 = %.1f\n" real_number;
  Printf.printf "int_of_float 3.9 = %d\n" integer;
  Printf.printf "string_of_int 42 = %S\n" text;
  Printf.printf "parse 42: %s\n" (show_option parsed_number);
  Printf.printf "parse abc: %s\n" (show_option parsed_invalid)

(* Ожидаемый вывод:
   float_of_int 3 = 3.0
   int_of_float 3.9 = 3
   string_of_int 42 = "42"
   parse 42: Some 42
   parse abc: None
*)
