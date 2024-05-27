-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- JK keybind to exit insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Delete word by pressing ctrl + backpace or delete
vim.keymap.set('n', '<C-BS>', 'dw', { silent = true, desc = 'delete from cursor to ending word' })
vim.keymap.set('n', '<C-Del>', 'db', { silent = true, desc = 'delete from cursor to beginning word' })

-- Git diff view open 
vim.keymap.set('n', '<leader>GDO', ':DiffviewFileHistory<CR>', { desc = '[G]it [D]iff [O]pen' })
