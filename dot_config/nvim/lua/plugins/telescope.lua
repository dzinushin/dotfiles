return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    -- Telescope config
    local builtin = require('telescope.builtin')
    local map = vim.keymap.set
    map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    map('n', '<leader>ed',
      function()
        local opts = {
          cwd = "~/dotfiles",
          hidden = true
        }
        builtin.find_files(opts)
      end,
      { desc = 'Telescope browse dofiles' }
    )
    map('n', '<leader>en',
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
    map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

    map('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })
    map('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
    map('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
    map('n', '<leader>gt', builtin.git_stash, { desc = 'Git stash' })
    map("n", "<leader>gf", ":Telescope git_files<CR>", { desc = "Git: Files" })


  end
}
