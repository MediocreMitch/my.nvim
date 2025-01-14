return {
	{
		"daneofmanythings/chalktone.nvim",
	},
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		tag = "v2.0.0",
		opts = {
			colors = {
				fluo = "orange",
			},
			ui = {
				borders = "fluo",
			},
		},
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
					exclude_filetypes = {
						markdown = true,
					},
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
