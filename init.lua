local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.theme"),
	require("plugins.nvim-tree"),
	require("plugins.treesitter"),
	require("plugins.lsp"),
	require("plugins.completion"),
	require("plugins.formatting"),
	require("plugins.mason-tools"),
	require("plugins.telescope"),
})

-- Vim options
require("core.options")
-- Vim keymaps
require("core.keymaps")
