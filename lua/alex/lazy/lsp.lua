return {
  "neovim/nvim-lspconfig",

  dependencies = {
    -- Snippets engine:
    "L3MON4D3/LuaSnip",
    'saghen/blink.cmp',
  },

  opts = {
    servers = {
      cssmodules_ls = {},
      css_variables = {},
      cssls = {},
      tailwindcss = {},
      vimls = {},
      intelephense = {
        settings = {
          intelephense = {
            stubs = {
              "bcmath", "bz2", "calendar", "Core", "ctype", "curl", "date", "dom", "exif",
              "fileinfo", "filter", "ftp", "gd", "gettext", "hash", "iconv", "imagick",
              "intl", "json", "libxml", "mbstring", "mysqli", "mysqlnd", "openssl",
              "password", "pcre", "PDO", "pdo_mysql", "Phar", "readline", "redis",
              "Reflection", "session", "SimpleXML", "soap", "sockets", "sodium", "SPL",
              "standard", "tokenizer", "xml", "xmlreader", "xmlwriter", "zip", "zlib",
              "wordpress", "php"
            },
            files = {
              maxSize = 1000000
            },
          },
        },
      },

      lua_ls = {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
              path ~= vim.fn.stdpath('config')
              and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT',
              path = {
                'lua/?.lua',
                'lua/?/init.lua',
              },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
              }
            }
          })
        end,
        settings = {
          Lua = {}
        }
      }
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')

    -- Defines the on_attach function
    local on_attach = function(_client, bufnr)
      -- lsp_signature
      require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
          border = "rounded",
        },
      }, bufnr)
    end

    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      --
      -- Attaches the on_attach function to each server
      -- while preserving any existing on_attach functions
      local original_on_attach = config.on_attach
      config.on_attach = function(client, bufnr)
        if original_on_attach then
          original_on_attach(client, bufnr)
        end
        on_attach(client, bufnr)
      end
      lspconfig[server].setup(config)
    end
  end
}
