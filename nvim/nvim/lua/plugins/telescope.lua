return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    -- Telescope config
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>ed',
      function()
        local opts = {
          cwd = "~/dotfiles"
        }
        builtin.find_files(opts)
      end,
      { desc = 'Telescope browse dofiles' }
    )
    vim.keymap.set('n', '<leader>en',
      function()
        --       require("telescope").setup {
        --         pickers = {
        --           find_files = {
        --             theme = "ivy"
        --           }
        --         }
        --       }
        local opts = {
          cwd = vim.fn.stdpath("config")
        }
        builtin.find_files(opts)
        -- builtin.find_files {
        --  cwd = vim.fn.stdpath("config")
        -- }
      end,
      { desc = 'Telescope browse nvim config files' }
    )
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
