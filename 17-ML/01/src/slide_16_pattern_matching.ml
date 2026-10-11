(* Слайд 16. Сопоставление с образцом.
   Запуск: ocaml slide_16_pattern_matching.ml *)

let first_or_zero xs =
  match xs with
  | [] -> 0
  | head :: _ -> head

let a = first_or_zero []
let b = first_or_zero [7; 8]

(* _ игнорирует хвост списка. Обе формы списка учтены. *)
let () = Printf.printf "a = %d, b = %d\n" a b

(* Ожидаемый вывод:
   a = 0, b = 7
*)
