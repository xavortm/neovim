-- Quickly remap for the way I prefer to use vim.
local ls = require("luasnip")

-- Most used map for me, to quickly Explore files (this is the :Ex command).
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, {
	desc = "[E]xplore files",
})

-- greatest remap ever :D
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Remove C-k from using digraphs
vim.keymap.set("i", "<C-k>", "<NOP>", { noremap = true, silent = true })

-- Move line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- There is a "autocmd" file, but since this basically maps
-- commands, I am keeping it here:
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }

		-- Go to definition
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, {
			desc = "Go to definition",
		})

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)

		-- Show details (signature, like hovering in VSCode)
		-- vim.keymap.set("n", "K", function()
		-- 	vim.lsp.buf.hover()
		-- end, {
		-- 	desc = "Show signature",
		-- })

		vim.keymap.set("n", "<leader>cw", function()
			vim.lsp.buf.workspace_symbol()
		end, {
			desc = "Code Workspace",
		})

		vim.keymap.set("n", "<leader>cf", function()
			vim.diagnostic.open_float()
		end, {
			desc = "Code Float",
		})

		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, {
			desc = "Code Action",
		})

		vim.keymap.set("n", "<leader>cr", function()
			vim.lsp.buf.references()
		end, {
			desc = "Code References",
		})

		vim.keymap.set("n", "<leader>cn", function()
			vim.lsp.buf.rename()
		end, {
			desc = "Code Rename",
		})

		vim.keymap.set("i", "<c-s>", function()
			vim.lsp.buf.signature_help()
		end, { buffer = true })

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "single",
			close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})

		-- Same as K but in insert mode.
		-- vim.keymap.set("i", "<C-h>", function()
		-- 	vim.lsp.buf.signature_help()
		-- end, opts)

		-- Open diagonstics float panel for easy error reading
		vim.keymap.set("n", "gl", function()
			vim.diagnostic.open_float()
		end, {
			desc = "Open diagnostics float panel",
		})
	end,
})

-- Move to window using the <ctrl> hjkl keys
-- Find harpoon keymaps in harpoon.lua

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- Select under cursor, search and replace.
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r>fC-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
	desc = "[S]earch under word and replace",
})

vim.keymap.set("i", "<C-k>", function()
	-- First try to expand emmet if in an emmet-supported filetype
	local ft = vim.bo.filetype
	local emmet_fts = { html = true, css = true, javascriptreact = true, typescriptreact = true, astro = true }

	if emmet_fts[ft] then
		local clients = vim.lsp.get_clients({ bufnr = 0, name = "emmet_ls" })
		if #clients > 0 then
			local client = clients[1]
			local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
			local result = vim.lsp.buf_request_sync(0, "textDocument/completion", params, 1000)

			if result then
				for _, res in pairs(result) do
					if res.result then
						local items = res.result.items or res.result
						if items and #items > 0 then
							local item = items[1]
							if item.textEdit then
								-- Apply the text edit (replaces abbreviation with expansion)
								local edit = item.textEdit
								local start_line = edit.range.start.line
								local start_col = edit.range.start.character
								local end_line = edit.range["end"].line
								local end_col = edit.range["end"].character

								-- Delete the abbreviation
								vim.api.nvim_buf_set_text(0, start_line, start_col, end_line, end_col, {})

								-- Move cursor to start position
								vim.api.nvim_win_set_cursor(0, { start_line + 1, start_col })

								-- Expand the snippet using LuaSnip
								ls.snip_expand(ls.parser.parse_snippet("", edit.newText))
								return
							end
						end
					end
				end
			end
		end
	end

	-- Fall back to regular LuaSnip expand
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true, noremap = true })


vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

-- Shortcut to source my luasnips file again, which will reload the snippets:
-- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/custom/snippets/all.lua<CR>", {
-- 	desc = "Reload snippets",
-- })

-- <leader>cs - Search Functions in all files
vim.keymap.set("n", "<leader>cs", function()
	require("telescope.builtin").lsp_dynamic_workspace_symbols({
		symbols = "function",
	})
end, { desc = "Code Search functions in workspace" })

-- <leader>cf was already taken for diagnostics, so using <leader>cf2
-- <leader>df - Document Functions only
vim.keymap.set("n", "<leader>df", function()
	require("telescope.builtin").lsp_document_symbols({
		symbols = "function",
	})
end, { desc = "Document Functions only" })

-- <leader>ds - Document Symbols (all types)
vim.keymap.set("n", "<leader>ds", function()
	require("telescope.builtin").lsp_document_symbols()
end, { desc = "Document Symbols (all types)" })

