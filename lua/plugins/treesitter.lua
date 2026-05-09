-- Syntax highlight language specific
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "java", "json", "jsonc", "lua", "vim", "vimdoc", "dockerfile", "python" },
		highlight = { enable = true },
	},
	config = function(_, opts)
		local status, ts = pcall(require, "nvim-treesitter.configs")
		if status then
			ts.setup(opts)
		end
	end,
}
