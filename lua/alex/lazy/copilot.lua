return {
	{
		"github/copilot.vim",
		event = "BufWinEnter",
		init = function()
			vim.g.copilot_no_maps = true
			vim.g.copilot_no_tab_maps = true
			vim.g.copilot_assume_mapped = true
		end,
		config = function()
			-- Block the normal Copilot suggestions
			vim.api.nvim_create_augroup("github_copilot", { clear = true })
			vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
				group = "github_copilot",
				callback = function(args)
					vim.fn["copilot#On" .. args.event]()
				end,
			})
			vim.fn["copilot#OnFileType"]()
		end,
	},
}
