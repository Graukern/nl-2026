# Слайд 12. Коллекции

# Массивы
a = [1, 2, 3]
matrix = [1 2; 3 4]

println("a = ", a, ", type = ", typeof(a))
println("a[1] = ", a[1])
println("a[1:2] = ", a[1:2])
push!(a, 4)
println("after push!: ", a)
println("matrix = ", matrix)

# Кортежи
t = (1, "hello", 3.14)
println("tuple = ", t, ", t[1] = ", t[1])

# Словари
d = Dict("a" => 1, "b" => 2)
println("dict = ", d, ", d[\"a\"] = ", d["a"])

# Диапазоны
println("1:5 -> ", collect(1:5))
println("1:2:10 -> ", collect(1:2:10))
