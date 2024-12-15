return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		local oil = require("oil")
		oil.setup({
			use_default_keymaps = false,
			default_file_explorer = false,
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },

				["<CR>"] = "actions.select",
				["<C-enter>"] = { "actions.select_vsplit" },
				["<leader>ex"] = "actions.open_external",
				["q"] = { "actions.close", mode = "n" },
				["<C-c>"] = { "actions.close", mode = "n" },
				["<C-r>"] = "actions.refresh",

				-- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
				-- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				-- ["<C-t>"] = { "actions.select", opts = { tab = true } },
				-- ["<C-p>"] = "actions.preview",

				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				-- ["gs"] = { "actions.change_sort", mode = "n" },
				-- ["g."] = { "actions.toggle_hidden", mode = "n" },
				-- ["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "<leader>ee", function()
			oil.toggle_float()
		end, { desc = "Open parent directory" })
	end,
}
