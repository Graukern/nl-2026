# Параллелизм: потоки (Threads)
# ВНИМАНИЕ: Для запуска требуется флаг --threads:on
# В Nim 2.2 std/threadpool отмечен deprecated.
# Здесь он используется для демонстрации spawn / FlowVar / sync.
import std/threadpool

proc heavyCalculation(n: int): int64 =
  # Имитация сложных вычислений
  var sum: int64 = 0
  for i in 1..n:
    sum += int64(i)
  result = sum

proc run*() =
  echo "08. Параллелизм (Threads)"
  echo "Запускаем вычисления в параллельных потоках"
  
  # Сохраняем FlowVar, возвращаемые spawn
  let fv1 = spawn heavyCalculation(1000000)
  let fv2 = spawn heavyCalculation(2000000)
  
  # sync() просто ждёт завершения всех задач и ничего не возвращает
  sync()
  
  # Извлекаем результаты из FlowVar с помощью оператора ^
  let res1 = ^fv1
  let res2 = ^fv2
  
  echo "Результаты вычислений: ", res1, ", ", res2
