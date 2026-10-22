# Концепции Neovim

Базовые механизмы, на которых держится этот конфиг. Neovim 0.12, конфиг на Lua,
плагины через lazy.nvim. У каждого раздела — где читать подробнее в `:h`.

## Порядок старта

`:h startup`

1. Встроенные дефолты: `default-mappings` (`grr`, `gra`, `]d`…), `default-autocmds`.
2. Пользовательский конфиг — `init.lua`. В этом конфиге:
   ```lua
   vim.g.loaded_netrw = 1      -- до плагинов, иначе netrw успевает нарисовать листинг
   require("config.options")
   require("config.lazy")      -- lazy.setup: ставит и подключает плагины
   require("config.keymaps")
   require("config.autocmds")
   ```
3. Скрипты `plugin/` из всех каталогов runtimepath, затем из `after/plugin/`.
4. Открываются файлы из командной строки, срабатывают `VimEnter` и `UIEnter`.

Замер старта:

```sh
nvim --startuptime /tmp/startup.log
```

```vim
:Lazy profile
```

## Каталоги: stdpath

`:h stdpath()`, `:h base-directories`

| `stdpath(...)` | Путь | Что там |
|---|---|---|
| `config` | `~/.config/nvim` | этот конфиг (симлинк на `~/dotfiles/dot_config/nvim`) |
| `data` | `~/.local/share/nvim` | плагины lazy, серверы mason, бандл intellij-server |
| `state` | `~/.local/state/nvim` | shada, undo, swap, логи (`lsp.log`) |
| `cache` | `~/.cache/nvim` | байткод `luac`, индексы intellij-lsp |

```vim
:lua =vim.fn.stdpath("data")
```

### Отдельный конфиг рядом: NVIM_APPNAME

`:h $NVIM_APPNAME`

```sh
NVIM_APPNAME=nvim-scratch nvim
```

Все четыре каталога берутся с другим именем: `~/.config/nvim-scratch`,
`~/.local/share/nvim-scratch` и так далее. Так пробуют чужой конфиг (kickstart) или
отлаживают свой с нуля, не задевая рабочий. Совсем без конфига и плагинов — `nvim --clean`.

## Опции

`:h options`, `:h lua-guide-options`

| API | Аналог | Что это |
|---|---|---|
| `vim.o.tabstop = 4` | `:set` | значение как есть: строка, число, boolean |
| `vim.opt.tabstop = 4` | `:set` | объект: списки и словари задаются Lua-таблицами |
| `vim.opt_local.*` | `:setlocal` | только для текущего буфера или окна |
| `vim.go.*` | `:setglobal` | только глобальное значение |
| `vim.bo[buf].*` / `vim.wo[win].*` | | опция конкретного буфера / окна |

`vim.opt` нужен для опций-списков:

```lua
vim.opt.wildignore:append({ "*.class", "target/" })
vim.opt.shortmess:remove("I")
print(vim.inspect(vim.opt.wildignore:get())) -- Lua-таблица, а не строка через запятую
```

Кто и где последним поменял опцию:

```vim
:verbose set tabstop?
```

## Runtime path

`:h 'runtimepath'`, `:h runtimepath`

Список каталогов, в которых Neovim ищет файлы по соглашению: конфиг, каталоги плагинов,
`$VIMRUNTIME`, в конце — их `after/`.

```vim
:set rtp?
:lua =vim.api.nvim_list_runtime_paths()
```

Что Neovim берёт из каждого каталога:

| Каталог | Когда используется |
|---|---|
| `plugin/` | исполняется на старте, всё подряд |
| `lua/` | ничего не исполняется само — только по `require` |
| `ftplugin/<ft>.lua` | при открытии файла типа `<ft>` |
| `after/` | то же самое, но после всех остальных — чтобы переопределить плагины |
| `lsp/<name>.lua` | конфиг сервера для `vim.lsp.config` / `vim.lsp.enable` |
| `colors/` | `:colorscheme` |
| `queries/` | запросы treesitter (подсветка, отступы, текстобъекты) |
| `doc/` | `:help`; теги собирает `:helptags`, только из `.txt` |

Какие скрипты уже загружены и в каком порядке:

```vim
:scriptnames
```

### Добавить свой каталог

```lua
vim.opt.rtp:append(vim.fn.expand("~/packages/foo"))
```

**В этом конфиге так не сработает:** lazy.nvim на `setup` сбрасывает runtimepath
(`performance.rtp.reset = true` по умолчанию) и строку выше выкинет. Варианты:

```lua
-- как локальный плагин: lazy подключит и plugin/, и lua/
{ dir = "~/packages/foo" }

-- или оставить путь в rtp после сброса
require("lazy").setup({
  performance = { rtp = { paths = { vim.fn.expand("~/packages/foo") } } },
})
```

## Модули: require

`:h lua-module-load`, `:h require()`

`require("a.b")` ищет по runtimepath:

```
{rtp}/lua/a/b.lua
{rtp}/lua/a/b/init.lua
```

Поэтому `require("config.options")` находит `lua/config/options.lua` этого конфига.

Модуль исполняется один раз, результат кешируется в `package.loaded`. Повторный `require`
и `:source` уже загруженного модуля код не перечитывают. Перезагрузить вручную:

```lua
package.loaded["config.keymaps"] = nil
require("config.keymaps")
```

Проще перезапустить редактор с восстановлением сессии — `:restart`.

## Маппинги

`:h vim.keymap.set()`, `:h map-overview`

```lua
vim.keymap.set("n", "<leader>x", "<cmd>.lua<cr>", { desc = "source current line" })
vim.keymap.set({ "n", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "save file" })
vim.keymap.set("n", "q", "<cmd>q<cr>", { buf = args.buf }) -- только в этом буфере
```

- `desc` показывает which-key.
- `<cmd>…<cr>` не переключает режим и не мигает командной строкой, в отличие от `:…<cr>`.
- `expr = true` — правая часть-функция возвращает клавиши, которые надо нажать
  (так сделаны `<Tab>`/`<S-Tab>` для меню дополнения в `keymaps.lua`).

Кто занял клавишу:

```vim
:verbose map <leader>b
:verbose imap <Tab>
```

## Автокоманды

`:h autocmd`, `:h lua-guide-autocommands`

```lua
local group = vim.api.nvim_create_augroup("HelpWindow", {}) -- clear = true по умолчанию
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "help",
  callback = function(args)
    -- args.buf, args.file, args.match, args.data
  end,
})
```

Группа с `clear = true` при повторном создании удаляет свои старые автокоманды — без неё
каждый `:source` добавлял бы дубль.

Маппинги LSP вешаются из `LspAttach`, а не глобально: событие приходит, когда сервер
подключился к буферу, и в `args.data.client_id` — какой именно. Так `gra`/`<leader>lr`
есть только там, где их есть кому обработать.

```vim
:au LspAttach   " список автокоманд события
```

## Пользовательские команды

`:h nvim_create_user_command()`

```lua
vim.api.nvim_create_user_command("RuntimePath", function()
  for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
    print(path)
  end
end, { desc = "print runtimepath, one per line" })

vim.api.nvim_create_user_command("Grep", function(args)
  require("telescope.builtin").grep_string({ search = args.args })
end, { nargs = 1 })
```

Что приходит в `args`: `args.args` — строка аргументов, `args.fargs` — они же списком,
`args.bang` — была ли `!`, `args.line1`/`args.line2` — диапазон при `range = true`.

## LSP

`:h lsp-quickstart`, `:h lsp-config`

С 0.11 серверы описываются без nvim-lspconfig в роли «фабрики»:

```lua
vim.lsp.config("lua_ls", { settings = { … } }) -- дополнить или переопределить конфиг
vim.lsp.enable("lua_ls")                         -- запускать на подходящих файлах
```

Базовые конфиги лежат в `lsp/*.lua` внутри nvim-lspconfig (это обычный каталог в rtp).
`enable` в этом конфиге делает mason-lspconfig (`automatic_enable`) для всего, что
поставлено через mason; intellij-lsp поднимает свой сервер сам.

```vim
:checkhealth vim.lsp   " какие клиенты подключены к буферу, конфиги, лог
:lsp restart           " перезапустить серверы буфера (ещё: enable, disable, stop)
```

## Отладка

| Команда | Что показывает |
|---|---|
| `:checkhealth` / `:checkhealth <plugin>` | проблемы окружения и плагинов |
| `:messages` | пропущенные сообщения и ошибки |
| `:lua =expr` | значение Lua-выражения через `vim.inspect` |
| `:verbose set <opt>?`, `:verbose map <key>` | кто и где задал опцию или маппинг |
| `:scriptnames` | загруженные скрипты по порядку |
| `:Inspect` | группы подсветки и treesitter-узел под курсором |
| `:InspectTree` | дерево treesitter для буфера |
| `:Lazy`, `:Lazy profile` | состояние плагинов, время их загрузки |
| `nvim --clean` | Neovim без конфига — проверить, виноват ли конфиг |
