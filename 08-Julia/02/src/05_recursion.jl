# Слайд 5. Рекурсия

function factorial(n)
    n <= 1 && return 1
    n * factorial(n - 1)
end

println("factorial(5) = ", factorial(5))
