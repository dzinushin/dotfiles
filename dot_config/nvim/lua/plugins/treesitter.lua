-- ветка master заморожена и её API (nvim-treesitter.configs) больше не существует.
-- на main плагин занимается только установкой парсеров, поэтому highlight, фолды
-- и indent включаются вручную — FileType-автокомандой ниже
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

-- у этих языков treesitter-indent заметно хуже встроенного
local no_ts_indent = { markdown = true, yaml = true, html = true }

-- highlight/фолды/indent поднимаются по факту наличия парсера для филетайпа
local function enable_treesitter(args)
  local ft = vim.bo[args.buf].filetype
  local lang = vim.treesitter.language.get_lang(ft)
  if not lang then
    return
  end

  -- парсер может быть ещё не установлен — тогда молча остаёмся на syntax
  if not pcall(vim.treesitter.start, args.buf, lang) then
    return
  end

  vim.wo[0][0].foldmethod = "expr"
  vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"

  if not no_ts_indent[ft] then
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  -- плагин не поддерживает ленивую загрузку
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup()

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterEnable", {}),
      callback = enable_treesitter,
    })

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
}
