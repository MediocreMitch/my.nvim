return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
	opts = {
		completions = { lsp = { enabled = true } },
		indent = {
			enabled = true,
			per_level = 2,
		},
	},
}
