return {
	"stevearc/conform.nvim",
	event = { "BufWinEnter" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
}
