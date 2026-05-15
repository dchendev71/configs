return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()

		local servers = {
			"pyright",
			"clangd",
			"gopls",
			"jsonls",
			"dockerls",
			"rust_analyzer",
			"html",
			"cssls",
			"lua_ls",
			"bashls",
			"yamlls",
			"vtsls",
		}

		require("mason-lspconfig").setup({
			ensure_installed = vim.iter({ "jdtls", servers }):flatten():totable(),
		})

		-- Global Keymaps/Behavior on LSP attach
		local on_attach = function(_, bufnr)
			local bopts = { buffer = bufnr }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bopts)
		end

		-- Capabilities for nvim-cmp autocompletion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		---------------------------------------------------------
		-- 1. SETUP ALL STANDARD SERVERS (Python, C++, Go, etc.)
		---------------------------------------------------------
		for _, server in ipairs(servers) do
			vim.lsp.config(server, {
				on_attach = on_attach,
				capabilities = capabilities,
				-- Special override just for Lua so it stops warning about the 'vim' global
				settings = server == "lua_ls" and {
					Lua = { diagnostics = { globals = { "vim" } } },
				} or nil,
			})
			vim.lsp.enable(server)
		end

		---------------------------------------------------------
		-- 2. SETUP JAVA (jdtls requires specific project root detection)
		---------------------------------------------------------
		local util = require("lspconfig.util")

		vim.lsp.config("jdtls", {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "jdtls" },
			root_dir = util.root_pattern("pom.xml")(vim.fn.expand("%:p")),
			settings = {
				java = {
					autobuild = { enabled = false },
					signatureHelp = { enabled = true },
				},
			},
		})
		vim.lsp.enable("jdtls")
	end,
}
