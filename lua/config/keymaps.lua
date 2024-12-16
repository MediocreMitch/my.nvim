local wk = require("which-key")
--
-- Neovide Only Key Remaps
--

local function wkey_toggle(val)
	if val then
		return { icon = "", color = "green" }
	else
		return { icon = "", color = "orange" }
	end
end

if vim.g.neovide then
	vim.g.neovide_profiler = false
	wk.add({
		{ "<leader>`", group = "Neovide" },
		{
			"<leader>``",
			mode = "n",
			icon = function()
				return wkey_toggle(vim.g.neovide_profiler)
			end,
			function()
				vim.g.neovide_profiler = not vim.g.neovide_profiler
			end,
			desc = "Toggle Neovide Profiler",
		},
	})
end

--
--	Adding Keymaps
--
wk.add({
	--
	--	General Keymaps
	--
	{ "<leader>/", mode = "n", ":noh<cr>", desc = "Clear Highlighted" },
	{ "<leader>pv", mode = "n", ":Ex<cr>", desc = "Open Explorer" },
	{ "<C-h>", mode = "n", ":wincmd h<cr>" },
	{ "<C-l>", mode = "n", ":wincmd l<cr>" },
	{ "<C-k>", mode = "n", ":wincmd k<cr>" },
	{ "<C-j>", mode = "n", ":wincmd j<cr>" },
	{ "<C-,>", mode = "n", ":wincmd <<cr>" },
	{ "<C-.>", mode = "n", ":wincmd ><cr>" },
	{ "<C-=>", mode = "n", ":wincmd +<cr>" },
	{ "<C-->", mode = "n", ":wincmd -<cr>" },
	--
	--	Which Key Reveal Current Buffer Binds
	--
	{
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
		icon = { icon = "⁇", color = "purple" },
	},
	--
	--	Markdown Open File
	--
	{
		"<leader>m",
		function()
			if vim.bo.filetype == "markdown" then
				local file = vim.fn.getreg("%")
				vim.api.nvim_command('!"' .. file .. '"')
			end
		end,
		desc = "Open file in browser if it is a Markdown file",
	},
	--
	--	Lazy Keymaps
	--
	{ "<leader>L", mode = "n", ":Lazy<cr>", desc = "Lazy", icon = "󰒲" },
	--
	--	Telescope keybinds
	--
	{ "<leader>f", group = "Telescope" },
	{ "<leader>fc", group = "Config Files" },
	{
		"<leader>fcc",
		mode = "n",
		function()
			require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Search for File",
	},
	{
		"<leader>fcg",
		mode = "n",
		function()
			require("telescope.builtin").live_grep({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Grep File Contents",
	},
	{ "<leader>ff", mode = "n", ":Telescope find_files<cr>", desc = "Search From CWD" },
	{ "<leader>fr", mode = "n", ":Telescope oldfiles<cr>", desc = "Search Recently Open" },
	{ "<leader>fg", mode = "n", ":Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fb", mode = "n", ":Telescope buffers<cr>", desc = "Search Buffers" },
	{ "<leader>fs", mode = "n", ":Telescope symbols<cr>", desc = "Search Symbols" },
	{ "<leader>fht", mode = "n", ":Telescope help_tags<cr>", desc = "Search Help Tags" },
	{ "<leader>fp", mode = "n", ":Telescope lazy_plugins<CR>", desc = "Plugins" },
	{ "<leader>fh", mode = "n", ":Telescope helpgrep<cR>", desc = "Help Grep" },
	--	Telescope LSP
	{ "<leader>fl", group = "Telescope LSP Options" },
	{ "<leader>flr", mode = "n", ":Telescope lsp_references<cr>", desc = "List LSP references for word under cursor" },
	{ "<leader>fld", mode = "n", ":Telescope diagnostics<cr>", desc = "List LSP diagnostics for open buffer" },
	{
		"<leader>flD",
		mode = "n",
		":Telescope lsp_definitions<cr>",
		desc = "Got to definition or show list of definitions",
	},
	--
	--	Trouble Keybind
	--
	{ "<leader>x", group = "Diagnostics" },
	{ "<leader>c", group = "LSP Nav Toggles" },
	{ "<leader>xx", ":Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
	{ "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
	{ "<leader>cs", ":Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
	{
		"<leader>cl",
		":Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / references / ... (Trouble)",
	},
	{ "<leader>xL", ":Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
	{ "<leader>xQ", ":Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
	--
	-- Snacks Keybinds
	--
	{ "<leader>s", group = "Snacks", icon = { icon = "󰐢", color = "orange" } },
	{ "<leader>sn", group = "Snacks Notification" },
	-- Snacks.terminal
	{ "<leader>st", ":lua Snacks.terminal()<cr>", desc = "Toggle Terminal" },
	-- Snacks.notifier
	{ "<leader>snh", ":lua Snacks.notifier.show_history()<cr>", desc = "Show Notification History" },
	-- Snacks.scratch
	{ "<leader>ss", ":lua Snacks.scratch()<cr>", desc = "Open Scratch" },
	--
	--	Timestamp
	--
	{
		"<leader>ts",
		function()
			local pos = vim.api.nvim_win_get_cursor(0)[2]
			local line = vim.api.nvim_get_current_line()
			local nline = line:sub(0, pos) .. os.date() .. line:sub(pos + 1)
			vim.api.nvim_set_current_line(nline)
		end,
		desc = "Insert timestamp (Format: 12/16/2024 3:21:31 PM)",
	},
})
