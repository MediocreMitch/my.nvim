--
--	Telescope Load Additional Extensions
--
local extensions = {
	"gh",
	"lazy_plugins",
	"helpgrep",
	"notes",

	"picker_list",
}
local load_extensions = function()
	local tele = require("telescope")
	for _, ext in ipairs(extensions) do
		tele.load_extension(ext)
	end
end
load_extensions()

--
--	Hover.nvim
--
-- require("hover").setup({
-- 	init = function()
-- 		require("hover.providers.lsp")
-- 		require("hover.providers.fold_preview")
-- 		require("hover.providers.diagnostic")
-- 	end,
-- 	preciew_opts = {
-- 		border = "single",
-- 	},
-- 	preview_window = false,
-- 	title = true,
-- })
