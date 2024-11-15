vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.scrolloff = 8

vim.opt.wrap = true

-- Set the colorscheme and set background to transparent
require("chalktone").setup()
vim.cmd("colorscheme chalktone")

-- Make backgrounds clear
local higroups = {
	"Normal",
	"Float",
	"NormalNC",
	"VertSplit",
	"SignColumn",
}
local remove_background = function(list)
	for _, bg in ipairs(list) do
		vim.cmd("hi " .. bg .. " guibg=None")
	end
end
remove_background(higroups)

-- Remove status bar at bottom to clean up the appearance
vim.cmd("set laststatus=0")
-- Winbar at top to still get a small amount of info for each window
vim.cmd("hi MyWinbar guibg=None guifg=#f58433")
vim.cmd("set winbar=%#MyWinbar#%n\\ %f\\ %y\\ %m%r%=%-14.(%l,%c%V%)\\ %P\\/%L")
-- Changing split apprarances
local splitchanges = {
	"vert: ",
	"vertright: ",
	"vertleft: ",
	"verthoriz: ",
	"horiz: ",
	"horizup: ",
	"horizdown: ",
	"eob: ",
}
local changesplits = function(list)
	for _, sc in ipairs(list) do
		vim.cmd("set fillchars+=" .. sc)
	end
end
changesplits(splitchanges)

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
	view = {
		width = 35,
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
	modified = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
})

--
--
-- Wilder Setup
--
--

local wilder = require("wilder")
wilder.setup({ modes = { ":" } })
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer({
		highlighter = wilder.basic_highlighter(),
		left = { " ", wilder.popupmenu_devicons() },
		right = { " ", wilder.popupmenu_scrollbar() },
	})
)

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		border = { "", " ", "", "", "", "", "", "" },
	}))
)
