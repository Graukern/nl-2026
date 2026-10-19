(* Слайд 13. Рекурсия и хвостовой вызов.
   Запуск: ocaml slide_13_recursion.ml
   Примеры рассчитаны на n >= 0 и небольшие числа без переполнения int. *)

(* После возврата рекурсивного вызова остаётся выполнить умножение. *)
let rec fact n =
  if n <= 1 then 1
  else n * fact (n - 1)

(* Аккумулятор содержит уже вычисленное произведение.
   Вызов loop является последней операцией в рекурсивной ветви. *)
let fact_tail n =
  let rec loop acc k =
    if k <= 1 then acc
    else loop (acc * k) (k - 1)
  in loop 1 n

let () =
  Printf.printf "fact 5 = %d\n" (fact 5);
  Printf.printf "fact_tail 5 = %d\n" (fact_tail 5)

(* Ожидаемый вывод:
   fact 5 = 120
   fact_tail 5 = 120
*)
