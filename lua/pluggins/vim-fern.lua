return {
	"lambdalisue/vim-fern",
	{
		"lambdalisue/vim-fern-hijack",
		dependencies = {
			'vim-fern'
		}
	},	
	"lambdalisue/vim-nerdfont",
	{
		"lambdalisue/vim-glyph-palette",
		dependencies = {
			'vim-nerdfont',
			'vim-fern'
		}
	},
	{
		"lambdalisue/vim-fern-renderer-nerdfont",
		dependencies = {
			'vim-nerdfont',
			'vim-fern'
		}
	},
	{
		"lambdalisue/vim-fern-git-status",
		dependencies = {
			'vim-fern'
		}
	}
}
