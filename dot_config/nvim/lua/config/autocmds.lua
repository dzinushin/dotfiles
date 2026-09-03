
-- close help by 'q'
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<CR>", { buf = 0, silent = true })
  end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- nvim-treesitter на ветке main ничего не включает сам: highlight, фолды и indent
-- поднимаются здесь, по факту наличия парсера для филетайпа
local ts_group = vim.api.nvim_create_augroup("TreesitterEnable", {})

-- у этих языков treesitter-indent заметно хуже встроенного
local no_ts_indent = { markdown = true, yaml = true, html = true }

vim.api.nvim_create_autocmd("FileType", {
  group = ts_group,
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    -- парсер может быть ещё не установлен — тогда молча остаёмся на syntax
    if not pcall(vim.treesitter.start, args.buf, lang) then
      return
    end

    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"

    if not no_ts_indent[ft] then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- читаемый markdown: мягкий перенос по словам с сохранением отступа списка
local markdown_group = vim.api.nvim_create_augroup("MarkdownReading", {})
vim.api.nvim_create_autocmd("FileType", {
  group = markdown_group,
  pattern = { "markdown", "text" },
  callback = function(args)
    local buf = args.buf
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.showbreak = "↳ "
    -- не разрывать строку автоматически при наборе
    vim.opt_local.textwidth = 0
    vim.opt_local.conceallevel = 0
    -- со пустым foldtext свёрнутая секция выглядит как обычный заголовок,
    -- поэтому состояние фолда показываем маркером в foldcolumn (⌄ / ›)
    vim.opt_local.foldcolumn = "auto:1"

    local map = function(lhs, rhs)
      vim.keymap.set({ "n", "x" }, lhs, rhs, { expr = true, buf = buf, silent = true })
    end
    map("j", "v:count == 0 ? 'gj' : 'j'")
    map("k", "v:count == 0 ? 'gk' : 'k'")

    -- прыжки по заголовкам: ]] вперёд, [[ назад
    local heading = [[^#\{1,6}\s]]
    vim.keymap.set("n", "]]", function()
      vim.fn.search(heading, "W")
    end, { buf = buf, desc = "next markdown heading" })
    vim.keymap.set("n", "[[", function()
      vim.fn.search(heading, "bW")
    end, { buf = buf, desc = "prev markdown heading" })
  end,
})
