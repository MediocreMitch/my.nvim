vim.keymap.set("n", "<leader>/", ":noh<cr>")

--
--
--	Nvim Tree Remap
--
--

vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("NvimTreeOpen")
	vim.cmd("NvimTreeFocus")
end)

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
	wilder.popupmenu_renderer({
		border = wilder.popupmenu_border_theme({
			border = { "", " ", "", "", "", "", "", "" },
		}),
		spinner = wilder.popupmenu_spinner({
			frames = { "", "", "", "" },
		}),
	})
)
