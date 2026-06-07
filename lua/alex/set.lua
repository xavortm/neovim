vim.opt.guicursor = ""
vim.opt.cursorline = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Make Netrw show previews to the right
vim.g.netrw_preview = 1
vim.g.netrw_winsize = 25

-- Recommended option for Avante.nvim
vim.opt.laststatus = 3

-- Add borders to floating windows
vim.o.winborder = "rounded"
