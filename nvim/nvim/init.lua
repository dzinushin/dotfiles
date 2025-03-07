--print("main init.lua")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.scrolloff = 10
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'

local km = vim.keymap

km.set("n", "<leader>pv", vim.cmd.Ex)
-- source current file
km.set("n", "<leader><leader>x", "<cmd>source %<CR>")
-- source current line
km.set("n", "<leader>x", ":.lua<CR>")
-- source current selection
km.set("v", "<leader>x", ":lua<CR>")

km.set("n", "<leader>n", ":enew<CR>", { desc = "New buffer" })



require('config.lazy')

-- close help by 'q'
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<CR>", { buffer = true, silent = true })
  end,
})


-- for kulala register filetype extension
vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})
