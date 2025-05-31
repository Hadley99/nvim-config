-- colorschemes/codestackr/init.lua
local M = {}

M.colors = {
	bg = "#09131b",
	fg = "#ffffff",
	red = "#FF652F",
	yellow = "#FFE400",
	green = "#14A76C",
	cyan = "#1efaa2",
	blue = "#5eb7ee",
	violet = "#746aff",
	orange = "#ff9746",
	pink = "#ff5177",
	comment = "#577997",
	tag = "#ffc598",
}

function M.set_highlights()
	local set = vim.api.nvim_set_hl

	local function hi(group, opts)
		set(0, group, opts)
	end

	-- Base UI
	hi("Normal", { fg = "#ffffff", bg = "#09131b" })
	hi("LineNr", { fg = "#FFFFFF" })
	hi("CursorLineNr", { fg = "#FF652F" })
	hi("Cursor", { fg = "#09131b", bg = "#FFE400" })
	hi("Comment", { fg = "#577997", italic = true })

	-- Syntax (Tree-sitter)
	hi("@string", { fg = "#14A76C" })
	hi("@string.escape", { fg = "#1efaa2" })
	hi("@boolean", { fg = "#FF652F" })
	hi("@number", { fg = "#FFE400" })
	hi("@variable", { fg = "#746aff" })
	hi("@constant", { fg = "#ff5177" })
	hi("@keyword", { fg = "#5eb7ee", italic = true })
	hi("@keyword.return", { fg = "#FFE400" })
	hi("@function", { fg = "#FFE400" })
	hi("@function.call", { fg = "#FFE400" })
	hi("@function.method", { fg = "#5eb7ee" })
	hi("@type", { fg = "#ff9d00" })
	hi("@type.builtin", { fg = "#ff9d00" })
	hi("@class", { fg = "#ff9d00" })
	hi("@property", { fg = "#5eb7ee" })

	-- HTML/CSS/JS specific
	hi("@tag", { fg = "#FF652F" }) -- outer
	hi("@tag.delimiter", { fg = "#FF652F" })
	hi("@tag.attribute", { fg = "#FFE400" })
	hi("@attribute", { fg = "#FFE400" })
	hi("@constructor", { fg = "#5eb7ee" }) -- for JSX/TSX/HTML className
	hi("@punctuation.delimiter", { fg = "#356ea0" })
	hi("@markup.heading", { fg = "#FF652F" })
	hi("@markup.link", { fg = "#ff9746" })
	hi("@markup.list", { fg = "#FF652F" })
	hi("@markup.italic", { fg = "#ff9746", italic = true })
	hi("@markup.bold", { fg = "#ff9746", bold = true })
	hi("@markup.inline", { fg = "#14A76C" }) -- inline code
	hi("@markup.quote", { fg = "#356ea0" })
	hi("@markup.raw", { fg = "#14A76C" }) -- fenced code block

	-- YAML/JSON
	hi("@label", { fg = "#5eb7ee" }) -- JSON key
	hi("@string.special", { fg = "#FF652F" }) -- JSON true/false

	-- Misc
	hi("Error", { fg = "#ff0000", bold = true })
end

function M.load()
	vim.cmd("hi clear")
	vim.o.background = "dark"
	vim.g.colors_name = "codestackr"
	M.set_highlights()
end

return M
