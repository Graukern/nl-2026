# Слайд 12. Параметрические типы

struct Point{T}
    x::T
    y::T
end

p1 = Point(1, 2)
p2 = Point(1.0, 2.0)

println("p1 = ", p1)
println("typeof(p1) = ", typeof(p1))
println("p2 = ", p2)
println("typeof(p2) = ", typeof(p2))
println("Point{Int64} == Point{Float64}: ", Point{Int64} == Point{Float64})
