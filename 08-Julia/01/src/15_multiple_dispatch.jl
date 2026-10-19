# Слайд 15. Multiple Dispatch

abstract type Shape end

struct Circle <: Shape
    radius::Float64
end

struct Rectangle <: Shape
    width::Float64
    height::Float64
end

area(c::Circle) = π * c.radius^2
area(r::Rectangle) = r.width * r.height

println("area(Circle(5.0)) = ", area(Circle(5.0)))
println("area(Rectangle(3.0, 4.0)) = ", area(Rectangle(3.0, 4.0)))

# Диспетчеризация действительно учитывает типы ВСЕХ аргументов.
# intersect уже существует в Base, поэтому явно расширяем Base.intersect.
Base.intersect(::Circle, ::Rectangle) = "Circle → Rectangle"
Base.intersect(::Rectangle, ::Circle) = "Rectangle → Circle"

println(intersect(Circle(1.0), Rectangle(2.0, 3.0)))
println(intersect(Rectangle(2.0, 3.0), Circle(1.0)))
