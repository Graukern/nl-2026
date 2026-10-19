(* Слайд 19. Блоки и последовательность выражений.
   Запуск: ocaml slide_19_blocks.ml *)

let result =
  let x = 3 in
  begin
    print_endline "start";
    x * x
  end

(* Последнее выражение блока определяет результат.
   Имя x доступно только внутри локального выражения let ... in. *)
let () = Printf.printf "result = %d\n" result

(* Ожидаемый вывод:
   start
   result = 9
*)
