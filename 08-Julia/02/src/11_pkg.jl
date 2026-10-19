# Слайд 11. Пакеты и Pkg
# Этот пример безопасно показывает текущее окружение и не устанавливает пакеты.

using Pkg

println("Активный проект:")
println(Base.active_project())
println("\nСтатус окружения:")
Pkg.status()

println("\nКоманды из презентации:")
println("Pkg.add(\"Example\")")
println("Pkg.instantiate()")
println("Запуск проекта: julia --project=.")
