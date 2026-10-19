# Запуск всех демонстрационных файлов второй презентации.
# Каждый пример запускается в отдельном процессе Julia, чтобы определения
# типов и модулей из разных файлов не конфликтовали друг с другом.

files = [
    "02_control_flow.jl",
    "03_loops.jl",
    "04_iteration.jl",
    "05_recursion.jl",
    "06_closures.jl",
    "07_exceptions.jl",
    "08_errors_assert.jl",
    "09_modules.jl",
    "10_using_import_export.jl",
    "11_pkg.jl",
    "12_parametric_types.jl",
    "13_parametric_methods.jl",
    "14_file_io.jl",
    "15_tasks.jl",
    "17_memory.jl",
]

julia = Base.julia_cmd()

for file in files
    path = joinpath(@__DIR__, file)
    println("\n", "="^72)
    println("RUN: ", file)
    println("="^72)
    run(`$julia $path`)
end

println("\n", "="^72)
println("RUN: 16_threads.jl с --threads=auto")
println("="^72)
run(`$julia --threads=auto $(joinpath(@__DIR__, "16_threads.jl"))`)
