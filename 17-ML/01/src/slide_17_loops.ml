(* Слайд 17. Циклы for и while.
   Запуск: ocaml slide_17_loops.ml *)

let total = ref 0
let () =
  for i = 1 to 3 do
    total := !total + i
  done

let count = ref 0
let () =
  while !count < 3 do
    count := !count + 1
  done

(* Границы for включены. Оба цикла возвращают (). *)
let () =
  Printf.printf "total = %d\n" !total;
  Printf.printf "count = %d\n" !count

(* Ожидаемый вывод:
   total = 6
   count = 3
*)
