return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async", -- Required dependency
	},
	config = function()
		require("ufo").setup()
	end,
}
