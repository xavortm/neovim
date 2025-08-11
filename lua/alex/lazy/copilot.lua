return {
return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
    config = function()
      vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', {
        expr = true,
        silent = true,
        noremap = true,
        desc = "Copilot: Accept suggestion",
      })
    end,
  },
}
}
