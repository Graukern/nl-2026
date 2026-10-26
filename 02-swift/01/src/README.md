# Запуск примеров Swift

## Требования

Для выполнения программ необходим один из следующих вариантов:

- локально установленный **Swift 6.x**;
- **Docker** с возможностью запуска Linux-контейнеров;
- онлайн-компилятор Swift и доступ в интернет.

Для воспроизводимого запуска рекомендуется **Swift 6.4.0**. Во всех консольных командах используется языковой режим `-swift-version 6`. Внешние библиотеки и Swift Package Manager не требуются: каждый `.swift`-файл запускается отдельно.

Команды локального запуска и Docker выполняются в терминале **из каталога с файлами `.swift` и этим README.md**.

## 1. Локальный запуск

### Установка Swift

**macOS.** Установите Swift через [Swiftly](https://www.swift.org/install/macos/):

```bash
curl -O https://download.swift.org/swiftly/darwin/swiftly.pkg
installer -pkg swiftly.pkg -target CurrentUserHomeDirectory
~/.swiftly/bin/swiftly init --quiet-shell-followup
. "${SWIFTLY_HOME_DIR:-$HOME/.swiftly}/env.sh"
swiftly install --use 6.4.0
```

Если Swift уже установлен вместе с Xcode, повторная установка может не потребоваться. Проверьте версию компилятора командой `swift --version`.

**Linux.** Установите Swift через [Swiftly](https://www.swift.org/install/linux/):

```bash
curl -O "https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz"
tar -xzf "swiftly-$(uname -m).tar.gz"
./swiftly init --quiet-shell-followup
. "${SWIFTLY_HOME_DIR:-$HOME/.local/share/swiftly}/env.sh"
swiftly install --use 6.4.0
```

Установщик сообщит, если потребуются системные зависимости.

**Windows.** Используйте [официальную установку через WinGet](https://www.swift.org/install/windows/) в PowerShell. Сначала установите необходимые компоненты Visual Studio и Windows SDK, затем Swift:

```powershell
winget install --id Microsoft.VisualStudio.2022.Community --exact --force --custom "--add Microsoft.VisualStudio.Component.Windows11SDK.22621 --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.VC.Tools.ARM64" --source winget
winget install --id Swift.Toolchain -e --source winget
```

После установки откройте новый терминал. Альтернативный вариант для Windows — WSL 2 с Ubuntu и установкой Swift по инструкции для Linux.

Проверка установленной версии на любой платформе:

```bash
swift --version
```

### Запуск

Из каталога с примерами выполните:

```bash
swift -swift-version 6 first_program.swift
```

Для другого примера укажите соответствующее имя файла:

```bash
swift -swift-version 6 arrays.swift
```

Пример с аргументом командной строки:

```bash
swift -swift-version 6 console_io.swift "Коллекции"
```

После запуска `console_io.swift` введите в терминале неотрицательное целое число и нажмите Enter. Название раздела берётся из аргумента `"Коллекции"`; без аргумента используется `"Основы"`.

### Компиляция в исполняемый файл

На macOS и Linux:

```bash
swiftc -swift-version 6 -warnings-as-errors first_program.swift -o first_program
./first_program
```

На Windows (PowerShell):

```powershell
swiftc -swift-version 6 -warnings-as-errors first_program.swift -o first_program.exe
.\first_program.exe
```

Не компилируйте все примеры одновременно: каждый файл является самостоятельной программой.

## 2. Запуск через Docker

Установите Docker для своей платформы:

- [Docker Desktop для macOS](https://docs.docker.com/desktop/setup/install/mac-install/);
- [Docker Desktop для Windows](https://docs.docker.com/desktop/setup/install/windows-install/) с включёнными Linux-контейнерами;
- [Docker Engine для Linux](https://docs.docker.com/engine/install/).

Запустите Docker и проверьте доступность команд:

```bash
docker --version
docker info
```

Загрузите официальный образ Swift:

```bash
docker pull swift:6.4.0-noble
```

**macOS и Linux (Bash, zsh):**

```bash
docker run --rm -it \
  --mount "type=bind,source=${PWD},target=/work" \
  --workdir /work \
  swift:6.4.0-noble \
  swift -swift-version 6 first_program.swift
```

**Windows (PowerShell):**

```powershell
docker run --rm -it --mount "type=bind,source=${PWD},target=/work" --workdir /work swift:6.4.0-noble swift -swift-version 6 first_program.swift
```

Имя `first_program.swift` можно заменить на имя любого другого примера.

Для программы с аргументом и вводом с клавиатуры используйте:

```bash
docker run --rm -it --mount "type=bind,source=${PWD},target=/work" --workdir /work swift:6.4.0-noble swift -swift-version 6 console_io.swift "Коллекции"
```

После запуска введите количество задач и нажмите Enter. Параметр `-it` необходим для интерактивного ввода в контейнере.

## 3. Запуск в онлайн-компиляторе

Без установки Swift или Docker можно использовать:

- [OneCompiler](https://onecompiler.com/swift);
- [SwiftFiddle](https://swiftfiddle.com/).

Порядок выполнения:

1. Откройте онлайн-компилятор.
2. Скопируйте содержимое **одного** `.swift`-файла в редактор.
3. Выберите доступную версию Swift 6, если сервис позволяет выбирать версию.
4. Нажмите **Run** и проверьте вывод программы.

Для `console_io.swift` в **OneCompiler** число можно указать в поле **STDIN** на вкладке ввода-вывода. Передача аргументов командной строки зависит от возможностей сервиса: если аргумент не указан, пример использует раздел `"Основы"`.

Онлайн-сервисы могут использовать другую версию компилятора и ограничивать ввод или время выполнения. Для проверки именно на Swift 6.4.0 используйте локальный компилятор соответствующей версии либо Docker-образ, указанный выше.
