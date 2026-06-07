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
		opts = function()
			local function has_biome_config()
				local biome_files = { "biome.json", "biome.jsonc", ".biome.json", ".biome.jsonc" }
				local cwd = vim.fn.getcwd()
				for _, file in ipairs(biome_files) do
					if vim.fn.filereadable(cwd .. "/" .. file) == 1 then
						return true
					end
				end
				return false
			end

			local js_formatters
			local json_formatter
			if has_biome_config() then
				js_formatters = { "biome", "biome-organize-imports" }
				json_formatter = { "biome" }
			else
				js_formatters = { "prettier" }
				json_formatter = { "prettier" }
			end

			return {
				notify_on_error = false,
				format_on_save = function(_bufnr)
					return {
						timeout_ms = 500,
						lsp_format = "never",
					}
				end,
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = js_formatters,
					javascriptreact = js_formatters,
					typescript = js_formatters,
					typescriptreact = js_formatters,
					json = json_formatter,
					go = { "goimports", "gofmt" },
				},
			}
		end,
	},
}
