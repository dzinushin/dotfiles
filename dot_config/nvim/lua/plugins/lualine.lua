return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = true,
  config = function() 
    require("lualine").setup({
      options = {
        icons_enabled = true,
      },
      -- дефолтный statusline 0.12 показывает прогресс LSP и флаг 'busy',
      -- но lualine его подменяет целиком — возвращаем оба.
      -- диагностика у lualine своя, в lualine_b
      sections = {
        lualine_x = {
          function() return vim.ui.progress_status() end,
          function() return vim.bo.busy > 0 and "◐" or "" end,
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
