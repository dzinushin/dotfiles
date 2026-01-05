local opt = vim.opt
local extras = vim.o

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor.

-- indenation options
vim.opt.expandtab   = true -- use spaces instead of tabs
vim.opt.tabstop     = 2    -- number of spaces that a tab counts for
vim.opt.shiftwidth  = 2    -- number of spaces to use for indentation
vim.opt.softtabstop = 2    -- number of spaces for a tab key press

opt.smarttab = true
opt.smartindent = true
opt.autoindent = true


vim.opt.cursorline = true -- highlight current line
-- vim.o.colorcolumn = "120" -- show a reference line at given position 
vim.opt.showmode = false -- don't show the mode, since it's already in the status line

-- Keep signcolumn on by default
-- vim.opt.signcolumn = "yes"


-- line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- global yanking with the OS clipboard
vim.opt.clipboard = 'unnamedplus'

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true -- set to ignore case
opt.smartcase = true -- ignore case only when there's no Uppercase char


-- enable folding based on syntax
extras.foldmethod = "expr"
extras.foldexpr = "nvim_treesitter#foldexpr()"
-- set the default fold level (higher levels are unfolded)
extras.foldlevel = 0
-- enable folding by default (folding is turned on when the file is opened)
extras.foldenable = false

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- opt.list = true
-- opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }


-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
-- opt.confirm = true

