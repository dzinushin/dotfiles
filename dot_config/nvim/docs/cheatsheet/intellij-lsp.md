# intellij-lsp — шпаргалка

Java/Kotlin через `intellij-server` (движок IDEA по LSP), плагин `JetBrains/intellij-lsp.nvim`,
конфиг — `lua/plugins/intellij-lsp.lua`. Проект в pre-alpha: клавиши и команды могут
поменяться — сверяться с `:help intellij-lsp`. В скобках — аналог в IDEA.

Плагин включается, только если nvim запущен внутри Maven/Gradle-проекта (`pom.xml`,
`build.gradle(.kts)`, `settings.gradle(.kts)` в каталоге или выше). `:cd` в проект из уже
открытого nvim его не подгрузит — нужен перезапуск (`:restart`).

## Код: навигация и правка

Работают только в Java/Kotlin-буферах, где подключился сервер.

| Клавиши | Что делает |
|---|---|
| `gd` | к определению (Ctrl-B); в jar/JDK — декомпилированный исходник |
| `grr` | использования с живым превью (Alt-F7), см. ниже |
| `gri` / `grt` | реализации (Ctrl-Alt-B) / определение типа |
| `K` | документация (Ctrl-Q) |
| `gra` | intentions и quick fixes IDEA (Alt-Enter); варианты и live templates — на месте |
| `grn` | переименовать (Shift-F6) |
| `<leader>ts` / `<leader>tu` | подтипы / супертипы (Ctrl-H) |
| `<leader>ci` / `<leader>co` | входящие / исходящие вызовы (Ctrl-Alt-H) |
| `<leader>ws` | символ по проекту: классы, методы, поля (Ctrl-Alt-Shift-N) |
| `<leader>lf` / `:IntellijLspFormat` | форматировать форматтером IDEA (Ctrl-Alt-L) |
| `(` / `,` в insert | подсказка параметров вызова (Ctrl-P) |
| `<CR>` в insert | принять элемент дополнения; без меню — новая строка |
| `]d` / `[d` | следующая / предыдущая ошибка (F2) |

### Список ссылок (`grr`)

| Клавиши | Что делает |
|---|---|
| `j` / `k` | по ссылкам, редактор показывает каждую |
| `<CR>` | перейти и закрыть список |
| `q` / `<Esc>` | закрыть и вернуться туда, где нажат `grr` |

## Запуск и отладка

Нужен `nvim-dap`. Перед запуском проект собирается build-тулом (`build_before_run`).

| Клавиши | Что делает |
|---|---|
| `<leader>rr` / `:IntellijLspRun` | запустить main-класс под курсором (Ctrl-Shift-F10); `:IntellijLspRun!` — без сборки |
| `<leader>rl` | выполнить code lens строки (Run / Debug над `main`) |
| `<leader>rd` | отладить класс под курсором (Ctrl-Shift-F9) |
| `:IntellijLspRunStop` | остановить сборку или программу (Ctrl-F2) |
| `<leader>b` / `<leader>B` | точка останова / с условием (Ctrl-F8) |
| `<leader>dc` | продолжить (F9) |
| `<leader>dn` / `<leader>di` / `<leader>do` | step over / into / out (F8 / F7 / Shift-F8) |
| `<leader>dq` | остановить отладку |
| `<leader>de` | вычислить выражение под курсором или в выделении (Alt-F8) |
| `<leader>dw` | добавить watch |
| `<leader>dv` | панель отладки: стек, переменные, watches |

### Панель отладки (`<leader>dv`)

| Клавиши | Что делает |
|---|---|
| `j` / `k` | по фреймам стека, редактор показывает исходник |
| `<CR>` | перейти к фрейму или раскрыть переменную |
| `<Tab>`, `zo` / `zc` / `za` | раскрыть / свернуть переменную |
| `c` / `n` / `i` / `o` | continue / step over / into / out |
| `e` / `w` | вычислить выражение / добавить watch |
| `dd` | удалить watch под курсором |
| `q` / `<Esc>` | закрыть |

### Панель вывода (`:IntellijLspOutput`)

Лог импорта Maven/Gradle, вывод сборки и программы.

| Клавиши | Что делает |
|---|---|
| `<CR>` | открыть файл из стектрейса или ошибки компиляции |
| `<C-c>` | остановить сборку или программу |
| `q` / `<Esc>` | закрыть панель, программа продолжает работать |

## Git

| Команда | Что делает |
|---|---|
| `:IntellijGitStatus` | изменённые файлы; `j`/`k` показывают дифф, `<CR>` — открыть, `R` — обновить |
| `:IntellijGitDiff [rev]` | дифф файла с индексом или ревизией; `]c` / `[c` (или `F7` / `Shift-F7`) — по ханкам, `do` — взять чужую сторону |
| `:IntellijGitLog` | история (Alt-9) |
| `:IntellijGitBranches` | ветки; `<CR>` — checkout |

В логе: `<CR>` — коммит, `/` — фильтр по сообщению, `a` — по автору, `f` — по пути,
`r` — диапазон ревизий, `c` — сбросить фильтры, `b` — ветка, `+` — ещё коммиты.
В коммите: `j`/`k` — по файлам, `<CR>` — дифф в отдельной вкладке, `o` — файл с диска.
Везде `q` / `<Esc>` — закрыть.

## Сервер и проект

| Команда | Что делает |
|---|---|
| `:checkhealth intellij-lsp` | версия, путь, лицензия, согласия, состояние серверов |
| `:IntellijLspRestart` | перезапустить сервер |
| `:IntellijLspClearCache` | сбросить индекс и перезапустить (Invalidate Caches) |
| `:IntellijLspReload` | применить изменённые настройки к запущенному серверу |
| `:IntellijLspCompilationErrors` | ошибки компилятора по файлу — в location list |
| `:IntellijLspFileTemplate` | заполнить пустой `.java`/`.kt` по шаблону IDEA |
| `:IntellijLspLicense` | лицензия; `<Tab>` — подкоманды: `login`, `trial`, `activate`, `status`, `setup`… |

Если проект поменялся снаружи (новые зависимости в `pom.xml`/`build.gradle`) и сервер их
не видит — `:IntellijLspRestart`; если индекс сломан — `:IntellijLspClearCache`.

## Где что лежит

| Путь | Что там |
|---|---|
| `~/.local/share/nvim/intellij-lsp/server/<версия>/` | сам сервер |
| `~/.cache/nvim/intellij-lsp/<hash>/` | индекс проекта (по одному на проект) |
| `~/.cache/nvim/intellij-lsp/<hash>/system/log/intellij-server.log` | лог сервера |
| `~/.local/share/nvim/intellij-lsp/consent.json` | регион, EULA, сбор данных |
| `~/Library/Application Support/JetBrains/IntelliJServer/` | лицензия |
