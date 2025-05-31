vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.loaded_netrwPlugin = 0

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = false
vim.opt.clipboard = "unnamedplus"

-- fold config
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- open most folds by default
vim.opt.foldlevelstart = 99 -- start with all folds open
-- vim.opt.foldcolumn = "1" -- optional: show fold column

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "}", "{zz", { noremap = true, silent = true })
vim.keymap.set("n", "{", "}zz", { noremap = true, silent = true })

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

vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save File" })
-- vim.keymap.set("i", "<leader-s>", "<Esc>:w<CR>", { noremap = true, silent = true, desc = "Save File" })

vim.keymap.set("n", "<leader>w", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close Buffer" })

-- Comment
vim.keymap.set("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

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

-- Opens telescope when opened with "nvim ."
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			vim.cmd("cd " .. vim.fn.argv(0))
			require("telescope.builtin").find_files()
		end
	end,
})

-- Store in session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- vim.cmd([[let &t_Cs = "\e[4:3m"]]) -- start undercurl
-- vim.cmd([[let &t_Ce = "\e[4:0m"]]) -- end undercurl
