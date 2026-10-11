(* Слайд 18. Итерация без ручного счётчика.
   Запуск: ocaml slide_18_iteration.ml *)

(* Действие для каждого элемента. List.iter возвращает (). *)
let () = List.iter print_int [1; 2; 3]
let () = print_newline ()

(* Новый список, исходный список не изменяется. *)
let doubled = List.map (fun x -> x * 2) [1; 2; 3]

(* Свёртка с начальным значением аккумулятора 0. *)
let sum = List.fold_left ( + ) 0 [1; 2; 3]

let () =
  Printf.printf "doubled = [%s]\n"
    (String.concat "; " (List.map string_of_int doubled));
  Printf.printf "sum = %d\n" sum

(* Ожидаемый вывод:
   123
   doubled = [2; 4; 6]
   sum = 6
*)
