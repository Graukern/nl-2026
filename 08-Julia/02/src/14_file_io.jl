# Слайд 14. Работа с файлами

path = joinpath(@__DIR__, "data.txt")

open(path, "w") do io
    println(io, "Hello, Julia!")
end

text = read(path, String)
println(text)

println("Построчно:")
for line in eachline(path)
    println(line)
end

rm(path; force=true)
