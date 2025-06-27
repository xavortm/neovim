return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Snippets engine:
		"L3MON4D3/LuaSnip",
	},
	config = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
}
