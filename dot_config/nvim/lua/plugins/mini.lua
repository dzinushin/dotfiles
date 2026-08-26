return {
  {
    'nvim-mini/mini.nvim',
    enabled = true,
    version = false,
    config = function()
      -- mini.bracketed убран: он перекрывал нативные ]b/]q/]l/]d (есть с 0.11)
      -- и забирал ]t, который в ядре ходит по tag-matchlist
      require('mini.pairs').setup()
    end
  }
}
