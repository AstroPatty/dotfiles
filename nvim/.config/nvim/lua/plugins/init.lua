local cfg = {
	"folke/which-key.nvim",
	{ 'numToStr/Comment.nvim',      opts = {} },
	{ 'nvim-tree/nvim-web-devicons' },
	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false }
	},

}
return cfg
