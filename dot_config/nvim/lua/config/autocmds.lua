-- close help by 'q'
local help_group = vim.api.nvim_create_augroup("HelpQuit", {})
vim.api.nvim_create_autocmd("FileType", {
  group = help_group,
  pattern = "help",
  callback = function(args)
    vim.keymap.set("n", "q", "<cmd>q<cr>", { buf = args.buf })
  end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  callback = function()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

-- читаемый markdown: мягкий перенос по словам с сохранением отступа списка
local markdown_group = vim.api.nvim_create_augroup("MarkdownReading", {})
vim.api.nvim_create_autocmd("FileType", {
  group = markdown_group,
  pattern = { "markdown", "text" },
  callback = function(args)
    vim.wo[0][0].wrap = true
    vim.wo[0][0].linebreak = true
    vim.wo[0][0].breakindent = true
    vim.wo[0][0].showbreak = "↳ "
    -- не разрывать строку автоматически при наборе
    vim.bo[args.buf].textwidth = 0
    vim.wo[0][0].conceallevel = 0
    -- со пустым foldtext свёрнутая секция выглядит как обычный заголовок,
    -- поэтому состояние фолда показываем маркером в foldcolumn (⌄ / ›)
    vim.wo[0][0].foldcolumn = "auto:1"

    local map = function(lhs, rhs)
      vim.keymap.set({ "n", "x" }, lhs, rhs, { expr = true, buf = args.buf, silent = true })
    end
    map("j", "v:count == 0 ? 'gj' : 'j'")
    map("k", "v:count == 0 ? 'gk' : 'k'")

    -- прыжки по заголовкам (]] / [[) своих не держим: ядро даёт их само —
    -- normal из ftplugin/markdown.lua, visual из ftplugin/markdown.vim.
    -- ядерные ловят ещё и setext-заголовки (подчёркнутые === / ---),
    -- а свои перекрывали только normal и умели один ATX
  end,
})
