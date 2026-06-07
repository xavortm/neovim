return {
	"folke/zen-mode.nvim",
	dependencies = { "folke/twilight.nvim" },
	opts = {
		window = {
			backdrop = 1,
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
	},
}
