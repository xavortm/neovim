return { 
  "bluz71/vim-moonfly-colors",
  name = "moonfly",
  lazy = false,
  priority = 1000,
  init = function ()
    vim.g.moonflyNormalFloat = true
    vim.g.moonflyTransparent = true
  end,
  config = function ()
    vim.cmd.colorscheme("moonfly")
  end,
}
