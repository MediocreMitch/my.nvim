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

local CONVERSION = {
	far = "ConvFarenheit",
	cel = "ConvCelsius",
}

local function conversion(conTo)
	conTo = CONVERSION[conTo] or nil
	if conTo then
		local startLine = vim.api.nvim_get_current_line()
		local visHigh = string.sub(startLine, vim.fn.getpos("'<")[3], vim.fn.getpos("'>")[3])
		local conver = vim.api.nvim_exec2(conTo .. " " .. visHigh, { output = true })["output"]
		vim.cmd(":'<,'>s/" .. visHigh .. "/" .. string.match(conver, "%S+$"))
	end
end

if vim.g.neovide then
	vim.g.neovide_profiler = false
	wk.add({
		{ "<leader>`", group = "Neovide" },
		{
			"<leader>``",
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
	{
		-- Window navigation/resizing
		{ "<C-h>", ":wincmd h<cr>" },
		{ "<C-l>", ":wincmd l<cr>" },
		{ "<C-k>", ":wincmd k<cr>" },
		{ "<C-j>", ":wincmd j<cr>" },
		{ "<C-,>", ":wincmd <<cr>" },
		{ "<C-.>", ":wincmd ><cr>" },
		{ "<C-=>", ":wincmd +<cr>" },
		{ "<C-->", ":wincmd -<cr>" },
		{ "<C-x>", ":wincmd x<cr>" },
	},
	{
		{ "<cr>", "za" },
	},
	{ "<leader>/", ":noh<cr>", desc = "Clear Highlighted" },
	{ "<leader>pv", ":Ex<cr>", desc = "Open Explorer" },
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
	--	Outline Open
	--
	{
		"<leader>o",
		function()
			vim.cmd("Outline")
			vim.g.outline = not vim.g.outline
		end,
		icon = function()
			wkey_toggle(vim.g.outline)
		end,
		desc = "Toggle Outline",
	},
	--
	--	Markdown
	--
	{
		"<leader>mo",
		function()
			if vim.bo.filetype == "markdown" then
				local file = vim.fn.getreg("%")
				vim.api.nvim_command('!"' .. file .. '"')
			end
		end,
		desc = "Open file in browser if it is a Markdown file",
	},
	{ "<leader>nt", group = "Tables" },
	{ "<leader>nl", group = "Lines" },
	{ "<leader>nte", ":EasyTablesImportThisTable<cr>", desc = "Edit table under cursor" },
	{ "<leader>ntan", ":s/\\(\\|\\)[^\\|]\\+/\\1---/g<cr>:noh<cr>", desc = "Unalign Table Items" },
	{ "<leader>ntac", ":s/\\(\\|\\)[^\\|]\\+/\\1:---:/g<cr>:noh<cr>", desc = "Center Align Table Items" },
	{ "<leader>ntah", ":s/\\(\\|\\)[^\\|]\\+/\\1:---/g<cr>:noh<cr>", desc = "Left Align Table Items" },
	{ "<leader>ntal", ":s/\\(\\|\\)[^\\|]\\+/\\1---:/g<cr>:noh<cr>", desc = "Right Align Table Items" },
	--
	--	Lazy Keymaps
	--
	{ "<leader>L", ":Lazy<cr>", desc = "Lazy", icon = "󰒲" },
	--
	--	Telescope keybinds
	--
	{
		"<leader>f",
		group = "Telescope",
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
	},
	{
		"<leader>g",
		group = "Grep",
		{
			"<leader>gc",
			function()
				require("telescope.builtin").live_grep({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Grep File Contents",
		},
		{ "<leader>gf", ":Telescope live_grep<cr>", desc = "Live Grep" },
		{ "<leader>gh", ":Telescope helpgrep<cr>", desc = "Help Grep" },
	},
	{ "<leader>tp", ":Telescope picker_list<cr>", desc = "Picker List" },
	--	Telescope LSP
	{ "<leader>fl", group = "Telescope LSP Options" },
	{ "<leader>flr", ":Telescope lsp_references<cr>", desc = "List LSP references for word under cursor" },
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
	--	Hover Keymaps
	--
	{
		-- { "K", require("hover").hover, desc = "Hover.nvim" },
		-- { "gK", require("hover").hover_select, desc = "Hover.nvim (select)" },
		-- {
		-- 	"<C-p>",
		-- 	function()
		-- 		require("hover").hover_switch("previous")
		-- 	end,
		-- 	desc = "Hover.nvim previous",
		-- },
		-- {
		-- 	"<C-n>",
		-- 	function()
		-- 		require("hover").hover_switch("next")
		-- 	end,
		-- 	desc = "Hover.nvim next",
		-- },
	},
	--
	--	Conversion Keymaps
	--
	{
		mode = "v",
		group = "Convert",
		{
			"<C-g>tf",
			function()
				conversion("far")
			end,
			desc = "Convert to Farenheit",
		},
		{
			"<C-g>tc",
			function()
				conversion("cel")
			end,
			desc = "Convert to Celsius",
		},
	},
	--
	--	Timestamp
	--
	{
		"<leader>ts",
		function()
			if vim.api.nvim_win_get_cursor(0)[2] == 0 then
				vim.api.nvim_put({ "- " .. os.date() .. ":" }, "", false, true)
			else
				vim.api.nvim_put({ "" .. os.date() }, "", false, true)
			end
		end,
		desc = "Insert timestamp (Format: 12/16/2024 3:21:31 PM)",
	},
})
