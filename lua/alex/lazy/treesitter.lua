return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
		},
		config = function()
			local langs = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"jsdoc",
				"php",
				"html",
				"css",
				"go",
				"markdown",
				"markdown_inline",
				"gitcommit",
				"gitignore",
				"git_config",
				"git_rebase",
				"diff",
			}

			require("nvim-treesitter").install(langs)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = langs,
				callback = function(args)
					pcall(vim.treesitter.start)
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					if args.match == "markdown" then
						vim.bo[args.buf].syntax = "ON"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup()
		end,
	},
}
