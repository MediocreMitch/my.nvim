--
--	Telescope Load Additional Extensions
--
local extensions = {
	"gh",
	"lazy_plugins",
	"helpgrep",
}
local load_extensions = function()
	local tele = require("telescope")
	for _, ext in ipairs(extensions) do
		tele.load_extension(ext)
	end
end
load_extensions()
