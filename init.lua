require("config.lazy")
require("config.lsp")
require("config.markdown")

vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 3
vim.o.tabstop = 3
vim.o.cot = "fuzzy,menuone,noselect,popup"
vim.cmd([[colorscheme tokyonight-night]])

vim.g.undotree_DiffCommand = "FC"
