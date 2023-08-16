local _M = {}

local api = require 'nvim-tree.api'

_M.find_open_file = function()
  api.tree.find_file({ open = true })
end

-- Used for telescope binding to clear buffers
_M.delete_selected_buffers = function(opts)
  local actions = require "telescope.actions"
  local action_utils = require "telescope.actions.utils"

  local current_bufnr = vim.api.nvim_buf_get_number(0)

  action_utils.map_selections(opts, function(entry, index, row)
    local bufnr = entry.bufnr

    if bufnr ~= current_bufnr then
      vim.api.nvim_buf_delete(bufnr, { force = true})
    end
  end)

  actions.close(opts)
end

_M.clear_quickfix = function()
  vim.fn.setqflist({})
end

return _M
