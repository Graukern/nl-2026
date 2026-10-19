# Слайд 14. Функции

# Полная форма
function add(x, y)
    x + y
end

# Однострочная форма
square(x) = x^2

# Анонимная функция
anonymous_add = (x, y) -> x + y

# Аргумент по умолчанию
f(x, y = 10) = x + y

# Ключевой аргумент
g(x; power = 2) = x^power

# Переменное число аргументов
h(args...) = sum(args)

println("add(2, 3) = ", add(2, 3))
println("square(5) = ", square(5))
println("anonymous_add(4, 6) = ", anonymous_add(4, 6))
println("f(5) = ", f(5))
println("g(3; power=3) = ", g(3; power = 3))
println("h(1, 2, 3, 4) = ", h(1, 2, 3, 4))
println("map(sqrt, [1, 4, 9]) = ", map(sqrt, [1, 4, 9]))
