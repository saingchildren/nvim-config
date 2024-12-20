local function file_browser()
  local opts = {
    --
    path = "%:p:h",
    select_buffer = true,
    hidden = true,
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 
    "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope-file-browser.nvim',
    'barrett-ruth/telescope-http.nvim',
  },
  config = function()
    local fb_actions = require "telescope".extensions.file_browser.actions
    require('telescope').setup({
      defaults = {
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s  (%s)", tail, path)
        end,
        file_ignore_patterns =  {
          "node_modules/*",
          "node_modules/",
          "pack/",
          "pack/*",
          "**/*.png",
          "**/*.jpg",
          "**/*.doc",
          "**/*.xlsx",
          "**/*.pdf"
        },
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            mirror = true,
            preview_height = 0.5,  -- 设置预览窗口高度
          },
          width = 0.8,
          height = 0.9,
          preview_cutoff = 20,
        },
        mappings = {
          i = {
            ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
            ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
          },
          n = {
            ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
            ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            path_display = { "smart" },
          }
        }
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", ";f", builtin.find_files, {})
    vim.keymap.set("n", ";r", builtin.live_grep, {})
    vim.keymap.set("n", "sf", file_browser, {})
    vim.keymap.set("n", ";p", builtin.git_files, {})
    vim.keymap.set("n", ";h", builtin.help_tags, {})

    require("telescope").load_extension("file_browser")
  end
}
