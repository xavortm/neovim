return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"plenary", -- short form as I named it.
		},

		config = function()
			local harpoon = require("harpoon")

			harpoon:setup() -- Required before adding keymaps.

			-- Add file to harpoon list.
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():append()
			end, {
				desc = "Add to harpoon",
			})

			-- Open harpoon picker
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			-- I need to find good new shortcuts.
			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-j>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-k>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-l>", function()
				harpoon:list():select(4)
			end)
		end,
	},
}
