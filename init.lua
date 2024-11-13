vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
require("config.lazy")

--
--
-- LSP/Formatter Setup
--
--
vim.o.completeopt = "menuone,noselect,noinsert,popup"
require("confit.lsp_config")
require("mason").setup()
require("mason-lspconfig").setup()
require("config.lua_ls")
require("config.pylsp")

local cmp = require("cmp")
cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim-lsp" },
		{ name = "lua_ls" },
		{ name = "pylsp" },
	}, {
		{ name = "buffer" },
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "yapf" },
		json = { "prettier" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

--
--
-- Wilder Setup
--
--
local wilder = require("wilder")
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer({
		highlighter = wilder.basic_highlighter(),
		left = { " ", wilder.popupmenu_devicons() },
		right = { " ", wilder.popupmenu_scrollbar() },
	})
)

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlights = {
			border = "Normal", -- highlight to use for the border
		},
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
	}))
)
