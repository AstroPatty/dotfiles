function SetColor(color)
  color = color or 'tokyonight-night'
  vim.cmd.colorscheme(color)
end

SetColor()
vim.cmd.hi 'Comment gui=none'
vim.api.nvim_set_hl(0, '@string.documentation', {
  fg = '#e0af68',
})
