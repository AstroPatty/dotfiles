local copilot = { 'github/copilot.vim', enabled = true }
local copilot_chat = {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'canary',
  dependencies = {
    { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    debug = true, -- Enable debugging
    -- See Configuration section for rest
  },
  -- See Commands section for default commands if you want to lazy load on them
}

return {
  copilot = copilot,
  copilot_chat = copilot_chat,
}