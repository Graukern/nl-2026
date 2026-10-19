# Специфические конструкции: шаблоны и макросы
import std/macros

# Шаблон (подстановка на этапе компиляции)
template debugLog(msg: untyped) =
  echo "[DEBUG] ", msg

# Макрос (работа с AST на этапе компиляции)
macro repeatPrint(msg: string, count: static int): untyped =
  result = newStmtList()
  for i in 0..<count:
    result.add quote do:
      echo `msg`, " (итерация ", `i`, ")"

proc run*() =
  echo "06. Специфические конструкции (метапрограммирование)"
  
  debugLog("Это шаблон, он подставляет код.")
  
  echo "Вызов макроса:"
  repeatPrint("Привет от макроса", 3)