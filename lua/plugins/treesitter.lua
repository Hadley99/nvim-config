return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"html",
				"bash",
				"css",
				"csv",
				"dockerfile",
				"editorconfig",
				"git_config",
				"gitignore",
				"go",
				"http",
				"javascript",
				"jq",
				"json",
				"jsonc",
				"jsdoc",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"tsx",
				"typescript",
				"yaml",
				"toml",
				"sql",
				"scss",
				"regex",
			},
		})
	end,
}
