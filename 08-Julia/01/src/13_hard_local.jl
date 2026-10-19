# Слайд 13. Локальные области: цикл внутри функции и let

function loop_scope_demo()
    total = 0
    for i in 1:3
        local_value = i
        total += local_value
    end
    println("sum inside function = ", total)
end

loop_scope_demo()

x = 10
let x = 100
    println("Inside let: $x")
end
println("After let: $x")
