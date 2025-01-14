return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope-github.nvim",
			"catgoose/telescope-helpgrep.nvim",
			"polirritmico/telescope-lazy-plugins.nvim",
			"OliverChao/telescope-picker-list.nvim",
			{
				dir = "~/projects/notes.nvim",
				name = "notes",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
	},
	{
		"hedyhli/outline.nvim",
		event = "VeryLazy",
		cmd = { "Outline", "OutlineOpen" },
		opts = {
			outline_window = {
				focus_on_open = false,
			},
		},
	},
	-- {
	-- 	"lewis6991/hover.nvim",
	-- },
}
