# Слайд 7. Исключения

try
    value = parse(Int, "abc")
    println(value)
catch e
    println("Ошибка: ", typeof(e))
finally
    println("Готово")
end

println("\nЕщё несколько типов исключений:")
examples = [
    () -> [1, 2][10],
    () -> sqrt(-1.0),
    () -> Int64(3.14),
]

for f in examples
    try
        f()
    catch e
        println(typeof(e))
    end
end
