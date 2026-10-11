(* Слайд 12. Функции: результат и высший порядок.
   Запуск: ocaml slide_12_results_and_higher_order.ml *)

(* Предусловие: b <> 0. Результат функции является одним кортежем. *)
let divmod a b =
  (a / b, a mod b)

let pair = divmod 7 3

(* Функция f передаётся как аргумент и применяется дважды. *)
let twice f x = f (f x)
let r = twice (fun x -> x + 1) 5

let () =
  let quotient, remainder = pair in
  Printf.printf "divmod 7 3 = (%d, %d)\n" quotient remainder;
  Printf.printf "twice increment 5 = %d\n" r

(* Ожидаемый вывод:
   divmod 7 3 = (2, 1)
   twice increment 5 = 7
*)
