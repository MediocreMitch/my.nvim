return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		filters = {
			dotfiles = false,
		},
		renderer = {
			icons = {
				web_devicons = require("mini.icons").mock_nvim_web_devicons(),
			},
		},
	},
}
