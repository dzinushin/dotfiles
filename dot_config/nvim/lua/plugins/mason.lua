-- репозиторий mason переехал: williamboman/* -> mason-org/* (mason 2.x)
return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- marksman: переходы по [[wiki-ссылкам]] и обычным ссылкам,
      -- поиск битых ссылок, аутлайн заголовков как document symbols
      ensure_installed = { "lua_ls", "marksman" },
      -- mason-lspconfig 2.x сам поднимает установленные серверы через vim.lsp.enable
      automatic_enable = true,
    },
  },
}
