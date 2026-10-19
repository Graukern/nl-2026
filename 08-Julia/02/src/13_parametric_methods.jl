# Слайд 13. Параметрические методы

struct Point{T}
    x::T
    y::T
end

function distance(p::Point{T}) where {T<:Real}
    sqrt(p.x^2 + p.y^2)
end

println(distance(Point(3, 4)))
println(distance(Point(3.0, 4.0)))

# Point("3", "4") можно создать, но метод distance для Point{String}
# не подходит из-за ограничения T <: Real.
p_text = Point("3", "4")
println("typeof(p_text) = ", typeof(p_text))
