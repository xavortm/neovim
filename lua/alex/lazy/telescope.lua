return {
	{
		"nvim-telescope/telescope.nvim",

		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
			"plenary",
		},

		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})

			local telescope = require("telescope")

			telescope.load_extension("live_grep_args")
			telescope.load_extension("ui-select")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>sf", builtin.find_files, {
				desc = "[S]earch all files",
			}) -- Find all files

			vim.keymap.set("n", "<C-p>", builtin.git_files, {}) -- Find all in git

			-- Search with args:
			vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
			--
			-- Find everything matching the word under the cursor
			vim.keymap.set("n", "<leader>sw", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end, {
				desc = "[S]earch under cursor",
			})

			-- Find everything matching the word under the cursor (longer?)
			vim.keymap.set("n", "<leader>sWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end, {
				desc = "[S]earch under cursor (long)",
			})

			-- Quite straightforward.
			vim.keymap.set("n", "<leader>ss", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, {
				desc = "[S]earch with telescope",
			})

			-- Love this!
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, {
				desc = "[S]earch visual help",
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
