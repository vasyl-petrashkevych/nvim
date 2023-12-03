local keymap = vim.keymap
keymap.set('n', '<Space>h', ':nohlsearch<CR>')
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
keymap.set('n', '<C-q>', ':w<cr>')
keymap.set('i', '<C-q>', ':w<cr>')

-- Insert mode
keymap.set('i', '<C-l>', '<right>')
keymap.set('i', '<C-h>', '<left>')
keymap.set('i', '<C-k>', '<up>')
keymap.set('i', '<C-j>', '<down>')
