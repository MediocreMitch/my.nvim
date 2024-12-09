---
--- LSP Config
---

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"
vim.diagnostic.config({ virtual_text = false })

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

require("mason").setup({})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		--		"pylsp",
		"ts_ls",
	},
	automatic_installation = true,
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
		["lua_ls"] = function()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				on_init = function(client)
					if client.workspace_folders then
						-- library = vim.api.nvim_get_runtime_file("", true)
						local path = client.workspace_folders[1].name
						if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- Depending on the usage, you might want to add additional paths here.
								"${3rd}/luv/library",
								-- "${3rd}/busted/library",
							},
						},
					})
				end,
				settings = {
					Lua = {},
				},
			})
		end,
	},
})

---
-- Autocompletion config
---
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = function()
			vim.g.tempbuffs = vim.api.nvim_list_wins()
			local opts = {
				relative = "editor",
				anchor = "NE",
				style = "minimal",
				bufpos = { -1, 0 },
				width = 30, -- vim.api.nvim_get_option_value("width", { buf = cmp_buf }),
				height = 20, -- vim.api.nvim_get_option_value("height", { buf = cmp_buf }),
				border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
				title = "pinned",
			}
			vim.api.nvim_open_win(0, false, opts)
			-- local buffs = {}
			-- for buf = 1, #temp_buf_holder, 1 do
			-- 	if
			-- 		not vim.api.nvim_buf_get_name(temp_buf_holder[buf]) == ""
			-- 		or vim.api.nvim_buf_get_lines(temp_buf_holder[buf], 0, -1, false) == "null"
			-- 	then
			-- 	else
			-- 		buffs[buf] = {
			-- 			vim.api.nvim__buf_stats(temp_buf_holder[buf]),
			-- 			vim.api.nvim_buf_get_name(temp_buf_holder[buf]),
			-- 			vim.api.nvim_buf_get_lines(temp_buf_holder[buf], 0, -1, false),
			-- 		}
			-- 	end
			-- end
			-- vim.g.temp_buffs = buffs
		end,

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, item)
			return require("nvim-highlight-colors").format(entry, item)
		end,
	},
	performance = {
		max_view_entries = 10,
	},
	window = {
		completion = {
			border = { "", "", "", "", "", "", "", "" },
		},
		documentation = {
			border = { "", "", "", "", "", "", "", "" },
		},
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

--
--
-- Formatter Config
--
--

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
