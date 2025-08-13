return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          { 'gopls', condition = function() return vim.fn.executable('go') == 1  end },
          "intelephense",
          "luacheck",
          'editorconfig-checker',
          'lua-language-server',
          'vim-language-server',
          "stylua",
        },
        auto_update = true,
      }
    end,
  }
}
