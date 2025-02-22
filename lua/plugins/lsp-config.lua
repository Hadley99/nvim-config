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
				ensure_installed = { "lua_ls", "eslint", "ts_ls", "tailwindcss" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.denols.setup({
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				cmd = {
					"/Users/hadleyfernandes/.local/share/nvim/mason/bin/tailwindcss-language-server",
					"--stdio",
				},
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("package.json"),
			})

			vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Hover" })
			vim.keymap.set("n", "gH", vim.lsp.buf.signature_help, { desc = "Show signature" })
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Type definition" })

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go To Definition" })
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })

			-- vim.keymap.set('n', 'gf', vim.lsp.buf.references, { desc = 'Find all references' }) -- Added in telescope for better UI
			vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code Actions" })
		end,
	},
}
