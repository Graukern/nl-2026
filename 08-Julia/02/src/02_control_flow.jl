# Слайд 2. Управление потоком

x = 10

if x > 0
    println("positive")
elseif x == 0
    println("zero")
else
    println("negative")
end

status = x > 0 ? "positive" : "non-positive"
println("status = ", status)

action() = println("action() выполнена")
fallback() = println("fallback() выполнена")

condition = true
condition && action()
condition || fallback()

condition = false
condition && action()
condition || fallback()
