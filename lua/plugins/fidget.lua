return {
	"j-hui/fidget.nvim",
	event = "VeryLazy",
	tag = "v1.4.5",
	config = function()
		require("fidget").setup({
			notification = {
				window = {
					border = "rounded",
				},
			},
		})
	end,
}
