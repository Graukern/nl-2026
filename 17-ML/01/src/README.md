# Примеры из первой презентации по семейству ML

Основные примеры написаны на OCaml. Каждый файл `.ml` соответствует одному слайду, содержит все его примеры и запускается независимо от остальных файлов. Нумерация совпадает с PDF «Семейство языков ML. Основы и базовые конструкции».

К исходным фрагментам добавлены вывод результатов и, где нужны, демонстрационные вызовы. В конце каждого файла указан ожидаемый вывод. Фрагмент F# из подписи слайда 10 сохранён отдельно в `.fsx`.

## Файлы

| Слайд | Файл | Тема |
|---|---|---|
| 5 | [slide_05_basic_types.ml](slide_05_basic_types.ml) | Базовые типы |
| 6 | [slide_06_compound_types.ml](slide_06_compound_types.ml) | Кортеж, запись, вариант и список |
| 7 | [slide_07_operators.ml](slide_07_operators.ml) | Арифметика, сравнение, логика, строки и списки |
| 8 | [slide_08_conversions.ml](slide_08_conversions.ml) | Преобразование типов и разбор строк |
| 9 | [slide_09_scope.ml](slide_09_scope.ml) | Лексическая область видимости и затенение |
| 10 | [slide_10_shared_references.ml](slide_10_shared_references.ml) | Общая изменяемая ячейка `ref` |
| 10 | [slide_10_mutable.fsx](slide_10_mutable.fsx) | Изменяемое связывание в F# |
| 11 | [slide_11_currying.ml](slide_11_currying.ml) | Каррирование, частичное применение и аргумент-кортеж |
| 12 | [slide_12_results_and_higher_order.ml](slide_12_results_and_higher_order.ml) | Результат-кортеж и функция высшего порядка |
| 13 | [slide_13_recursion.ml](slide_13_recursion.ml) | Обычная и хвостовая рекурсия |
| 14 | [slide_14_closures.ml](slide_14_closures.ml) | Замыкание |
| 15 | [slide_15_conditionals.ml](slide_15_conditionals.ml) | Условные выражения |
| 16 | [slide_16_pattern_matching.ml](slide_16_pattern_matching.ml) | Сопоставление с образцом |
| 17 | [slide_17_loops.ml](slide_17_loops.ml) | Циклы `for` и `while` |
| 18 | [slide_18_iteration.ml](slide_18_iteration.ml) | `List.iter`, `List.map`, `List.fold_left` |
| 19 | [slide_19_blocks.ml](slide_19_blocks.ml) | Блоки и последовательность выражений |

## Запуск OCaml

База презентации: OCaml 5.4. Сторонние библиотеки не требуются. После установки OCaml откройте терминал в этой папке:

```sh
ocaml slide_11_currying.ml
```

Чтобы запустить все примеры OCaml по порядку, в macOS/Linux:

```sh
for file in slide_*.ml; do
  printf '\n%s\n' "$file"
  ocaml "$file" || break
done
```

Для просмотра выведенных компилятором типов:

```sh
ocamlc -i slide_11_currying.ml
```

Либо загрузите файл в интерактивном OCaml:

```ocaml
#use "slide_11_currying.ml";;
```

Фрагмент `(3 : float)` на слайде 8 намеренно ошибочен. В файле он оставлен в комментарии: его можно раскомментировать, чтобы увидеть ошибку типов. Факториал на слайде 13 рассчитан на неотрицательные небольшие аргументы без переполнения `int`.

## Запуск F#

Для единственного файла `.fsx` нужен .NET SDK с F# Interactive:

```sh
dotnet fsi slide_10_mutable.fsx
```

## Проверка

Фрагменты сверены с исходным кодом презентации и проверены чтением. OCaml и .NET SDK в рабочем окружении не обнаружены, поэтому запуск здесь не выполнялся. Указанный в комментариях вывод является ожидаемым.
