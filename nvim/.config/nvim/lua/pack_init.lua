-- Build hooks must be registered before vim.pack.add()
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      vim.cmd('TSUpdate')
    end
    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      if vim.fn.has('win32') == 0 and vim.fn.executable('make') == 1 then
        vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path })
      end
    end
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      vim.system({ 'make' }, { cwd = ev.data.path })
    end
  end,
})

vim.pack.add({
  -- Core deps (loaded first as others depend on them)
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
  -- UI / colorschemes
  'https://github.com/folke/tokyonight.nvim',
  { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
  -- Editor plugins
  'https://github.com/folke/which-key.nvim',
  'https://github.com/numToStr/Comment.nvim',
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/m4xshen/hardtime.nvim',
  'https://github.com/echasnovski/mini.nvim',
  -- Git
  'https://github.com/lewis6991/gitsigns.nvim',
  -- Telescope
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  -- Treesitter
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  -- LSP / Mason
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  -- Completion
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/saadparwaiz1/cmp_luasnip',
  { src = 'https://github.com/L3MON4D3/LuaSnip', name = 'LuaSnip' },
  -- Formatting
  'https://github.com/stevearc/conform.nvim',
  -- Markdown
  'https://github.com/OXY2DEV/markview.nvim',
  -- AI
  'https://github.com/olimorris/codecompanion.nvim',
})

-- Run plugin configs after all plugins are loaded
require('plugins.colors')
require('plugins.wkey')
require('plugins.init')
require('plugins.gitsigns')
require('plugins.mini')
require('plugins.telescope')
require('plugins.cmp')
require('plugins.mason')
require('plugins.conform')
require('plugins.hardtime')
require('plugins.treesitter')
require('plugins.cc')
