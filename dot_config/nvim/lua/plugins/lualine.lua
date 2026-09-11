return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- один статусбар на всё окно: в сплитах он дублировался, а neo-tree
    -- получал третий поверх собственного winbar с Files/Buffers/Git.
    -- laststatus = 3 lualine выставляет сам, в options.lua его держать не нужно
    options = { globalstatus = true },
    sections = {
      lualine_b = {
        "branch",
        {
          "diff",
          -- без source компонент заводит свои автокоманды и считает ханки
          -- подпроцессом `git diff`; mini.diff уже посчитал то же самое в процессе
          source = function()
            local s = vim.b.minidiff_summary
            if s then
              return { added = s.add, modified = s.change, removed = s.delete }
            end
          end,
        },
        "diagnostics",
      },
      -- path = 1: относительный путь. голого имени мало там, где по дереву
      -- разложены одноимённые файлы (lua/config/*.lua, lua/plugins/*.lua)
      lualine_c = { { "filename", path = 1 } },
      -- дефолтный statusline 0.12 показывает прогресс LSP и флаг 'busy',
      -- но lualine его подменяет целиком — возвращаем оба.
      -- encoding и fileformat убраны: всегда utf-8 и unix.
      -- счётчик апдейтов оживляет молчаливый checker из config/lazy.lua
      lualine_x = {
        { require("lazy.status").updates, cond = require("lazy.status").has_updates },
        function() return vim.ui.progress_status() end,
        function() return vim.bo.busy > 0 and "◐" or "" end,
        "filetype",
      },
      -- позиция в файле уже есть в lualine_z (строка:колонка) и в номерах строк
      lualine_y = {},
    },
  },
}
