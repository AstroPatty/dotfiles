local copilot = { 'github/copilot.vim' }
local copilot_chat = {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'github/copilot.vim' },
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  branch = 'main', -- Default is main
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
