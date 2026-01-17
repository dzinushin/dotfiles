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

-- Jump LSP errors
map("n", "]g", vim.diagnostic.goto_next)
map("n", "[g", vim.diagnostic.goto_prev)


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
	{ "<leader>f", group = "Telescope find" },
	{ "<leader>e", group = "Telescope find in known locations" },
	{ "<leader>b", group = "Telescope file browser" },
	{ "<leader>s", group = "Split window" },
	{ "<leader>t", group = "Tabs" },
})
--#endregion
