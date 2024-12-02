vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.scrolloff = 8

vim.opt.wrap = true

--
--
-- Neovide Appearance Config
--
--
local alpha = function()
	return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end
if vim.g.neovide then
	vim.g.neovide_transparency = 0.8
	vim.g.transparency = 0.8
	vim.g.neovide_background_color = "#0f1117" .. alpha()
	vim.g.neovide_cursor_trail_size = 0.4
	vim.g.neovide_cursor_animation_length = 0.05
end

--
--
-- Neovim Appearance Config

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
	"Terminal",
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
