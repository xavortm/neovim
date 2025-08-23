return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "never" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(_bufnr)
				local lsp_format_opt = "never"
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome", "biome-organize-imports" },
				javascriptreact = { "biome", "biome-organize-imports" },
				typescript = { "biome", "biome-organize-imports" },
				typescriptreact = { "biome", "biome-organize-imports" },
				go = { "goimports", "gofmt" },
			},
		},
	},
}
