(* Слайд 14. Замыкания.
   Запуск: ocaml slide_14_closures.ml *)

let make_adder n =
  fun x -> x + n

let add_ten = make_adder 10
let result = add_ten 5

(* add_ten сохраняет n = 10 из окружения вызова make_adder. *)
let () = Printf.printf "add_ten 5 = %d\n" result

(* Ожидаемый вывод:
   add_ten 5 = 15
*)
