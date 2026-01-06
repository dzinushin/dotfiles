## nvim directories:

```
~/.config/nvim
~/.local/{state,share}/nvim
```

## package manager

Lazy nvim package manager: https://github.com/folke/lazy.nvim


## Examples of nvim configuration:

https://github.com/nvim-lua/kickstart.nvim

https://github.com/omerxx/dotfiles

https://github.com/ThePrimeagen/init.lua

https://github.com/IlyasYOY/dotfiles

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

## Plugins

https://github.com/nvim-telescope/telescope.nvim
https://github.com/nvim-treesitter/nvim-treesitter
https://github.com/mistweaverco/kulala.nvim https://neovim.getkulala.net/
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

## rtp

runtimepath rtp

:h rtp


:so :sources  -- source file

## Lua in nvim

vim.g
vim.keymap
vim.api
vim.cmd
