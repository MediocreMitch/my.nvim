vim.opt.number = true
vim.opt.relativenumber = true

-- Set the colorscheme and set background to transparent
require("chalktone").setup()
vim.cmd("colorscheme chalktone")

-- Make backgrounds clear
local higroups = { "Normal", "Float", "NormalNC" }
local remove_background = function(list)
	for _, bg in ipairs(list) do
		vim.cmd("hi " .. bg .. " guibg=None")
	end
end
remove_background(higroups)

-- Enable the terminal colors
vim.opt.termguicolors = true

require("nvim-highlight-colors").setup({
	render = "virtual",
})

local mini = require("mini.icons")
mini.setup()
require("nvim-tree").setup({
	disable_netrw = true,
	filters = {
		enable = false,
	},
	renderer = {
		icons = {
			web_devicons = mini.mock_nvim_web_devicons(),
			show = {
				hidden = true,
			},
		},
		indent_markers = {
			enable = true,
		},
	},
})
