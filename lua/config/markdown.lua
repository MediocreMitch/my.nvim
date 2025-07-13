vim.g.markdown_folding = 1
vim.opt.foldlevel = 1

local MyFoldText = function()
	local line = vim.fn.getline(vim.v.foldstart)
	local sub = vim.fn.substitute(line, "/\\*\\|\\*/\\|{{{\\d\\=", "", "g")
	return vim.v.folddashes .. sub
end
vim.opt.foldtext = MyFoldText()
