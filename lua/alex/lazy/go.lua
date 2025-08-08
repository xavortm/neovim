return {
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lsp_keymaps = true,  -- Enable Go-specific LSP keymaps
      lsp_codelens = true, -- Enable code lens
      diagnostic = {       -- Customize diagnostics
        underline = true,
        virtual_text = { space = 0, prefix = "■" },
        signs = true,
      },
    },
    config = function(_lp, opts)
      require("go").setup(opts)
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          local ok, err = pcall(function()
            require('go.format').goimports()
          end)
          if not ok then
            vim.notify("Go format failed: " .. err, vim.log.levels.WARN)
          end
        end,
        group = format_sync_grp,
      })
    end,
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}
