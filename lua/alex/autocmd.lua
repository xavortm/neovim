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

vim.api.nvim_create_autocmd("User", {
	pattern = "GitConflictDetected",
	callback = function()
		vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
		vim.keymap.set("n", "cww", "<Plug>(git-conflict-browse)", { buffer = true })
	end,
})

-- Auto-run phpcs.cbf() on save for PHP files in a WP project
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.php",
	callback = function()
		require("phpcs").cbf()
	end,
})

-- Handle auto-formatting of comments for multiple languages
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "php", "javascript", "typescript", "css" },
	callback = function()
		-- s1:/* -> Start with /*, offset next line by 1 space
		-- m: *  -> Middle starts with space + star (note: two spaces for proper formatting)
		-- ex:*/  -> End with */
		vim.opt_local.comments = "s1:/*,m: * ,ex:*/"

		-- j: Remove comment leader when joining lines
		-- r: Auto-insert leader after <Enter>
		-- o: Auto-insert leader after 'o' or 'O'
		-- q: Allow formatting of comments with 'gq' or 'gw'
		vim.opt_local.formatoptions:append("jroq")
	end,
})
