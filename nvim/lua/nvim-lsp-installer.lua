Plug 'williamboman/nvim-lsp-installer'

local lsp_installer = require('williamboman/nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
	local opts = {}
	server:setup(opts)
end)
