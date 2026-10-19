# Конкурентность: async/await
import std/[asyncdispatch, monotimes, times, strutils]

proc simulateRequest(name: string, delayMs: int): Future[string] {.async.} =
  await sleepAsync(delayMs)
  result = "Результат от " & name

proc run*() =
  echo "07. Конкурентность (Async/Await)"
  
  proc main() {.async.} =
    let start = getMonoTime()
    echo "Запускаем 3 асинхронные задачи"
    
    let f1 = simulateRequest("Сервер A", 100)
    let f2 = simulateRequest("Сервер B", 150)
    let f3 = simulateRequest("Сервер C", 50)
    
    # Ждем завершения всех
    echo await f1
    echo await f2
    echo await f3
    
    echo "Все задачи завершены за ", ((getMonoTime() - start).inMilliseconds.float / 1000).formatFloat(ffDecimal, 3), " сек."

  waitFor main()
