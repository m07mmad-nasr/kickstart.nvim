local M = {}

M.run = function()
  local file = vim.fn.expand '%:p'
  if file == '' then
    vim.notify('No file to run', vim.log.levels.WARN)
    return
  end

  local out = vim.fn.expand '%:p:r' .. '.out'
  local cmd = "g++ -std=c++20 '" .. file .. "' -o '" .. out .. "' && '" .. out .. "'"

  -- Create a new scratch buffer
  vim.cmd 'tabnew' -- open new tab
  vim.cmd 'enew' -- create empty buffer
  vim.cmd 'setlocal buftype=nofile bufhidden=wipe nobuflisted' -- scratch
  vim.cmd 'setlocal noswapfile' -- avoid swapfile issues

  -- Run command in terminal in this new buffer
  vim.fn.termopen(cmd)
  vim.cmd 'startinsert'
end

return M
