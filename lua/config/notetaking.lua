-- vim.g.markdown_folding = 1
vim.opt.foldlevel = 1

local MyFoldText = function()
	local line = vim.fn.getline(vim.v.foldstart)
	local sub = vim.fn.substitute(line, "/\\*\\|\\*/\\|{{{\\d\\=", "", "g")
	return vim.v.folddashes .. sub
end
vim.opt.foldtext = MyFoldText()

require("easytables").setup({
	set_mappings = function(buf)
		vim.api.nvim_buf_set_keymap(buf, "n", "<C-h>", ":JumpLeft<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<S-h>", ":SwapWithLeftCell<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<M-h>", ":SwapWithLeftColumn<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>ah", ":InsertColumnLeft<CR>", {})

		vim.api.nvim_buf_set_keymap(buf, "n", "<C-l>", ":JumpRight<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<S-l>", ":SwapWithRightCell<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<M-l>", ":SwapWithRightColumn<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>al", ":InsertColumnRight<CR>", {})

		vim.api.nvim_buf_set_keymap(buf, "n", "<C-k>", ":JumpUp<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<S-k>", ":SwapWithUpperCell<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<M-k>", ":SwapWithUpperRow<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>ak", ":InsertRowAbove<CR>", {})

		vim.api.nvim_buf_set_keymap(buf, "n", "<C-j>", ":JumpDown<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<S-j>", ":SwapWithLowerCell<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<M-j>", ":SwapWithLowerRow<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>aj", ":InsertRowBelow<CR>", {})

		vim.api.nvim_buf_set_keymap(buf, "n", "<Tab>", ":JumpToNextCell<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<S-Tab>", ":JumpToPreviousCell<CR>", {})

		vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>q", ":q<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>w", ":ExportTable<CR>", {})

		vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>dR", ":DeleteRow<CR>", {})
		vim.api.nvim_buf_set_keymap(buf, "n", "<Leader>dC", ":DeleteColumn<CR>", {})
	end,
})
