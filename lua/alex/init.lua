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