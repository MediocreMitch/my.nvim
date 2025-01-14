local is_blank = function(lnum)
	local check = string.find(vim.fn.getline(lnum), "^%s*$", 0, false)
	return check == 1
end
local HDepth = function(lnum)
	local line = vim.fn.getline(lnum)
	local level = string.len(string.match(line, "^#+") or "")
	return level
end

_G.mfoldl_expr = function()
	local level = HDepth(vim.v.lnum)

	local foldlevel = "="

	if level > 0 then
		foldlevel = ">" .. tostring(level)
	end

	local blank = is_blank(vim.v.lnum)
	local next_blank = is_blank(vim.v.lnum + 1)

	if blank and next_blank then
		foldlevel = "s1"
	end

	return foldlevel
end

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.mfoldl_expr()"

-- lsp.lua

--- Borders on floating windows

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {

	border = _border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {

	border = _border,
})

-- highlight FloatBorder ctermfg=NONE ctermbg=NONE cterm=NONE

require("lspconfig.ui.windows").default_options = {

	border = _border,
}
