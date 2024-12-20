local keymap = vim.keymap

keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "<leader>p", "<Cmd>Prettier<CR>")
keymap.set("n", "<M-m>", ":Copilot panel<CR>", { noremap = true, silent = true })
