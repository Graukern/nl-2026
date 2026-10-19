# Протокол-ориентированное программирование (Концепты)
type
  Comparable = concept a, b
    # Концепт требует, чтобы для типа были определены операторы < и ==
    a < b is bool
    a == b is bool

# Процедура, которая принимает только типы, удовлетворяющие концепту
proc findMax[T: Comparable](items: openArray[T]): T =
  if items.len == 0:
    raise newException(ValueError, "пустая коллекция")
  result = items[0]
  for item in items:
    if result < item:
      result = item

proc run*() =
  echo "05. Протокол-ориентированное программирование"
  echo "Используем концепт Comparable."
  
  let ints = @[3, 7, 1, 9, 4]
  let strings = @["apple", "banana", "cherry"]
  
  echo "Максимум в ints: ", findMax(ints)
  echo "Максимум в strings: ", findMax(strings)
