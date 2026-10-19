# Слайд 17. Управление памятью

a = [1, 2, 3]
println("До push!: ", a)
push!(a, 4)
println("После push!: ", a)

# ! — соглашение об имени: функция обычно изменяет один из аргументов.

struct ImmutablePoint
    x::Int
    y::Int
end

mutable struct Counter
    value::Int
end

p = ImmutablePoint(1, 2)
c = Counter(0)
c.value += 1

println("ImmutablePoint: ", p)
println("Mutable Counter: ", c)

# Обычно вручную запускать GC не требуется. Этот вызов только демонстрационный.
GC.gc()
println("GC.gc() вызван демонстрационно")
