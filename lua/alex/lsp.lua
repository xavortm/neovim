--[[
LSP Configuration
Handles language server setup and auto-completion.

To install language servers:
- npm install -g cssmodules-language-server
- npm install -g vscode-css-language-server
- npm install -g css-variables-language-server
- install intelephense https://intelephense.com/ and setup serial key
- install biome - https://biomejs.dev/guides/getting-started/
- install phpcs https://github.com/squizlabs/PHP_CodeSniffer
- install go - https://go.dev/doc/install
]]

-- From nvim 0.11:
vim.lsp.enable({
	"gopls",
	"lua",
	"php",
	"html",
	"cssls",
	"tailwind",
	"css_vars",
	"cssmodules_ls",
	"pyright",
	"emmet_ls",
})

-- Makes auto complete useable
-- menuone: show popup even with one match
-- noselect: don't auto-select first item
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Enable auto complete
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client == nil then
			return
		end

		if client:supports_method("textDocument/completion") then
			-- For emmet, disable autotrigger and use manual trigger instead
			if client.name == "emmet_ls" then
				vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
			else
				vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			end
		end
	end,
})
