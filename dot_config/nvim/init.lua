--print("main init.lua")

require("config.options")

require('config.lazy')

-- register extra keymaps/shortcuts
require("config.keymaps")




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
