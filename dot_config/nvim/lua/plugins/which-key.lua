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
      { "<leader>p", group = "Neo-tree explorer" },
      { "<leader>s", group = "Split window" },
      { "<leader>m", group = "Markdown" },
      { "<leader>l", group = "LSP" },
      -- префиксы intellij-lsp: маппинги буферные, только в Java/Kotlin
      { "<leader>t", group = "IntelliJ type hierarchy" },
      { "<leader>c", group = "IntelliJ call hierarchy" },
      { "<leader>w", group = "IntelliJ workspace" },
      { "<leader>r", group = "IntelliJ run" },
      { "<leader>d", group = "IntelliJ debug" },
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
