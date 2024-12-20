return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
       suggestion = {
        enabled = true,
        auto_trigger = false,
        -- hide_during_completion = true,
        -- decounce = 75,
        keymap = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
        },
        layout = {
          position = "bottom",
          ratio = 0.4
        },
      },
      filetypes = {
        python = true,
        javascript = true,
        vue = true,
        tsx = true,
        jsx = true,
        typescript = true,
        lua = true,
      },

      copilot_node_command = 'node',
    })
  end,
}
