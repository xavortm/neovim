-- Try it with `yap` in normal mode
-- Highlight when yanking (copying) text
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("alex-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Auto-run phpcs.cbf() on save for PHP files in a WP project
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.php",
    callback = function()
	require("phpcs").cbf()
    end,
})

