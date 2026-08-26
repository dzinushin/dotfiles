-- из snacks включены только те модули, которых нет ни в ядре, ни в других плагинах
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      image = {
        enabled = true,
        doc = {
          -- картинка появляется под ссылкой в тексте
          inline = true,
          -- и дублируется во всплывающем окне, когда курсор на ссылке
          float = true,
          max_width = 80,
          max_height = 40,
        },
        -- рендер формул требует tectonic или latex в PATH
        math = { enabled = false },
      },

      -- отключает treesitter/LSP/подсветку на огромных файлах, чтобы nvim не подвисал
      bigfile = { enabled = true },

      -- рисует файл до загрузки плагинов: заметно быстрее открытие прямо из шелла
      quickfile = { enabled = true },

      -- нормальный vim.ui.input вместо строки в cmdline; влияет в том числе
      -- на <leader>lr (LSP rename)
      input = { enabled = true },

      -- git-UI во всплывающем окне; бинарь lazygit ставится через brew (init.sh)
      lazygit = { enabled = true },
    },
    keys = {
      { "<leader>mi", function() Snacks.image.hover() end, desc = "preview image under cursor" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "lazygit" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "lazygit: log" },
    },
  },
}
