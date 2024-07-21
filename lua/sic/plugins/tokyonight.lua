return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local tokyonight = require("tokyonight")
    tokyonight.setup({
      style = "storm",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function (hl, c)
        local prompt = "#2d3149" 
        hl.LineNr = {
          fg = c.blue,
          bg = "NONE"
        }
        hl.CursorLineNr = {
          fg = c.yellow,
          bg = "NONE",
          bold = true,
        }
      end
    })
    tokyonight.load()
    vim.cmd([[
        hi NormalFloat guibg=#1e222a
        hi FloatBorder guibg=#1e222a guifg=#3e4452
      ]])
  end
}
