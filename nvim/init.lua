-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]


local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  
  use {'ray-x/navigator.lua', 
  	requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- use {'ray-x/guihua.lua', run = 'cd lua/fzy && make' }
  -- use 'ray-x/navigator.lua'

  use 'tomasiser/vim-code-dark'
  use 'preservim/nerdtree'
  use 'editorconfig/editorconfig-vim'
  -- use 'tpope/vim-fugitive' -- Git commands in nvim
  -- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  -- -- use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'preservim/nerdcommenter'
  -- -- UI to select things (files, grep results, open buffers...)
  -- use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- -- Add git related info in the signs columns and popups
  -- use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- -- Highlight, edit, and navigate code using a fast incremental parsing library
  -- -- Additional textobjects for treesitter
  -- -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- -- use 'williamboman/nvim-lsp-installer'
  -- -- use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  -- -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'saadparwaiz1/cmp_luasnip'
  -- -- use 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- -- use 'glepnir/lspsaga.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- use {
  --   'iamcco/markdown-preview.nvim',
  --   ft = 'markdown',
  --   run = 'cd app && yarn install'
  -- }

end)

require'navigator'.setup()

require('lualine').setup()

-- require'cmp'.setup {
--  sources = {
--      { name = 'cmp_tabnine' },
--  },
--   use "hrsh7th/nvim-compe" --completion
-- }


vim.cmd [[
	let g:NERDTreeWinPos = "right"
	let NERDTreeShowHidden=1
]]

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme codedark]]

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Include files
require('keybindings')
-- Include files

--Nerdtree settings
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NERDTreeToggle<CR>', {noremap=true})
vim.cmd [[
	nnoremap <expr> <leader>nm g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
]]

-- MarkdownPreview settings
vim.api.nvim_set_keymap('n', '<Leader>md', ':MarkdownPreviewToggle<CR>', { noremap = true })

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false


--Add leader shortcuts
-- vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-s>', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files({previewer = false})<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>s', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
-- -- vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-g>', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
-- -- vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Create default mappings
vim.g.NERDCreateDefaultMappings = 1
-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1

-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1

-- Align line-wise comment delimiters flush left instead of following code indentation
vim.g.NERDDefaultAlign = 'left'

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1

-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = 1

-- Enable NERDCommenterToggle to check all selected lines is commented or not
vim.g.NERDToggleCheckAllLines = 1
