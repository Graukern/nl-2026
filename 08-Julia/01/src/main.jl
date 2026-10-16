# Основные демонстрации первой презентации Julia.
# Запуск: julia main.jl

examples = [
    "05_jit.jl",
    "08_hello.jl",
    "09_types.jl",
    "10_operations.jl",
    "11_conversion.jl",
    "12_collections.jl",
    "13_scope_demo.jl",
    "13_hard_local.jl",
    "14_functions.jl",
    "15_multiple_dispatch.jl",
    "16_broadcasting.jl",
]

for file in examples
    println("\n", "="^68)
    println("RUNNING: ", file)
    println("="^68)
    include(joinpath(@__DIR__, file))
end
