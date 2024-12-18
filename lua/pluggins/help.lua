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
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
	},
}
