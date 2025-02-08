-- Fixes Notify opacity issues
-- vim.o.termguicolors = true

return {
	"nvim-tree/nvim-tree.lua",
  enabled = false,
	config = function()
		require("nvim-tree").setup()
	end
}
