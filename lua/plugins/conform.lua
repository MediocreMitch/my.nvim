return {
	"stevearc/conform.nvim",
	event = { "BufWinEnter" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			cs = { "csharpier" },
		},
	},
}
