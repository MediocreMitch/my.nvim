local wk = require("which-key")
wk.add({
	{
		"<leader>fn",
		function()
			require("telescope.builtin").find_files({ cwd = "~/OneDrive - Blue Origin, LLC/WorkNotes" })
		end,
		desc = "Search WorkNotes",
	},
	{
		"<leader>fd",
		function()
			require("telescope.builtin").find_files({
				cwd = "~/OneDrive - Blue Origin, LLC/Blue TH/Quality Inspection Work Instructions/MarkdownFiles",
			})
		end,
		desc = "Search TH",
	},
	{
		"<leader>gn",
		function()
			require("telescope.builtin").live_grep({ cwd = "~/OneDrive - Blue Origin, LLC/WorkNotes" })
		end,
		desc = "Grep WorkNotes",
	},
	--
	--	Telescope Note Taking
	--
	{
		"<leader>n",
		group = "Notes",
		{ "<leader>nti", ":Telescope notes tables<cr>", desc = "Insert Table" },
		{ "<leader>nli", ":Telescope notes lines<cr>", desc = "Insert Line" },
		{
			"<leader>nd",
			":edit ~/OneDrive - Blue Origin, LLC/WorkNotes/DailyNotes/" .. os.date("%m-%d-%Y") .. ".md<cr>",
			desc = "Open Todays Daily Note",
		},
	},
})
