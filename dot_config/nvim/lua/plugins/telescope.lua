return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.1',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    -- Telescope config
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    local map = vim.keymap.set

    require('telescope').setup{
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'bottom',
            preview_width = 0.6,
            width = { padding = 0 },
            height = { padding = 0 },
          },
        },
        mappings = {
--          i = {
--            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
--            ['<C-j>'] = actions.move_selection_next, -- move to next result
--            ['<C-l>'] = actions.select_default, -- open file
--          },
          n = {
            ['q'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { '.git', 'node_modules', '.vend' },
          hidden = true,
        },
        buffers = {
          initial_mode = 'normal',
          sort_lastused = true,
          mappings = {
            n = {
              ['d'] = actions.delete_buffer,
            }
          }
        },
      },
      live_grep = {
        file_ignore_patterns = { 'node_modules', '.git', '.venv' },
        additional_args = function(_)
          return { '--hidden' }
        end,
      },
    }

    map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    map('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope recent files' })
    map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

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
        local opts = {
          cwd = vim.fn.stdpath("config")
        }
        builtin.find_files(opts)
      end,
      { desc = 'Telescope browse nvim config files' }
    )

    map('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })
    map('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
    map('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
    map('n', '<leader>gt', builtin.git_stash, { desc = 'Git stash' })
    map("n", "<leader>gf", ":Telescope git_files<CR>", { desc = "Git: Files" })
  end,
}
