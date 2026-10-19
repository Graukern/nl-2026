(* Слайд 6. Составные и пользовательские типы.
   Запуск: ocaml slide_06_compound_types.ml *)

(* Кортеж. *)
let person = ("Ada", 20)

(* Запись. *)
type point = { x : float; y : float }

(* Вариант. *)
type shape = Circle of float | Point

(* Список. *)
let scores = [3; 4; 5]

(* Создание значений и вывод добавлены для самостоятельного запуска. *)
let position = { x = 1.0; y = 2.0 }
let circle = Circle 3.0
let single_point = Point

let describe_shape = function
  | Circle radius -> Printf.sprintf "Circle %.1f" radius
  | Point -> "Point"

let () =
  let name, age = person in
  Printf.printf "person = (%S, %d)\n" name age;
  Printf.printf "position = { x = %.1f; y = %.1f }\n" position.x position.y;
  print_endline (describe_shape circle);
  print_endline (describe_shape single_point);
  Printf.printf "scores = [%s]\n"
    (String.concat "; " (List.map string_of_int scores))

(* Ожидаемый вывод:
   person = ("Ada", 20)
   position = { x = 1.0; y = 2.0 }
   Circle 3.0
   Point
   scores = [3; 4; 5]
*)
