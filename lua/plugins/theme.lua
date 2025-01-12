return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,

		config = function()
			require("gruvbox").setup({
				bold = false,
				contrast = "hard",
				italic = {
					strings = false,
					emphasis = false,
					comments = true,
					operators = false,
					folds = false,
				},
			})
			vim.o.background = "dark"
			vim.cmd("colorscheme gruvbox")
		end,
	},
	-- {
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	--
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "moon",
	-- 			styles = {
	-- 				bold = false,
	-- 				italic = false,
	-- 				transparency = false,
	-- 			},
	-- 		})
	--
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
}
