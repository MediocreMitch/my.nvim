return {
	{
		"simonefranza/nvim-conv",
		event = "VeryLazy",
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		opts = {
			indent = {
				enabled = true,
				per_level = 2,
			},
		},
	},
	{
		"Myzel394/easytables.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
