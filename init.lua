vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.shell = "nu"

require("config.lazy")
require("config.lsp_n_formatting_config")
require("config.appearance")
require("config.help")
require("config.notetaking")
require("config.keymaps")
