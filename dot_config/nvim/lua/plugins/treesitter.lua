-- ветка master заморожена и её API (nvim-treesitter.configs) больше не существует.
-- на main плагин занимается только установкой парсеров: highlight/indent/folds
-- включаются вручную — см. FileType-автокоманду в config/autocmds.lua
local ensure_installed = {
  "bash",
  "c",
  "css",
  "diff",
  "gitcommit",
  "html",
  "http",
  "javascript",
  "json",
  "kotlin",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "rust",
  "toml",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- плагин не поддерживает ленивую загрузку
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup()

      -- декларативного ensure_installed на main нет, доустанавливаем недостающее сами
      local installed = ts.get_installed("parsers")
      local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, ensure_installed)

      if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
        ts.install(missing)
      elseif #missing > 0 then
        vim.notify(
          "Tree-sitter parsers are missing; install tree-sitter-cli and restart Neovim",
          vim.log.levels.ERROR
        )
      end
    end,
  },
}
