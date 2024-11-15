vim.keymap.set("n", "<leader>/", ":noh<cr>")

--
--
--	Nvim Tree Remap
--
--

vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("NvimTreeOpen")
	vim.cmd("NvimTreeFocus")
end)
