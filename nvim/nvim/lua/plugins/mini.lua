return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    version = false,
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
      -- require('mini.completion').setup()
      require('mini.bracketed').setup()
      require('mini.pairs').setup()
    end
  }
}
