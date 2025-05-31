return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>m", "<cmd>SessionSearch<CR>", desc = "Session search" },
		-- { '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
		-- { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
	},
	config = function()
		require("auto-session").setup({
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			post_restore_cmds = {
				function()
					vim.defer_fn(function()
						vim.cmd("stopinsert")
					end, 0)
				end,
			},
			session_lens = {
				load_on_setup = true,
				previewer = false,
				mappings = {
					delete_session = { { "i", "n" }, "<C-D>" },
					alternate_session = { { "i", "n" }, "<C-S>" },
					copy_session = { { "i", "n" }, "<C-Y>" },
				},
				theme_conf = {
					border = true,
				},
			},
		})
	end,
}
