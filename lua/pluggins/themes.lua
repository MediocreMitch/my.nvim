return { 
    {
        "sblauen/chalk", 
	name = "chalk",
	lazy = false,
	priority = 1000,
	config = function ()
		vim.cmd([[colorscheme chalk]])
	end,
    },
}

