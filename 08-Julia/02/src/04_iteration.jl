# Слайд 4. Итерация в Julia

collection = [10, 20, 30]

println("Обычный for:")
for value in collection
    println(value)
end

println("\nЭквивалент через iterate():")
itr = iterate(collection)
while itr !== nothing
    value, state = itr
    println(value)
    itr = iterate(collection, state)
end

println("\nДругие итерируемые объекты:")
for value in 1:3
    print(value, " ")
end
println()

for ch in "Julia"
    print(ch, " ")
end
println()
