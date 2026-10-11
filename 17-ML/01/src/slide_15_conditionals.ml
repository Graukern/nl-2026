(* Слайд 15. Условные выражения.
   Запуск: ocaml slide_15_conditionals.ml *)

let nonnegative x =
  if x >= 0 then x else 0

let sign =
  if 5 > 0 then "plus"
  else "not plus"

let () =
  Printf.printf "nonnegative (-3) = %d\n" (nonnegative (-3));
  Printf.printf "nonnegative 5 = %d\n" (nonnegative 5);
  Printf.printf "sign = %S\n" sign

(* Ожидаемый вывод:
   nonnegative (-3) = 0
   nonnegative 5 = 5
   sign = "plus"
*)
