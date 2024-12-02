return {
	{
		"daneofmanythings/chalktone.nvim",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
	},
	{
		"TaDaa/vimade",
		event = "VeryLazy",
		dependencies = "echasnovski/mini.icons",
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			words = { enabled = true },
			statuscolumn = {},
			terminal = {
				opts = {},
			},
			notifier = {
				config = function()
					---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
					local progress = vim.defaulttable()
					vim.api.nvim_create_autocmd("LspProgress", {
						---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
						callback = function(ev)
							local client = vim.lsp.get_client_by_id(ev.data.client_id)
							local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
							if not client or type(value) ~= "table" then
								return
							end
							local p = progress[client.id]

							for i = 1, #p + 1 do
								if i == #p + 1 or p[i].token == ev.data.params.token then
									p[i] = {
										token = ev.data.params.token,
										msg = ("[%3d%%] %s%s"):format(
											value.kind == "end" and 100 or value.percentage or 100,
											value.title or "",
											value.message and (" **%s**"):format(value.message) or ""
										),
										done = value.kind == "end",
									}
									break
								end
							end

							local msg = {} ---@type string[]
							progress[client.id] = vim.tbl_filter(function(v)
								return table.insert(msg, v.msg) or not v.done
							end, p)

							local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
							vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO, {
								id = "lsp_progress",
								title = client.name,
								opts = function(notif)
									notif.icon = #progress[client.id] == 0 and " "
										or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
								end,
							})
						end,
					})
				end,
			},
			dashboard = {
				preset = {
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{
						icon = " ",
						title = "Git Status",
						section = "terminal",
						enabled = vim.fn.isdirectory(".git") == 1,
						cmd = "git status --short --branch --renames",
						height = 5,
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					},
					{ section = "startup" },
				},
			},
		},
		keys = {},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						require("snacks").debug.inspect(...)
					end
					_G.bt = function()
						require("snacks").debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					require("snacks").toggle.treesitter():map("<leader>uT")
					require("snacks").toggle.inlay_hints():map("<leader>uh")
				end,
			})
		end,
	},
}
