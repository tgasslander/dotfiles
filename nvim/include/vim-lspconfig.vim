Plug 'neovim/nvim-lspconfig'

function LspBootstrap ()
lua << EOF
	local nvim_lsp = require("lspconfig")
	local server_ready = function(server)
		local opts = {}
		server:setup{opts}

		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true }

		local function nkeymap(key, map) 
			keymap('n', key, map, opts)
		end

		nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
		nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
		nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
		nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
		nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
		nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
		nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
		nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
		nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
		nkeymap('<leader>ac', ':lua vim.lsp.buf.code_action()<cr>')
		nkeymap('<leader>rn', ':lua vim.lsp.buf.code_action()<cr>')
	end

	local servers = { 'tsserver', 'gopls', 'sumneko_lua' }
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup {
			on_server_ready = server_ready
			flags = {
				debounce_text_changes = 150,
				}
			}
	end
EOF
endfunction

augroup LspBootstrap
    autocmd!
    autocmd User PlugLoaded call LspBootstrap()
augroup END
