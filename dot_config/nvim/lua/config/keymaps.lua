local map = vim.keymap.set

map("n", ";", ":", { desc = "enter command mode" })

-- use Ctrl-HJKL convention jumps
map("n", "<C-L>", "$")
map("n", "<C-H>", "^")
map("n", "<C-J>", "}")
map("n", "<C-K>", "{")

-- clear highlights on search when pressing <Esc> in normal mode
-- see `:help hlsearch`
map("n", "<esc>", ":nohlsearch<cr>", { noremap = true, silent = true })

-- save on Ctrl-s
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { silent = true })

-- ходьба по меню автодополнения. принять элемент — <C-y>: только он применяет
-- импорты, text edits и сниппеты. дефолтный прыжок по активному сниппету не теряем
map("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  end
  if vim.snippet.active({ direction = 1 }) then
    return "<Cmd>lua vim.snippet.jump(1)<CR>"
  end
  return "<Tab>"
end, { expr = true, silent = true, desc = "next completion item" })

map("i", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  end
  if vim.snippet.active({ direction = -1 }) then
    return "<Cmd>lua vim.snippet.jump(-1)<CR>"
  end
  return "<S-Tab>"
end, { expr = true, silent = true, desc = "prev completion item" })

-- buffers
map("n", "<leader>n", ":enew<CR>", { desc = "new buffer" })
map("n", "<C-q>", ":bd<cr>", { silent = true, desc = "delete buffer" })

-- swith buffers by Tab/Shift-Tab
map("n", "<Tab>", ":bnext<cr>", { silent = true })
map("n", "<S-Tab>", ":bprevious<cr>", { silent = true })

-- windows managment
map('n',"<leader>sh",":split<CR>", { desc = "split window horizontally" })
map('n',"<leader>sv",":vsplit<CR>", { desc = "split window vertically" })
map('n',"<leader>si",":resize +2<CR>", { desc = "increase window height" })
map('n',"<leader>sd",":resize -2<CR>", { desc = "decrease window height" })
-- map('n',"<leader>s",":vertical resize +2<CR>", { desc = "increase window width" })
-- map('n',"<leader>s",":vertical resize -2<CR>", { desc = "decrease window width" })

-- прыжки по диагностике. дублируют нативные ]d/[d из 0.11, оставлены как привычка.
-- opts.float депрекейтнут (удалят в 0.14) — всплывающее окно поднимаем через on_jump
local function diag_jump(count)
  return function()
    vim.diagnostic.jump({
      count = count,
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
      end,
    })
  end
end
map("n", "]g", diag_jump(1), { desc = "next diagnostic" })
map("n", "[g", diag_jump(-1), { desc = "prev diagnostic" })


map("n", "<leader>pv", vim.cmd.Ex, { desc = "open file exlorer" })

-- source current file
map("n", "<leader><leader>x", "<cmd>source %<CR>")
-- source current line
map("n", "<leader>x", ":.lua<CR>")
-- source current selection
map("v", "<leader>x", ":lua<CR>")


local wk = require("which-key")
--#region icons
wk.add({
	{ "<leader>g", group = "Git" },
	{ "<leader>gd", desc = "toggle diff overlay" },
	{ "<leader>f", group = "Telescope find" },
	{ "<leader>e", group = "Telescope find in known locations" },
	{ "<leader>b", group = "Telescope file browser" },
	{ "<leader>s", group = "Split window" },
	{ "<leader>t", group = "Tabs" },
	{ "<leader>m", group = "Markdown" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>R", group = "REST (kulala)" },
})
--#endregion
