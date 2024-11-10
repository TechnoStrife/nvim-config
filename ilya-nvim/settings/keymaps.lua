local set = vim.keymap.set
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
set('i', 'jk', '<Esc>', { desc = 'Quick exit to normal mode' })
set('n', '<C-s>', ':w<CR>', { desc = 'Save file shortcut' })

-- Disable arrow keys in normal mode
set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- Convinient shortcuts for navigating
set('n', 'n', 'nzzzv', { noremap = true })
set('n', 'N', 'Nzzzv', { noremap = true })
set('n', '<C-d>', '<C-d>zz', { noremap = true })
set('n', '<C-u>', '<C-u>zz', { noremap = true })
-- Move text in visual mode
-- set('v', 'J', ":m '>1<CR>gv=gv", { noremap = true })
-- set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })
-- Close all buffers shortcut
set('n', '<leader>qa', ':1, $bd!<CR>', { noremap = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- These mappings control the size of splits (height/width)
set('n', '<M-,>', '<c-w>5<')
set('n', '<M-.>', '<c-w>5>')

set('n', '<left>', 'gT')
set('n', '<right>', 'gt')
