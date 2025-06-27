-- read docs at: https://github.com/rose-pine/neovim?tab=readme-ov-file
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
            -- Setup copied from a recepie from the docs.
			highlight_groups = {
				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
			},
		})
		vim.cmd("colorscheme rose-pine")
	end
}
