return {
	{
		"daneofmanythings/chalktone.nvim",
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "┌",
						left_bottom = "└",
						right_arrow = "─",
					},
					style = "#bf3b02",
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = "echasnovski/mini.icons",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
	},
	{
		"TaDaa/vimade",
		event = "VeryLazy",
		dependencies = "echasnovski/mini.icons",
	},
}
