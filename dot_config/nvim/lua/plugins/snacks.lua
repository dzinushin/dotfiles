-- из snacks включён только модуль image: терминал (Ghostty) умеет kitty graphics
-- protocol, поэтому картинки рендерятся прямо в буфере, без внешнего окна
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
    },
    keys = {
      { "<leader>mi", function() Snacks.image.hover() end, desc = "preview image under cursor" },
    },
  },
}
