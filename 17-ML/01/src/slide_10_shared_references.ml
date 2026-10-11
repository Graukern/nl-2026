(* Слайд 10. Владение и совместное использование.
   Запуск: ocaml slide_10_shared_references.ml *)

let a = ref 0
let b = a

let set_to_seven r = r := 7
let () = set_to_seven b

let result = !a

(* a и b обозначают одну ячейку. Функция меняет её содержимое. *)
let () = Printf.printf "result = %d\n" result

(* Ожидаемый вывод:
   result = 7
*)
