-- Equalize window sizes
vim.api.nvim_set_keymap('n', '<Leader>eaw', '<C-w>=', { noremap = false, silent = true })

-- Toggle line numbering
vim.api.nvim_set_keymap('n', '<Leader>tgn', ':set nornu!<CR>:set nonu!<CR>', { noremap = true, silent = true })

-- OPEN $VIMRC
vim.api.nvim_set_keymap('n', '<Leader>ev', '<C-w><C-v><C-l>:e $MYVIMRC<CR>', { noremap = true, silent = true })

-- Reload $VIMRC
vim.api.nvim_set_keymap('n', '<Leader>evr', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- Toggle fold
vim.api.nvim_set_keymap('', '<Leader>ff', 'zi', { noremap = true, silent = true })

-- Split screen vertically
vim.api.nvim_set_keymap('n', '<Leader>sv', ':vs<CR>', { noremap = true, silent = true })

-- Split screen horizontally
vim.api.nvim_set_keymap('n', '<Leader>sh', ':split<CR>', { noremap = true, silent = true })

-- Easier navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Turn off current highlights
vim.api.nvim_set_keymap('n', '<Leader>tn', ':nohl<CR>', { noremap = true, silent = false})
