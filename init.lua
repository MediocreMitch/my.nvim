vim.g.mapleader = " "
vim.g.maplocalleader = " "

if package.config:sub(1,1) == '\\' then
	vim.o.shell = "pwsh"
end

require("config.lazy")
require("config.lsp_n_formatting_config")
require("config.appearance")
require("config.keymaps")
