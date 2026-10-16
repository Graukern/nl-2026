# Слайд 16. Broadcasting

x = [1, 2, 3]

println("x .^ 2 = ", x .^ 2)
println("x .+ 10 = ", x .+ 10)

f(x) = x^2 + 1
println("f.(x) = ", f.(x))

y = [0, 0, 0]
y .= x .+ 1
println("y after y .= x .+ 1 -> ", y)

# Несколько точечных операций могут быть слиты в один цикл (dot fusion).
println("2 .* x .+ 1 = ", 2 .* x .+ 1)
