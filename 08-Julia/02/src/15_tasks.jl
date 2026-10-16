# Слайд 15. Конкурентность: Tasks

println("Запускаем @async-задачу...")

task = @async begin
    sleep(1)
    println("done")
    return 42
end

wait(task)
println("Задача завершена")

# fetch(task) возвращает результат задачи
println("Результат через fetch: ", fetch(task))
