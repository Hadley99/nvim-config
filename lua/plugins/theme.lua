return {
	lazy = false,
	priority = 1000,
	"rose-pine/neovim",
	name = "rose-pine",

	config = function()
		require("rose-pine").setup({
			variant = "moon",
			styles = {
				bold = false,
				italic = false,
				transparency = false,
			},
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
