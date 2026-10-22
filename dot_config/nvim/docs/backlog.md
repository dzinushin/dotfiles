# Backlog

Идеи по конфигу nvim и документации, отложенные на потом. Сверху — что полезнее.

## Конфиг

- **`.ideavimrc` в dotfiles** — те же клавиши в IDEA через IdeaVim: `<leader>ff`/`fg`,
  `grr`/`gra`/`grn`/`gri`, `]d`/`[d`, `<leader>sv`/`sh`, `<C-q>`, `<C-h>`/`<C-l>` и т.д.
  как действия IDEA, чтобы мышечная память не расходилась между редакторами.
  Образец — `PakhomovAlexander/config.ideavim` из README.
- **intellij-lsp: двойное включение дополнения.** `LspAttach` в `plugins/lsp.lua` вызывает
  `vim.lsp.completion.enable(..., { autotrigger = true })` и для клиента intellij-lsp, который
  включает его сам по своей опции `autotrigger`. Сейчас безвредно; если `autotrigger = false`
  в плагине понадобится — пропускать его клиент в `LspAttach` по `client.name`.
- **intellij-lsp: подгрузка после `:cd`.** `cond` проверяет только каталог старта; при
  `:cd` в проект из открытого nvim плагин не грузится. Если начнёт мешать — грузить по
  `DirChanged` / `BufReadPre` с проверкой `vim.fs.root`.
- **lazygit для текущего файла** — `Snacks.lazygit.log_file()` на `<leader>gL`
  (история файла, Show History в IDEA).

## Документация

- **Оглавление `docs/README.md`** — список docs и шпаргалок переезжает из главного
  README; `<leader>ec` открывает сначала его.
- **Сверить клавиши lazygit в `cheatsheet/git.md`** — писались по памяти, не по
  исходникам; проверить по `?` в lazygit.
- **Актуальность `cheatsheet/intellij-lsp.md`** — плагин в pre-alpha, клавиши и команды
  могут меняться: после `:Lazy update` сверять с `:help intellij-lsp`.
