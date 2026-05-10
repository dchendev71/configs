return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				java = { "google-java-format" },
				json = { "prettier" },
				sql = { "sql_formatter" },
			},
			format_on_save = {
				lsp_fallback = true, -- If no formatter is found, try the LSP
				async = false,
				timeout_ms = 1000,
			},
		})

		-- Optional: Keymap to format manually
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
