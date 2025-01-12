local cmp_kinds = {
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = " ",
	Variable = " ",
	Class = " ",
	Interface = " ",
	Module = " ",
	Property = " ",
	Unit = " ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = " ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
}

return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			menu = {
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", "source_file", gap = 1 },
					},
					components = {
						source_file = {
							text = function(ctx)
								if ctx.item.detail then
									return ctx.item.detail
								elseif ctx.item.documentation then
									return ctx.item.documentation
								end
							end,
							highlight = "BlinkCmpSource", -- Define a highlight group for styling
						},
					},
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}

-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	event = { "BufReadPost", "BufNewFile" },
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"L3MON4D3/LuaSnip",
-- 		"saadparwaiz1/cmp_luasnip",
-- 		"hrsh7th/cmp-buffer",
-- 		"onsails/lspkind.nvim",
-- 		"hrsh7th/cmp-path",
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
-- 		local luasnip = require("luasnip")
-- 		require("luasnip.loaders.from_vscode").lazy_load()
--
-- 		cmp.setup({
-- 			snippet = {
-- 				-- REQUIRED - you must specify a snippet engine
-- 				expand = function(args)
-- 					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
-- 					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
-- 					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
-- 					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
-- 					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
-- 				end,
-- 			},
--
-- 			window = {
-- 				completion = cmp.config.window.bordered(),
-- 				documentation = cmp.config.window.bordered(),
-- 			},
-- 			completion = { completeopt = "menu,menuone,noinsert" },
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- 				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
-- 				["<Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_next_item()
-- 					elseif luasnip.expand_or_jumpable() then
-- 						luasnip.expand_or_jump()
-- 					else
-- 						fallback()
-- 					end
-- 				end, { "i", "s" }),
-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_prev_item()
-- 					elseif luasnip.jumpable(-1) then
-- 						luasnip.jump(-1)
-- 					else
-- 						fallback()
-- 					end
-- 				end, { "i", "s" }),
-- 				["<C-u>"] = cmp.mapping.scroll_docs(-4), -- scroll up preview
-- 				["<C-d>"] = cmp.mapping.scroll_docs(4), -- scroll down preview
-- 				["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
-- 				["<C-c>"] = cmp.mapping.abort(), -- close completion window
-- 				["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
-- 			}),
--
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp", group_index = 1 }, -- lsp
-- 				{ name = "buffer", max_item_count = 5, group_index = 2 }, -- text within current buffer
-- 				{ name = "path", max_item_count = 3, group_index = 3 }, -- file system paths
-- 				{ name = "luasnip", max_item_count = 3, group_index = 5 }, -- snippets
-- 			}),
--
-- 			formatting = {
-- 				fields = { "kind", "abbr", "menu" },
-- 				format = function(entry, vim_item)
-- 					if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
-- 						vim_item.menu = entry.completion_item.detail
-- 					else
-- 						vim_item.menu = ({
-- 							nvim_lsp = "[LSP]",
-- 							luasnip = "[Snippet]",
-- 							buffer = "[Buffer]",
-- 							path = "[Path]",
-- 						})[entry.source.name]
-- 					end
--
-- 					vim_item.kind = (cmp_kinds[vim_item.kind] or "")
-- 					return vim_item
-- 				end,
-- 			},
-- 		})
-- 	end,
-- }
