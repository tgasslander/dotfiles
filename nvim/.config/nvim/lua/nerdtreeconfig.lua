vim.cmd [[
    let g:NERDTreeWinPos = "right"
    let NERDTreeShowHidden=1
]]

vim.api.nvim_set_keymap('n', '<Leader>nn', ':NERDTreeToggle<CR>', {noremap=true})
vim.cmd [[
	nnoremap <expr> <leader>nm g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
]]
