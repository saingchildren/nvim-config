return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "onsails/lspkind-nvim",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "volar",
        "vls",
        "tailwindcss",
        "pyright"
      },
      handlers = {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
                capabilities = capabilities
            }
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
        --["volar"] = function ()
        --  local lspconfig = require("lspconfig")
        --  lspconfig.volar.setup {
        --    capabilities = capabilities,
        --    filetypes = {
        --      "javascript",
        --      "typescript",
        --      "javascriptreact",
        --      "javascript.jsx",
        --      "typescriptreact",
        --      "typescript.tsx",
        --      "vue",
        --    }
        --  }
        --end,
        ["tsserver"] = function ()
          local lspconfig = require("lspconfig")
          lspconfig.tsserver.setup {
          capabilities = capabilities,
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "C:/Users/a2251/scoop/apps/nvm/current/nodejs/nodejs/node_modules/@vue/typescript-plugin",
                languages = { "javascript", "typescript", "vue", "tsx"},
              },
            },
          },
          filetypes = {
            "javascript",
            "typescript",
            "javascriptreact",
            "javascript.jsx",
            "typescriptreact",
            "typescript.tsx",
            "vue",
          }
        }
        end
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Insert }
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "path" }
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = " symbol",
            symbol_map = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
          },
        })
      }
    })

    --cmp command line
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer "}
      }
    })

    vim.diagnostic.config({
      -- update_in_insert = true, if true instsert mode will diagnostic code
      virtual_text = false,
      float = {
        source = "always",
      },
    })
    vim.g.python3_host_prog = "C:/Users/a2251/.pyenv/pyenv-win/shims/python3.bat"
  end
}
