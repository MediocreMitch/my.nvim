vim.keymap.set("n", "<leader>/", ":noh<cr>")

--
--
-- Window Navigation
--
--
vim.keymap.set("n", "<C-h>", function()
	local prev_win = vim.api.nvim_get_current_win()
	vim.cmd([[wincmd h]])
	local current_win = vim.api.nvim_get_current_win()
	if prev_win == current_win then
		vim.fn.system("wezterm cli activate-pane-direction Left")
	end
end)

vim.keymap.set("n", "<C-l>", function()
	local prev_win = vim.api.nvim_get_current_win()
	vim.cmd([[wincmd l]])
	local current_win = vim.api.nvim_get_current_win()
	if prev_win == current_win then
		vim.fn.system("wezterm cli activate-pane-direction Right")
	end
end)

vim.keymap.set("n", "<C-k>", function()
	local prev_win = vim.api.nvim_get_current_win()
	vim.cmd([[wincmd k]])
	local current_win = vim.api.nvim_get_current_win()
	if prev_win == current_win then
		vim.fn.system("wezterm cli activate-pane-direction Up")
	end
end)

vim.keymap.set("n", "<C-j>", function()
	local prev_win = vim.api.nvim_get_current_win()
	vim.cmd([[wincmd j]])
	local current_win = vim.api.nvim_get_current_win()
	if prev_win == current_win then
		vim.fn.system("wezterm cli activate-pane-direction Down")
	end
end)

--
--
--	Nvim Tree Remap
--
--

vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("NvimTreeOpen")
	vim.cmd("NvimTreeFocus")
end)

--
--
-- Telescope keybinds
--
--
local extensions = {
	"gh",
	"lazy_plugins",
	"helpgrep",
}
local load_extensions = function()
	local tele = require("telescope")
	for _, ext in ipairs(extensions) do
		tele.load_extension(ext)
	end
end
load_extensions()
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fht", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fp", "<CMD>Telescope lazy_plugins<CR>", { desc = "Telescope plugins" })
vim.keymap.set("n", "<leader>fh", "<CMD>Telescope helpgrep<CR>", { desc = "Telescope help grep" })
