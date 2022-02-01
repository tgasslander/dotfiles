local key_maps = {
  { key = 'gr', func = "require('navigator.reference').reference()" },
  { key = 'gra', func = "require('navigator.reference').async_ref()" },
  { mode = 'i', key = '<c-k>', func = 'signature_help()' },
  { key = '<c-k>', func = 'signature_help()' },
  { key = 'g0', func = "require('navigator.symbols').document_symbols()" },
  { key = 'gW', func = "require('navigator.workspace').workspace_symbol()" },
  { key = '<c-]>', func = "require('navigator.definition').definition()" },
  { key = 'gD', func = "declaration({ border = 'rounded', max_width = 80 })" },
  { key = 'gp', func = "require('navigator.definition').definition_preview()" },
  { key = '<Leader>gt', func = "require('navigator.treesitter').buf_ts()" },
  { key = '<Leader>gT', func = "require('navigator.treesitter').bufs_ts()" },
  { key = 'K', func = 'hover({ popup_opts = { border = single, max_width = 80 }})' },
  { key = '<Leader>ca', mode = 'n', func = "require('navigator.codeAction').code_action()" },
  { key = '<Leader>cA', mode = 'v', func = 'range_code_action()' },
  -- { key = '<Leader>re', func = 'rename()' },
  { key = '<Leader>rn', func = "require('navigator.rename').rename()" },
  { key = '<Leader>gi', func = 'incoming_calls()' },
  { key = '<Leader>go', func = 'outgoing_calls()' },
  { key = 'gi', func = 'implementation()' },
  { key = '<Leader>D', func = 'type_definition()' },
  { key = 'gL', func = "require('navigator.diagnostics').show_diagnostics()" },
  { key = 'gG', func = "require('navigator.diagnostics').show_buf_diagnostics()" },
  { key = '<Leader>dt', func = "require('navigator.diagnostics').toggle_diagnostics()" },
  { key = ']d', func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})" },
  { key = '[d', func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})" },
  { key = ']r', func = "require('navigator.treesitter').goto_next_usage()" },
  { key = '[r', func = "require('navigator.treesitter').goto_previous_usage()" },
  { key = '<C-LeftMouse>', func = 'definition()' },
  { key = 'g<LeftMouse>', func = 'implementation()' },
  { key = '<Leader>k', func = "require('navigator.dochighlight').hi_symbol()" },
  { key = '<Leader>wa', func = "require('navigator.workspace').add_workspace_folder()" },
  { key = '<Leader>wr', func = "require('navigator.workspace').remove_workspace_folder()" },
  { key = '<Leader>ff', func = 'formatting()', mode = 'n' },
  { key = '<Leader>ff', func = 'range_formatting()', mode = 'v' },
  { key = '<Leader>wl', func = "require('navigator.workspace').list_workspace_folders()" },
  { key = '<Leader>la', mode = 'n', func = "require('navigator.codelens').run_action()" },
}

require('navigator').setup({
    keymaps = key_maps
})

-- -- LSP settings
-- local nvim_lsp = require 'lspconfig'
-- local on_attach = function(_, bufnr)
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   local opts = { noremap = true, silent = true }
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'dm', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
--   -- Toggle LSP diagnostics window
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', ':TroubleToggle<CR>', opts)
--   vim.api.nvim_set_keymap('n', '<leader>qf', '<cmd>Trouble quickfix<CR>', opts)
--   -- Format
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', ':Format<CR>', opts)
--   vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
-- end


