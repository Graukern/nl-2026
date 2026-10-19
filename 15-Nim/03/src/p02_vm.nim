# Виртуальная машина компилятора (CTFE)

proc compileTimeCalc(): int =
  var sum = 0
  for i in 1..10:
    sum += i
  result = sum

# Этот блок выполняется КОМПИЛЯТОРОМ (до запуска программы)
static:
  echo "02. Виртуальная машина (VM). Компиляция"
  echo "Это сообщение выводится во время компиляции, а не в рантайме."
  let compileTimeResult = compileTimeCalc()
  echo "Результат вычислений в VM: ", compileTimeResult
  echo "" # Пустая строка, чтобы отделить от вывода программы

# Это выполняется уже в РАНТАЙМЕ (когда программа запущена)
proc run*() =
  echo "02. Виртуальная машина (VM). Рантайм"
  echo "Если вы видите это, значит программа запущена в рантайме."
  echo "Nim VM используется для CTFE (Compile-Time Function Execution)."