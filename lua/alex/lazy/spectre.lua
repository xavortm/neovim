return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"plenary",
	},
	config = function()
		local spectre = require("spectre")

		spectre.setup()

		vim.keymap.set("n", "<leader>R", function()
			spectre.toggle()
		end, {
			desc = "Toggle Spectre",
		})

		vim.keymap.set("n", "<leader>rw", function()
			spectre.open_visual({ select_word = true })
		end, {
			desc = "Search current word",
		})

		vim.keymap.set("v", "<leader>rw", function()
			spectre.open_visual()
		end, {
			desc = "Search current selection",
		})

		vim.keymap.set("n", "<leader>rp", function()
			spectre.open_file_search({ select_word = true })
		end, {
			desc = "Search in current file",
		})
	end,
}
