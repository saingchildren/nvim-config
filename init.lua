vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = "\\"
require("sic.base")
require("sic.map")
require("sic.highlight")
require("sic.lazy")
