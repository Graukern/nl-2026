(* Слайд 7. Операции над значениями.
   Запуск: ocaml slide_07_operators.ml *)

let quotient = 7 / 2
let remainder = 7 mod 2
let real_quotient = 7.0 /. 2.0
let equal = 3 = 3
let less = 3 < 5
let both = true && false
let greeting = "ML" ^ "!"
let numbers = 1 :: [2; 3]

let () =
  Printf.printf "7 / 2 = %d\n" quotient;
  Printf.printf "7 mod 2 = %d\n" remainder;
  Printf.printf "7.0 /. 2.0 = %.1f\n" real_quotient;
  Printf.printf "3 = 3: %b\n" equal;
  Printf.printf "3 < 5: %b\n" less;
  Printf.printf "true && false: %b\n" both;
  Printf.printf "greeting = %S\n" greeting;
  Printf.printf "numbers = [%s]\n"
    (String.concat "; " (List.map string_of_int numbers))

(* Ожидаемый вывод:
   7 / 2 = 3
   7 mod 2 = 1
   7.0 /. 2.0 = 3.5
   3 = 3: true
   3 < 5: true
   true && false: false
   greeting = "ML!"
   numbers = [1; 2; 3]
*)
