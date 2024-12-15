return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "eslint", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go To Definition" })
			-- vim.keymap.set('n', 'gf', vim.lsp.buf.references, { desc = 'Find all references' }) -- Added in telescope for better UI
			vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code Actions" })
		end,
	},
}
