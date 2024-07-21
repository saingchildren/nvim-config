return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  config = function()
    require('nvim-ts-autotag').setup({})
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vimdoc",
        "javascript",
        "typescript",
        "lua",
        "jsdoc",
        "html",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      }
    })
  end
}
