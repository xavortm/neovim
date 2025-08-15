return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    "fang2hou/blink-copilot",
  },
  version = '1.*',
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500
      },
      accept = {
        auto_brackets = {
          enabled = false
        },
      },
      trigger = {
        show_on_insert = false,
      }
    },
    sources = {
      default = { 'copilot', 'lsp', 'path', 'snippets' },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning"
    }
  },
  signature = { enabled = true },
  opts_extend = { "sources.default" },

  config = function(_, opts)
    require("blink.cmp").setup(opts)
  end,
}
