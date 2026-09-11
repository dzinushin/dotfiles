return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- описания леадер-префиксов. живут здесь, а не в config/keymaps.lua:
    -- иначе require("which-key") из core-конфига тянет плагин на старте,
    -- в обход его же VeryLazy
    spec = {
      { "<leader>g", group = "Git" },
      { "<leader>f", group = "Telescope find" },
      { "<leader>e", group = "Telescope find in known locations" },
      { "<leader>b", group = "Telescope file browser" },
      { "<leader>p", group = "Neo-tree explorer" },
      { "<leader>s", group = "Split window" },
      { "<leader>m", group = "Markdown" },
      { "<leader>l", group = "LSP" },
      { "<leader>R", group = "REST (kulala)" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
