Plug 'nvim-lua/completion-nvim'

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

function CompletionBootstrap()
	lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
endfunction

augroup CompletionBootstrap
	autocmd!
	autocmd User PlugLoaded call CompletionBootstrap()
augroup END
