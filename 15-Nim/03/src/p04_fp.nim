# Функциональное программирование
import std/[sequtils, sugar]

proc run*() =
  echo "04. Функциональное программирование"
  
  let numbers = @[1, 2, 3, 4, 5]
  
  # Использование синтаксического сахара из std/sugar
  let doubled = numbers.map(x => x * 2)
  let evens = numbers.filter(x => x mod 2 == 0)
  let sum = numbers.foldl(a + b)
  
  echo "Исходный: ", numbers
  echo "Удвоенный: ", doubled
  echo "Четные: ", evens
  echo "Сумма: ", sum