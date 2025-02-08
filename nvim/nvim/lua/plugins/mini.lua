return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
    end
  }
}
