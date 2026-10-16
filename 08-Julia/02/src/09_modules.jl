# Слайд 9. Модули и пространства имён

module Geometry
export area

area(r) = π * r^2
circumference(r) = 2π * r

end

using .Geometry

println("area(2) = ", area(2))
println("Geometry.circumference(2) = ", Geometry.circumference(2))
