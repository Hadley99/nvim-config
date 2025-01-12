vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.loaded_netrwPlugin = 0
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")

-- to use Option use <M-
-- to use Command use <D-
vim.keymap.set("n", "<D-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save File" })
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>", { noremap = true, silent = true, desc = "Save File" })

vim.keymap.set("n", "<D-w>", ":bd<CR>", { noremap = true, silent = true, desc = "Close Buffer" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			vim.cmd("cd " .. vim.fn.argv(0))
			require("telescope.builtin").find_files()
		end
	end,
})
