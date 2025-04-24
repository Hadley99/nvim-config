if not vim.g.vscode then
	-- Regular Neovim setup
	vim.g.mapleader = " "
	require("vim-remaps-and-options")

	-- Bootstrap lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
	vim.opt.rtp:prepend(lazypath)
	require("lazy").setup("plugins")
else
	-- VSCode-specific settings

	vim.keymap.set("i", "jk", "<Esc>")
	vim.keymap.set("i", "kj", "<Esc>")
	vim.keymap.set("i", "kk", "<Esc>")
	vim.keymap.set("i", "jj", "<Esc>")
	vim.g.mapleader = " "
	vim.opt.clipboard = "unnamedplus" -- Sync clipboard
	require("vim-remaps-and-options")
end
