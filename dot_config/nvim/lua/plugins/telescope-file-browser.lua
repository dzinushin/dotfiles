return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim", 
    "nvim-lua/plenary.nvim" 
  },
  config = function()
    local map = vim.keymap.set

    map('n','<leader>bf', 
      function()
	     require("telescope").extensions.file_browser.file_browser()
      end,
      { desc = 'Telescope file browser' }
    )
  end,
}
