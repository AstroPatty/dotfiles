--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
require 'opts'
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


require 'lazy_init'
require 'keys'
