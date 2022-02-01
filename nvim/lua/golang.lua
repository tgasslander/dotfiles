require("go").setup({
  -- verbose = plugin_debug(),
  -- goimport = 'goimports', -- 'gopls'
  filstruct = 'gopls',
  log_path = vim.fn.expand("$HOME") .. "/tmp/gonvim.log",
  lsp_codelens = false, -- use navigator
  dap_debug = true,
  dap_debug_gui = true
})
