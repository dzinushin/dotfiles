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

vim.keymap.set("n", "<leader>pv",vim.cmd.Ex)

require('config.lazy')


vim.filetype.add({
	extension = {
		['http'] = 'http',
	},
})
