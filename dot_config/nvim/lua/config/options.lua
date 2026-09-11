vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor.

-- indenation options
vim.o.expandtab   = true -- use spaces instead of tabs
vim.o.tabstop     = 2    -- number of spaces that a tab counts for
vim.o.shiftwidth  = 2    -- number of spaces to use for indentation
vim.o.softtabstop = 2    -- number of spaces for a tab key press

vim.o.smarttab = true
-- smartindent намеренно не включаем: он игнорируется везде, где выставлен
-- indentexpr (то есть во всех treesitter-филетайпах), а в остальных известен
-- тем, что утаскивает '#' в нулевую колонку
vim.o.autoindent = true


vim.o.cursorline = true -- highlight current line
-- vim.o.colorcolumn = "120" -- show a reference line at given position
vim.o.showmode = false -- don't show the mode, since it's already in the status line

-- колонка знаков всегда на месте: иначе значки mini.diff и диагностики
-- то появляются, то исчезают, и текст дёргается по горизонтали
vim.o.signcolumn = "yes"


-- line numbering
vim.o.number = true
vim.o.relativenumber = true

-- global yanking with the OS clipboard
vim.o.clipboard = "unnamedplus"

-- новое окно появляется там, куда смотрит взгляд: снизу и справа
vim.o.splitbelow = true
vim.o.splitright = true

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true -- set to ignore case
vim.o.smartcase = true -- ignore case only when there's no Uppercase char

-- история undo переживает закрытие файла; каталог (stdpath("state")/undo)
-- nvim заводит сам
vim.o.undofile = true


-- foldmethod/foldexpr выставляются пер-буферно в config/autocmds.lua:
-- глобальный treesitter-foldexpr ломает фолды там, где парсера нет
vim.o.foldenable = true
-- всё развёрнуто при открытии файла, но zc/za работают сразу, без :set foldenable
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- пустой foldtext (0.10+) оставляет подсветку свёрнутой строки вместо серой заглушки
vim.o.foldtext = ""
-- единственное место, где нужен vim.opt: у него есть :append() для списочных опций.
-- через vim.o пришлось бы переписывать всю строку fillchars целиком
vim.opt.fillchars:append({ fold = " ", foldopen = "⌄", foldclose = "›", foldsep = " " })

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.o.list = true
-- vim.o.listchars = "tab:» ,trail:·,nbsp:␣"
-- vim.o.listchars = "tab:  ,trail:·,nbsp:␣"


-- автодополнение без плагинов (0.12): меню всплывает по мере набора,
-- источники и их приоритет задаёт 'complete'
vim.o.autocomplete = true
-- '.' — текущий буфер, 'o' — omnifunc (на LspAttach его занимает LSP, поэтому
-- LSP-кандидаты приходят и на голом префиксе, а не только после точки),
-- 'w'/'b' — другие окна и буферы; ^N ограничивает число кандидатов от источника
vim.o.complete = ".^10,o,w^5,b^5"
-- noselect здесь обязателен: без него первый кандидат не показывается в меню,
-- а вставляется в текст по мере набора ("vim." -> "vim.F"). Под 'autocomplete' он
-- включается сам, но меню поднимает ещё и vim.lsp.completion с autotrigger —
-- для него noselect нужно задать явно
-- nearest (0.12) сортирует кандидатов по близости к курсору
vim.o.completeopt = "menu,menuone,noselect,popup,fuzzy,nearest"
vim.o.pumborder = "rounded"
vim.o.pummaxwidth = 60

-- одна рамка на все плавающие окна: hover, signature help, диагностика, floats плагинов.
-- задавать border в каждом vim.diagnostic/lsp-вызове больше не нужно
vim.o.winborder = "rounded"

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
-- vim.o.confirm = true
