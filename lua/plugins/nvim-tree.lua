-- Nvim-tree folder explorer
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = { quit_on_open = false },
			},
			update_focused_file = { enable = true },
		})
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
	end,
}
