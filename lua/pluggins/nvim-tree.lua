return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		disable_netrw = true,
		filters = {
			dotfiles = false,
		},
		renderer = {
			hidden_display = "all",
			icons = {
				web_devicons = require("mini.icons").mock_nvim_web_devicons(),
				show = {
					hidden = true,
				},
			},
			indent_markers = {
				enable = true,
			},
		},
	},
}
