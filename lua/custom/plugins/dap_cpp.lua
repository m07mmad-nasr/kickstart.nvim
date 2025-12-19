-- ~/.config/nvim/lua/custom/plugins/dap_cpp.lua

return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      local mason_path = vim.fn.stdpath 'data' .. '/mason/packages/codelldb/extension'
      local codelldb = mason_path .. '/adapter/codelldb'

      dap.adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          command = codelldb,
          args = { '--port', '${port}' },
        },
      }

      dap.configurations.cpp = {
        {
          name = 'C++ Launch',
          type = 'codelldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp
    end,
  },
}
