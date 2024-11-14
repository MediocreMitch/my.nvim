vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.scrolloff = 8

vim.opt.wrap = true

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

-- Fade unfocused windows to help keep track of current window
require("vimade").setup({
	fadelevel = function(style)
		if style.win.buf_opts.syntax == "NvimTree" then
			return 0.85
		else
			return 0.7
		end
	end,
})

-- Enable the terminal colors
vim.opt.termguicolors = true

-- Show preview of selected colors
--	"#eb4034"
--	"rgb(52, 180, 235)
--	hsl(281° 82% 56%)
--	red
require("nvim-highlight-colors").setup({
	render = "virtual",
})

-- Adding Nerd Icons
local mini = require("mini.icons")
mini.setup()

-- Configuring mini.icons for nvim-tree
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
