vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.lsp_n_formatting_config")
require("config.appearance")
require("config.help")
require("config.notetaking")
require("config.keymaps")
if os.getenv("USERDOMAIN") == "BLUEORIGIN" then
	require("config.blue")
end
