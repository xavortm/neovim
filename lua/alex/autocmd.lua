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
