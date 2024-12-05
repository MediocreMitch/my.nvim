return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = "markdown",
		build = "pwsh -command 'cd app && npm install'",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			local function directory_exists(path)
				local f = io.popen("cd " .. path)
				local ff = f and f:read("*all") or nil

				if ff:find("ItemNotFoundException") then
					return false
				else
					return true
				end
			end
			if directory_exists("C:\\Users\\mspalding\\OneDrive - Blue Origin, LLC\\Blue TH") then
				vim.g.mkdp_markdown_css = "C:\\Users\\mspalding\\.config\\nvim\\markdown.css"
				vim.g.mkdp_images_path = "C:\\Users\\mspalding\\OneDrive - Blue Origin, LLC\\Blue TH"
			end
		end,
	},
	{
		dir = "~/projects/kanban.lua",
		name = "kanban",
		config = function()
			require("kanban").setup()
		end,
	},
}
