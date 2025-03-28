local km = vim.keymap
local map = vim.keymap.set

map("n", ";", ":", { desc = "enter command mode" })

-- clear highlights on search when pressing <Esc> in normal mode
-- see `:help hlsearch`
km.set("n", "<esc>", ":nohlsearch<cr>", { noremap = true, silent = true })

-- save on Ctrl-s
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { silent = true })

km.set("n", "<leader>n", ":enew<CR>", { desc = "new buffer" })
km.set("n", "<C-q>", ":bd<cr>", { silent = true, desc = "delete buffer" })

-- swith buffers by Tab/Shift-Tab
map("n", "<Tab>", ":bnext<cr>", { silent = true })
map("n", "<S-Tab>", ":bprevious<cr>", { silent = true })


-- Jump LSP errors
map("n", "]g", vim.diagnostic.goto_next)
map("n", "[g", vim.diagnostic.goto_prev)


km.set("n", "<leader>pv", vim.cmd.Ex)
-- source current file
km.set("n", "<leader><leader>x", "<cmd>source %<CR>")
-- source current line
km.set("n", "<leader>x", ":.lua<CR>")
-- source current selection
km.set("v", "<leader>x", ":lua<CR>")


local wk = require("which-key")
--#region icons
wk.add({
	{ "<leader>g", group = "Git" },
})
--#endregion
