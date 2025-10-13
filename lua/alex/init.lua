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

-- From nvim 0.11:
vim.lsp.enable({ "gopls", "lua", "tsgo" })

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
