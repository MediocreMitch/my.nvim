vim.g.mapleader = " "
vim.g.maplocalleader = " "

if string.match(os.getenv("os"), "Window") then
	vim.cmd("set shell=pwsh")
end

require("config.lazy")
require("config.lsp_n_formatting_config")
require("config.appearance")
require("config.keymaps")
