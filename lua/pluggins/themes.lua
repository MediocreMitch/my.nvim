return { 
	{
		'daneofmanythings/chalktone.nvim',
		priority = 1000,
		config = function()
			require('chalktone').setup()
			vim.cmd('colorscheme chalktone')
			vim.cmd('hi Normal guibg=None')
		end
	},
}

