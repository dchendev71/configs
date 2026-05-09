return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			-- Add your formatters, linters, and LSPs here
			ensure_installed = {
				-- Formatters
				"stylua",
				"google-java-format",
				"black",
				"isort",
				"prettier",

				-- LSPs
				"jdtls",
				"lua-language-server",
			},

			-- Automatically upgrade tools when Neovim starts
			auto_update = false,
			run_on_start = true,
		})
	end,
}
