return {
  "folke/zen-mode.nvim",
  config = function ()
    vim.keymap.set("n", ";zz", function ()
      require("zen-mode").setup {
        window = {
          width = 90,
          options = {}
        }
      }
      require("zen-mode").toggle()
    end)
  end
}
