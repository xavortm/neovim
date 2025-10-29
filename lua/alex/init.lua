--[[
Welcome to my Neovim config!
This setup is simple, fast, and lightweight, with essential dev features.

File summary:
	init.lua           - Loads all main config modules.
	autocmd.lua        - Custom autocommands.
	remap.lua          - Key remappings.
	set.lua            - Editor options/settings.
	lazy_init.lua      - Lazy.nvim plugin manager setup.
	lazy/              - Plugin configs (one file per plugin).
]]

require("alex.lazy_init")
require("alex.remap")
require("alex.autocmd")
require("alex.set")

-- To install language servers:
-- npm install -g cssmodules-language-server
-- npm install -g vscode-css-language-server
-- npm install -g css-variables-language-server
-- install intelephense https://intelephense.com/ and setup serial key
-- install biome - https://biomejs.dev/guides/getting-started/
-- install phpcs https://github.com/squizlabs/PHP_CodeSniffer
-- install go - https://go.dev/doc/install

-- From nvim 0.11:
vim.lsp.enable({
	"gopls",
	"lua",
	"php",
	"cssls",
	"tailwind",
	"css_vars",
	"cssmodules_ls",
})

-- Makes auto complete useable
vim.cmd("set completeopt+=noselect")

-- Enable auto complete
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client == nil then
			return
		end

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
