--print("main init.lua")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- source current file
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
-- source current line
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
-- source current selection
vim.keymap.set("v", "<leader>x", ":lua<CR>")

require('config.lazy')

-- close help by 'q'
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<CR>", { buffer = true, silent = true })
  end,
})


vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})
