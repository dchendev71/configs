return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300 -- Popup appears after 300ms
	end,
	config = function()
		local wk = require("which-key")

		wk.setup({
			-- Your custom configurations here (optional)
			preset = "classic", -- "classic", "modern", or "helix"
		})

		-- Register group names so they look nice in the menu
		wk.add({
			{ "<leader>f", group = "Find/Format" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>w", group = "Windows" },
		})
	end,
}
