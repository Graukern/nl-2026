# Слайд 16. Потоки: Threads
# Рекомендуемый запуск:
#   julia --threads auto 16_threads.jl
# или:
#   julia -t auto 16_threads.jl

using Base.Threads

println("nthreads() = ", nthreads())

Threads.@threads for i in 1:8
    println("i=$i on thread $(threadid())")
end

println("Порядок строк выше не гарантирован.")
