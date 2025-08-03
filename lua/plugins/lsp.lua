return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "lua_ls", "pylsp" },
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		{
			"neovim/nvim-lspconfig",
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"lua-language-server",
					"marksman",
					"powershell_es",
					"prettier",
					"pyment",
					"pylsp",
					"stylua",
				},
			},
		},
	},
}
