return {
  {
    'nvim-mini/mini.nvim',
    enabled = true,
    version = false,
    config = function()
      -- mini.bracketed убран: он перекрывал нативные ]b/]q/]l/]d (есть с 0.11)
      -- и забирал ]t, который в ядре ходит по tag-matchlist
      require('mini.pairs').setup()

      -- ханки в signcolumn: gh применить, gH откатить, ]h/[h навигация,
      -- gh ещё и текстовый объект ханка. все эти клавиши свободны
      require('mini.diff').setup()
      vim.keymap.set('n', '<leader>gd', MiniDiff.toggle_overlay, { desc = 'toggle diff overlay' })
    end
  }
}
