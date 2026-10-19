# Слайд 8. Создание ошибок и @assert

function divide(a, b)
    b == 0 && throw(ArgumentError("b must not be zero"))
    a / b
end

println("divide(10, 2) = ", divide(10, 2))

try
    divide(10, 0)
catch e
    println("Поймано исключение: ", typeof(e), " — ", e)
end

try
    error("Something went wrong")
catch e
    println("error() создаёт: ", typeof(e))
end

x = 5
@assert x > 0 "x must be positive"
println("@assert пройден")
