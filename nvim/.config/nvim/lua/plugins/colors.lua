function SetColor(color)
  color = color or 'tokyonight-night'
  vim.cmd.colorscheme(color)
end

local cfg = {

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins

    config = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      SetColor()
      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
      vim.api.nvim_set_hl(0, '@string.documentation', {
        fg = '#e0af68', -- Tokyonight yellow
      })
    end,
  },
  {
    'rose-pine/neovim',
  },
}

return cfg
