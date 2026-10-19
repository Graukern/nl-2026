# Слайд 3. Циклы

println("for:")
for i in 1:5
    println(i)
end

println("\nwhile:")
i = 1
while i <= 5
    println(i)
    i += 1
end

println("\nbreak / continue:")
for i in 1:6
    i == 2 && continue
    i == 5 && break
    println(i)
end

println("\nВложенный цикл:")
for i in 1:2, j in 1:3
    println("i=$i, j=$j")
end
