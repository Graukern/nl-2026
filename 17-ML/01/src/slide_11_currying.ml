(* Слайд 11. Функции: параметры и каррирование.
   Запуск: ocaml slide_11_currying.ml *)

let add x y = x + y
(* Тип: int -> int -> int. *)

let add_two = add 2
let answer = add_two 5

(* Дополнительный фрагмент из подписи слайда: аргумент-кортеж. *)
let add_pair (x, y) = x + y
(* Тип: int * int -> int. *)

let () =
  Printf.printf "add_two 5 = %d\n" answer;
  Printf.printf "add_pair (2, 5) = %d\n" (add_pair (2, 5))

(* Ожидаемый вывод:
   add_two 5 = 7
   add_pair (2, 5) = 7
*)
