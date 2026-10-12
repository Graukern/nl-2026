# Haskell. Часть 1

## 

## Файлы

* Haskell 1.pdf — PDF первой части.
* src — короткие иллюстрации конструкций Haskell.
* references.md — источники о языке и его реализации.

## 

## Запуск примеров

Установите GHC через https://www.haskell.org/ghcup/. Откройте терминал в каталоге src.

```text
ghc --version
runghc -XHaskell2010 Hello.hs
runghc -XHaskell2010 Iteration.hs
ghci -XHaskell2010 Basics.hs
```

Hello.hs выводит `Hello, Haskell!`. Iteration.hs выводит числа 1, 2, 3, каждое на новой строке. В GHCi доступны выражения `add 2 3`, `signLabel (-1)`, `sumList \[2,3,4]` и `take 5 naturals`. Команда `:quit` завершает сеанс.

Types.hs иллюстрирует type, newtype, data и разделение неизменяемых данных. Functions.hs иллюстрирует входные и выходные значения функций. Их можно загрузить в GHCi по аналогии с Basics.hs.

## Десять самостоятельных примеров

Файлы p01\_types.hs — p10\_iterators.hs содержат отдельные запускаемые демонстрации по темам первой части. Каждый файл запускают отдельно через runghc. Команды, связь со слайдами и ожидаемый вывод находятся в src/Примеры — запуск и результаты.md. Все десять примеров проверены локально на GHC 9.0.1.

