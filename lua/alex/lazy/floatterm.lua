return {
  "voldikss/vim-floaterm",

  cmd = { "FloatermNew", "FloatermToggle", "FloatermPrev", "FloatermNext" },
  -- You can omit the `keys` section because the commands above are enough,
  -- but adding it makes intent explicit and keeps lazy.nvim’s UI tidy.
  keys = {
    { "<F7>",  "<cmd>FloatermNew<CR>",   mode = { "n", "t" } },
    { "<F8>",  "<cmd>FloatermPrev<CR>",  mode = { "n", "t" } },
    { "<F9>",  "<cmd>FloatermNext<CR>",  mode = { "n", "t" } },
    { "<F12>", "<cmd>FloatermToggle<CR>",mode = { "n", "t" } },
  },
  init = function()
    vim.g.floaterm_width = 0.99
    vim.g.floaterm_height = 0.99
  end,
}
