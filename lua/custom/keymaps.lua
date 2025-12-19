vim.keymap.set('n', '<leader>n', function()
  require('custom.run_cpp').run()
end, { desc = 'Compile & run C++ in scratch buffer' })

-- Thsi for save file Space + w
vim.keymap.set('n', '<Leader>w', ':w<CR>', { desc = ' Save File (Write :w)' })

-- This for Quit file Space + Q
vim.keymap.set('n', '<Leader>Q', ':q<CR>', { desc = 'Quit' })
