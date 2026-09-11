-- маппинги объявлены прямо в keys: lazy сам делает их триггерами загрузки,
-- и which-key видит desc ещё до того, как плагин поднялся. отдельного списка
-- клавиш в config больше нет — расходиться нечему
local function builtin(name, opts)
  return function()
    require("telescope.builtin")[name](opts)
  end
end

return {
  'nvim-telescope/telescope.nvim',
  -- без version: последний релизный тег (v0.2.2) — сентябрь 2024, то есть старше
  -- и 0.11, и 0.12; разработка идёт в master, точный коммит фиксирует lazy-lock.json
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  cmd = 'Telescope',
  keys = {
    { '<leader>ff', builtin('find_files'), desc = 'Telescope find files' },
    { '<leader>fr', builtin('oldfiles'),   desc = 'Telescope recent files' },
    { '<leader>fg', builtin('live_grep'),  desc = 'Telescope live grep' },
    { '<leader>fb', builtin('buffers'),    desc = 'Telescope buffers' },
    { '<leader>fh', builtin('help_tags'),  desc = 'Telescope help tags' },

    { '<leader>ed', builtin('find_files', { cwd = '~/dotfiles', hidden = true }), desc = 'Telescope browse dotfiles' },
    { '<leader>en', builtin('find_files', { cwd = vim.fn.stdpath('config') }),    desc = 'Telescope browse nvim config files' },

    { '<leader>gb', builtin('git_branches'), desc = 'Git branches' },
    { '<leader>gc', builtin('git_commits'),  desc = 'Git commits' },
    { '<leader>gs', builtin('git_status'),   desc = 'Git status' },
    { '<leader>gt', builtin('git_stash'),    desc = 'Git stash' },
    { '<leader>gf', builtin('git_files'),    desc = 'Git files' },
  },
  config = function()
    local actions = require('telescope.actions')

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
          n = {
            ['q'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          -- lua-паттерн, не глоб: точку экранируем, слэш привязывает к каталогу.
          -- нужен только из-за hidden = true; остальное отсекает .gitignore через fd
          file_ignore_patterns = { '%.git/' },
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
        live_grep = {
          file_ignore_patterns = { '%.git/' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
    }
  end,
}
