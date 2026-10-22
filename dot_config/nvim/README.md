## nvim directories:

```
~/.config/nvim
~/.local/{state,share}/nvim
```

## docs

- [concepts.md](docs/concepts.md) — как устроен nvim: старт, каталоги, опции, rtp, require, маппинги, автокоманды, LSP, отладка
- [backlog.md](docs/backlog.md) — отложенные идеи по конфигу и документации

## cheatsheets

- [navigation.md](docs/cheatsheet/navigation.md) — навигация по коду: LSP, прыжки, поиск файлов
- [editing.md](docs/cheatsheet/editing.md) — редактирование: операторы, текстовые объекты, регистры, макросы, замена
- [windows.md](docs/cheatsheet/windows.md) — буферы, окна, вкладки, quickfix, замена по проекту
- [git.md](docs/cheatsheet/git.md) — git: какой инструмент для чего, mini.diff, lazygit, telescope, neo-tree, intellij-lsp
- [telescope.md](docs/cheatsheet/telescope.md) — пикеры, клавиши внутри пикера, file browser
- [neo-tree.md](docs/cheatsheet/neo-tree.md) — дерево файлов: ходьба, открытие, файловые и git-операции
- [intellij-lsp.md](docs/cheatsheet/intellij-lsp.md) — Java/Kotlin через intellij-server: код, run/debug, git, сервер

## package manager

Lazy nvim package manager: https://github.com/folke/lazy.nvim


## Examples of nvim configuration:

https://github.com/nvim-lua/kickstart.nvim

https://github.com/omerxx/dotfiles

https://github.com/ThePrimeagen/init.lua

https://github.com/IlyasYOY/dotfiles

https://github.com/adibhanna/nvim

https://github.com/tjdevries/advent-of-nvim

https://github.com/benfrain/neovim/tree/main

https://github.com/PakhomovAlexander/config.nvim
https://github.com/PakhomovAlexander/config.ideavim

https://github.com/ppcamp/nvim

https://beacons.ai/henrymisc
https://github.com/hendrikmi/dotfiles

https://github.com/CodeOpsHQ/dotfiles

https://github.com/hendrikmi/dotfiles

https://github.com/radleylewis/nvim-lite

https://github.com/adibhanna/nvim

https://github.com/Sin-cy/dotfiles

https://www.youtube.com/watch?v=SSf5T8QsBYo
https://github.com/kulinsky/min-nvim-cfg

## Plugins

https://github.com/nvim-telescope/telescope.nvim
https://github.com/nvim-treesitter/nvim-treesitter
https://github.com/nvim-lualine/lualine.nvim

https://github.com/folke/noice.nvim

https://github.com/stevearc/oil.nvim
https://github.com/kristijanhusak/vim-dadbod-ui

## Lua

https://neovim.io/doc/user/lua-guide.html#lua-guide
https://github.com/nanotee/nvim-lua-guide

## LSP

https://github.com/neovim/nvim-lspconfig

help lsp

## sites

https://vim-adventures.com
https://learnvim.irian.to/


## video guides

NeoVim Complete Setup Guide (Part 2: LSP, Linters, Formatters, AI Assist & Completion)
https://www.youtube.com/watch?v=qp1OcolI6x0


https://www.youtube.com/@sam_natale/videos


The Ultimate Neovim Setup Guide From Scratch
https://www.youtube.com/watch?v=FGVY7gbaoQI


# concepts

iI aA sS rR 
dD y
cC

Motions:
by word: wW eE
find symbol (forward/backward): fF{char} tT{char} next: ;/,

Textobject (see :h text-objects)

- word
- sentence
- paragraph

ci['"()[]{}wsp]
ca[sp]

Operator (see h: operator)
Dot-repeat (see h: .)


## folds

za - toggle fold


:so :sources  -- source file

## Lua in nvim

vim.g
vim.keymap
vim.api
vim.cmd
