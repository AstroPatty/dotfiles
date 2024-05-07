local popup = require 'plenary.popup'
local obsidian = require 'obsidian'

local function make_note(windownum, callback, folder_name)
  if folder_name == nil then
    folder_name = 'Inbox'
  end

  local name = vim.api.nvim_buf_get_lines(0, 0, -1, true)[1]
  local client = obsidian.get_client()
  local opts = { dir = folder_name, title = name, id = name }
  local note = client:create_note(opts)
  vim.api.nvim_set_current_win(windownum)
  client:open_note(note)
  callback()
end

local function CreateNoteInFolder(folder_name)
  local height = 1
  local width = 100
  local borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
  local current_window = vim.api.nvim_get_current_win()

  Win_id = popup.create('', {
    title = 'Name of New Note',
    highlight = 'MyProjectWindow',
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
    enter = true,
    padding = { 0, 0, 0, 1 },
  })
  function CloseMenu()
    vim.api.nvim_win_close(Win_id, true)
  end
  local bufnr = vim.api.nvim_win_get_buf(Win_id)
  vim.keymap.set('i', '<CR>', function()
    make_note(current_window, CloseMenu, folder_name)
  end, { buffer = bufnr })
  vim.cmd 'startinsert'
end

local meta = {
  CreateNoteInFolder = function(folder_name)
    CreateNoteInFolder(folder_name)
  end,
}

return meta
