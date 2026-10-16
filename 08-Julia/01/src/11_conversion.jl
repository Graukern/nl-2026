# Слайд 11. Преобразование типов

println("Int64(3.0) = ", Int64(3.0))
println("Float64(5) = ", Float64(5))
println("typeof(Int64(3.0)) = ", typeof(Int64(3.0)))
println("convert(Float64, 5) = ", convert(Float64, 5))

println("parse(Int, \"42\") = ", parse(Int, "42"))
println("string(42) = ", string(42))

println("2 + 3.0 = ", 2 + 3.0)
println("promote(2, 3.0) = ", promote(2, 3.0))

# Этот вызов намеренно оставлен закомментированным: он завершится InexactError,
# потому что 3.14 нельзя точно представить как Int64.
# Int64(3.14)
