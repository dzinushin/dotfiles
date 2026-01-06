--print("main init.lua")

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
