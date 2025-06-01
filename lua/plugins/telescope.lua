local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s - %s", tail, parent)
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
			vim.keymap.set("n", "gF", builtin.lsp_references, { desc = "LSP references" })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				callback = function(ctx)
					vim.api.nvim_buf_call(ctx.buf, function()
						vim.fn.matchadd("TelescopeParent", "\t\t.*$")
						vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
					end)
				end,
			})

			require("telescope").setup({
				defaults = {
					sorting_strategy = "ascending", -- display results top->bottom
					layout_config = {
						prompt_position = "top", -- search bar at the top
					},
					file_ignore_patterns = {
						".git/", -- Git repository data
						"node_modules/", -- Node.js dependencies
						"vendor/", -- PHP, Go, or other vendored dependencies
						"target/", -- Rust/Cargo build output
						"build/", -- Build directories
						"build/", -- Build directories
						"dist/", -- Distribution/output folders
						"%.lock", -- lock files (yarn.lock, package-lock.json, etc.)
						"%.env", -- .env files
						"%.cache/", -- Caches
						"__pycache__/", -- Python cache
						"%.DS_Store", -- macOS metadata files
						"%.class", -- Java class files
						"%.o",
						"%.obj", -- Compiled object files
						"%.exe",
						"%.dll", -- Windows binaries
					},
					mappings = {
						i = { -- Insert mode mappings
							["<Tab>"] = require("telescope.actions").move_selection_next,
							["<S-Tab>"] = require("telescope.actions").move_selection_previous,
							["<C-c>"] = require("telescope.actions").close, -- Add this line
						},
						n = { -- Normal mode mappings
							["<Tab>"] = require("telescope.actions").move_selection_next,
							["<S-Tab>"] = require("telescope.actions").move_selection_previous,
							["<C-c>"] = require("telescope.actions").close, -- Add this line
						},
					},
				},
				pickers = {
					find_files = {
						path_display = filenameFirst,
						previewer = false,
						hidden = true,
					},
					buffers = {
						previewer = false,
					},
					lsp_references = {
						show_line = false, -- hides code in result name
						-- path_display = filenameFirst,
					},
					git_branches = {
						previewer = false,
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
