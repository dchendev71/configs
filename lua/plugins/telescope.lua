return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-q>"] = require("telescope.actions").send_selected_to_qflist
							+ require("telescope.actions").open_qflist,
					},
				},
			},
		})

		-- Enable fzf native extension if installed
		pcall(telescope.load_extension, "fzf")

		-- Keymaps
		local map = vim.keymap.set
		map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		map("n", "<leader>fg", builtin.live_grep, { desc = "Find Text (Grep)" })
		map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
		map("n", "<leader>fs", builtin.git_status, { desc = "Find Git Status" })
	end,
}
