--print("main init.lua")

-- netrw выключен целиком, и обязательно до загрузки плагинов: иначе на `nvim <каталог>`
-- он на VimEnter успевает нарисовать свой листинг, а neo-tree подменяет буфер уже
-- поверх — окно моргает. Собственный `autocmd! FileExplorer *` из neo-tree тут не
-- спасает: netrwPlugin.vim грузится после init.lua и регистрирует автокоманды заново
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")

require('config.lazy')

-- register extra keymaps/shortcuts
require("config.keymaps")

require("config.autocmds")


-- for kulala register filetype extension
vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})
