# Слайд 10. using, import и export

module DemoTools
export square

square(x) = x^2
cube(x) = x^3

end

# using импортирует экспортированные имена для неквалифицированного вызова
using .DemoTools
println("square(4) = ", square(4))

# Неэкспортированное имя доступно через квалификацию
println("DemoTools.cube(3) = ", DemoTools.cube(3))

# import конкретного имени позволяет расширять функцию новыми методами
import .DemoTools: cube
cube(s::AbstractString) = repeat(s, 3)

println("cube(\"ha\") = ", cube("ha"))
