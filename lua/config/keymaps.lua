--
--	Adding Keymaps
--
local wk = require("which-key")
wk.add({
	--
	--	General Keymaps
	--
	{ "<leader>/", mode = "n", ":noh<cr>", desc = "Clear Highlighted" },
	{ "<leader>pv", mode = "n", ":Ex<cr>", desc = "Open Explorer" },
	{ "<C-h>", mode = "n", ":wincmd h" },
	{ "<C-l>", mode = "n", ":wincmd l" },
	{ "<C-k>", mode = "n", ":wincmd k" },
	{ "<C-j>", mode = "n", ":wincmd j" },
	--
	--	Markdown Keybinds
	--
	{ "<C-m>", mode = "n", ":MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" },
	--
	--	Lazy Keymaps
	--
	{ "<leader>L", mode = "n", ":Lazy<cr>", desc = "Lazy", icon = "󰒲" },
	--
	--	Telescope keybinds
	--
	{ "<leader>f", group = "Telescope" },
	{
		"<leader>fc",
		mode = "n",
		function()
			require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Search Config Files",
	},
	{ "<leader>ff", mode = "n", ":Telescope find_files<cr>", desc = "Search From CWD" },
	{ "<leader>fo", mode = "n", ":Telescope oldfiles<cr>", desc = "Search Recently Open" },
	{ "<leader>fg", mode = "n", ":Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fb", mode = "n", ":Telescope buffers<cr>", desc = "Search Buffers" },
	{ "<leader>fs", mode = "n", ":Telescope symbols<cr>", desc = "Search Symbols" },
	{ "<leader>fht", mode = "n", ":Telescope help_tags<cr>", desc = "Search Help Tags" },
	{ "<leader>fp", mode = "n", ":Telescope lazy_plugins<CR>", desc = "Plugins" },
	{ "<leader>fh", mode = "n", ":Telescope helpgrep<CR>", desc = "Help Grep" },
	--	Telescope LSP
	{ "<leader>fl", group = "LSP Options" },
	{ "<leader>flr", mode = "n", ":Telescope lsp_references<cr>", desc = "List LSP references for word under cursor" },
	{ "<leader>fld", mode = "n", ":Telescope diagnostics<cr>", desc = "List LSP diagnostics for open buffer" },
	{
		"<leader>flD",
		mode = "n",
		":Telescope lsp_definitions<cr>",
		desc = "Got to definition or show list of definitions",
	},
	--
	-- Snacks Keybinds
	--
	{ "<leader>s", group = "Snacks", icon = { icon = "󰐢", color = "orange" } },
	{ "<leader>sn", group = "Snacks Notification" },
	-- Snacks.terminal
	{ "<leader>st", ":lua Snacks.terminal()<cr>", desc = "Toggle Terminal" },
	-- Snacks.notifier
	{ "<leader>snh", ":lua Snacks.notifier.show_history()<cr>", desc = "Show Notification History" },
})

--
-- Neovide Key Remaps
--
if vim.g.neovide then
	vim.g.neovide_profiler = false
	wk.add({
		{ "<leader>`", group = "Neovide" },
		{
			"<leader>``",
			mode = "n",
			function()
				vim.g.neovide_profiler = not vim.g.neovide_profiler
			end,
			desc = "Open Neovide Profiler",
		},
	})
end
