return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
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
		--	Which Key Reveal Current Buffer Binds
		--
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		--
		--	Lazy Keymaps
		--
		{ "<leader>L", ":Lazy<cr>", desc = "Lazy" },
		--
		--	Telescope keybinds
		--
		{
			"<leader>fc",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Search for File",
		},
		{
			"<leader>fp",
			function()
				require("telescope.builtin").find_files({ cwd = "~/projects" })
			end,
			desc = "Find Project Files",
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
		{ "<leader>gh", ":Telescope helpgrep<cr>", desc = "Help Grep" },
		{ "<leader>tp", ":Telescope picker_list<cr>", desc = "Picker List" },
		--	Telescope LSP
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
		--
		--	Trouble Keybind
		--
		{ "<leader>x", group = "Diagnostics" },
		{ "<leader>c", group = "LSP Nav Toggles" },
		{ "<leader>xx", ":Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		{
			"<leader>xX",
			":Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{ "<leader>cs", ":Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
		{
			"<leader>cl",
			":Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{ "<leader>xL", ":Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
		{ "<leader>xQ", ":Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
	},
}
