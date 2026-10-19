// Слайд 10. Дополнительный пример F# из подписи слайда.
// Запуск: dotnet fsi slide_10_mutable.fsx

let mutable x = 0
x <- 7

printfn "x = %d" x

// Ожидаемый вывод:
// x = 7
