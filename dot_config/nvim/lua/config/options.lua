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


-- foldmethod/foldexpr выставляются пер-буферно в config/autocmds.lua:
-- глобальный treesitter-foldexpr ломает фолды там, где парсера нет
extras.foldenable = true
-- всё развёрнуто при открытии файла, но zc/za работают сразу, без :set foldenable
extras.foldlevel = 99
extras.foldlevelstart = 99
-- пустой foldtext (0.10+) оставляет подсветку свёрнутой строки вместо серой заглушки
extras.foldtext = ""
opt.fillchars:append({ fold = " ", foldopen = "⌄", foldclose = "›", foldsep = " " })

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- opt.list = true
-- opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }


-- автодополнение без плагинов (0.12): меню всплывает по мере набора,
-- источники и их приоритет задаёт 'complete'
opt.autocomplete = true
-- '.' — текущий буфер, 'o' — omnifunc (на LspAttach его занимает LSP, поэтому
-- LSP-кандидаты приходят и на голом префиксе, а не только после точки),
-- 'w'/'b' — другие окна и буферы; ^N ограничивает число кандидатов от источника
opt.complete = ".^10,o,w^5,b^5"
-- noselect здесь обязателен: без него первый кандидат не показывается в меню,
-- а вставляется в текст по мере набора ("vim." -> "vim.F"). Под 'autocomplete' он
-- включается сам, но меню поднимает ещё и vim.lsp.completion с autotrigger —
-- для него noselect нужно задать явно
-- nearest (0.12) сортирует кандидатов по близости к курсору
opt.completeopt = "menu,menuone,noselect,popup,fuzzy,nearest"
opt.pumborder = "rounded"
opt.pummaxwidth = 60

-- одна рамка на все плавающие окна: hover, signature help, диагностика, floats плагинов.
-- задавать border в каждом vim.diagnostic/lsp-вызове больше не нужно
opt.winborder = "rounded"

-- диагностика по умолчанию видна только значком в signcolumn и подчёркиванием —
-- текст ошибки показываем под строкой с курсором (virtual_lines, 0.11)
vim.diagnostic.config({
  virtual_lines = { current_line = true },
  severity_sort = true,
  float = { source = "if_many" },
})

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
-- opt.confirm = true

