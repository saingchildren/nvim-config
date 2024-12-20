return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    opts = {},
    config = function ()
      require("CopilotChat").setup({
        keymap = {
          open = ";l",
        }
      })
    end
  },
}
