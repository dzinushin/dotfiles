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
      -- набор под то, что реально правится в nvim (по v:oldfiles — markdown,
      -- shell, dotfiles и конфиги); JVM-языки живут в IDEA, серверов под них нет.
      -- marksman  — переходы по [[wiki-ссылкам]], поиск битых ссылок, аутлайн заголовков
      -- bashls    — подхватывает shellcheck из PATH и показывает его диагностику
      -- yamlls    — валидация по схемам (docker-compose, GitHub Actions, k8s)
      ensure_installed = {
        "lua_ls",
        "marksman",
        "bashls",
        "yamlls",
        "jsonls",
        "taplo",
      },
      -- mason-lspconfig 2.x сам поднимает установленные серверы через vim.lsp.enable
      automatic_enable = true,
    },
  },
}
