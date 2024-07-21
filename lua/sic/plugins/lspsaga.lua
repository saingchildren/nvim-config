return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require("lspsaga").setup({})
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
    vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
    vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
