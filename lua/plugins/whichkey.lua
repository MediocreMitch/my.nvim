return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		---- Window navigation/resizing
		{ "<C-h>", ":wincmd h<cr>" },
		{ "<C-l>", ":wincmd l<cr>" },
		{ "<C-k>", ":wincmd k<cr>" },
		{ "<C-j>", ":wincmd j<cr>" },
		{ "<C-,>", ":wincmd <<cr>" },
		{ "<C-.>", ":wincmd ><cr>" },
		{ "<C-=>", ":wincmd +<cr>" },
		{ "<C-->", ":wincmd -<cr>" },
		{ "<C-x>", ":wincmd x<cr>" },
		---- Toggle Folds
		{ "<cr>", "za" },
		{ "<leader>/", ":noh<cr>", desc = "Clear Highlighted" },
		{ "<leader>pv", ":Ex<cr>", desc = "Open Explorer" },
		----	Which Key Reveal Current Buffer Binds
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		----	Lazy Keymaps
		{ "<leader>L", ":Lazy<cr>", desc = "Lazy" },
		----	Telescope keybinds
		{
			"<leader>fc",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Search for File",
		},
		{ "<leader>ff", ":Telescope find_files<cr>", desc = "Search From CWD" },
		{ "<leader>fr", ":Telescope oldfiles<cr>", desc = "Search Recently Open" },
		{ "<leader>fb", ":Telescope buffers<cr>", desc = "Search Buffers" },
		{ "<leader>fs", ":Telescope symbols<cr>", desc = "Search Symbols" },
		{ "<leader>fh", ":Telescope help_tags<cr>", desc = "Search Help Tags" },
		{ "<leader>fe", ":Telescope lazy_plugins<cr>", desc = "Plugins" },
		{
			"<leader>gc",
			function()
				require("telescope.builtin").live_grep({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Grep File Contents",
		},
		{ "<leader>gf", ":Telescope live_grep<cr>", desc = "Live Grep" },
		----	Telescope LSP
		{ "<leader>fl", group = "Telescope LSP Options" },
		{
			"<leader>flr",
			":Telescope lsp_references<cr>",
			desc = "List LSP references for word under cursor",
		},
		{ "<leader>fld", ":Telescope diagnostics<cr>", desc = "List LSP diagnostics for open buffer" },
		{
			"<leader>flD",
			":Telescope lsp_definitions<cr>",
			desc = "Got to definition or show list of definitions",
		},
	},
}
