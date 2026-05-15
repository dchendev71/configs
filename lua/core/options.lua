-- Add mason binaries to the system path so Neovim can call them
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (os.getenv("PATH") and (":" .. os.getenv("PATH")) or "")
vim.opt.scrolloff = 10
vim.opt.number = true -- Line Number
vim.opt.relativenumber = true -- Relative line number
vim.opt.termguicolors = true -- GUI color
vim.opt.splitright = true -- New file open on the right
vim.opt.splitbelow = true -- New file open at the bottom

-- Show diagnostics in a floating window
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
-- Jump between diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- Open the diagnostic list
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
