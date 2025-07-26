require("config.lazy")
require("config.keybinds")
require("config.lsp")
require("config.markdown")

--Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Formatting
vim.o.shiftwidth = 3
vim.o.tabstop = 3

-- LSP autocomplete window
vim.o.cot = "fuzzy,menuone,noselect,popup"

-- Colorscheme setup
vim.cmd([[colorscheme kanagawa-dragon]])

-- Set Undotree command for windows
local os = package.config:sub(1, 1) == "\\" and "win" or "unix"
if os == "win" then
	vim.g.undotree_DiffCommand = "FC"
end
