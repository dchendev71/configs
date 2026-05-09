return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"jdtls", -- Java
			},
		})

		local on_attach = function(_, bufnr)
			local bopts = { buffer = bufnr }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bopts)
		end

		local util = require("lspconfig.util")
		local root_dir = util.root_pattern("pom.xml")(vim.fn.expand("%:p"))
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 0.12+ Native Style
		vim.lsp.config("jdtls", {
			on_attach = on_attach,
			root_dir = root_dir,
			capabilities = capabilities,
			cmd = { "jdtls" },
		})
		vim.lsp.enable("jdtls")
	end,
}
