-- Add mason binaries to the system path so Neovim can call them
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (os.getenv("PATH") and (":" .. os.getenv("PATH")) or "")

vim.opt.number = true -- Line Number
vim.opt.relativenumber = true -- Relative line number
vim.opt.termguicolors = true -- GUI color
vim.opt.splitright = true -- New file open on the right
vim.opt.splitbelow = true -- New file open at the bottom
