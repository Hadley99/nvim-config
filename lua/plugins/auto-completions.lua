return {
	"saghen/blink.cmp",
	-- dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	opts = {
		keymap = {
			preset = "enter",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		cmdline = {
			enabled = true,
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
		signature = { enabled = true, window = { border = "rounded" } },

		completion = {
			documentation = { window = { border = "rounded" } },
			menu = {
				border = "rounded",
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
	},
	opts_extend = { "sources.default" },
}

-- local cmp_kinds = {
-- 	Text = " ",
-- 	Method = " ",
-- 	Function = " ",
-- 	Constructor = " ",
-- 	Field = " ",
-- 	Variable = " ",
-- 	Class = " ",
-- 	Copilot = "",
-- 	Interface = " ",
-- 	Module = " ",
-- 	Property = " ",
-- 	Unit = " ",
-- 	Value = " ",
-- 	Enum = " ",
-- 	Keyword = " ",
-- 	Snippet = " ",
-- 	Color = " ",
-- 	File = " ",
-- 	Reference = " ",
-- 	Folder = " ",
-- 	EnumMember = " ",
-- 	Constant = " ",
-- 	Struct = " ",
-- 	Event = " ",
-- 	Operator = " ",
-- 	TypeParameter = " ",
-- }
