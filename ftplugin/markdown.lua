-- Prose-optimized settings for Markdown buffers.

-- Soft wrap at word boundaries, preserve indent on wrapped lines.
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true

-- No hard line-break insertion.
vim.opt_local.textwidth = 0
vim.opt_local.formatoptions:remove("t")

-- Navigate visual lines instead of physical lines.
local opts = { buffer = true, silent = true }
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)
vim.keymap.set("v", "j", "gj", opts)
vim.keymap.set("v", "k", "gk", opts)

-- Zen mode shortcut — prose-width focus writing.
vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").toggle({
		window = {
			width = 85,
			options = {
				number = false,
				relativenumber = false,
				signcolumn = "no",
				cursorline = false,
				colorcolumn = "",
			},
		},
		plugins = {
			twilight = { enabled = true },
			gitsigns = { enabled = false },
		},
	})
end, { buffer = true, silent = true, desc = "Toggle Zen Mode (prose)" })
