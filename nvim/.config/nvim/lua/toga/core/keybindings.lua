-- Equalize window sizes
vim.api.nvim_set_keymap(
    "n",
    "<Leader>eaw",
    "<C-w>=",
    { noremap = false, silent = true, desc = "Equalize all buffers horizontally" }
)

-- Toggle line numbering
vim.api.nvim_set_keymap(
    "n",
    "<Leader>tgn",
    ":set nornu!<CR>:set nonu!<CR>",
    { noremap = true, silent = true, desc = "Toggle line numbering" }
)

-- OPEN $VIMRC
vim.api.nvim_set_keymap(
    "n",
    "<Leader>ev",
    "<C-w><C-v><C-l>:e $MYVIMRC<CR>",
    { noremap = true, silent = true, desc = "Open top-level init.lua" }
)

-- Reload $VIMRC
vim.api.nvim_set_keymap(
    "n",
    "<Leader>evr",
    ":source $MYVIMRC<CR>",
    { noremap = true, silent = true, desc = "Reload top-level init.lua" }
)

-- Toggle fold
vim.api.nvim_set_keymap("", "<Leader>vv", "zA", { noremap = true, silent = true, desc = "Toggle fold" })
-- Open all folds
vim.api.nvim_set_keymap("", "<Leader>vo", "zR", { noremap = true, silent = true, desc = "Open all folds" })
-- Close all folds
vim.api.nvim_set_keymap("", "<Leader>vc", "zM", { noremap = true, silent = true, desc = "Close all folds" })

-- Split screen vertically
vim.api.nvim_set_keymap("n", "<Leader>sv", ":vs<CR>", { noremap = true, silent = true, desc = "Split vertically" })

-- Split screen horizontally
vim.api.nvim_set_keymap("n", "<Leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Split horizontally" })

-- Easier navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Turn off current highlights
vim.api.nvim_set_keymap(
    "n",
    "<Leader>tn",
    ":nohl<CR>",
    { noremap = true, silent = false, desc = "Turn off highlights" }
)

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- MarkdownPreview settings
vim.api.nvim_set_keymap(
    "n",
    "<Leader>md",
    ":MarkdownPreviewToggle<CR>",
    { noremap = true, silent = true, desc = "Toggle markdown preview" }
)

-- SwaggerPreview settings
vim.api.nvim_set_keymap(
    "n",
    "<Leader>sw",
    ":SwaggerPreviewToggle<CR>",
    { noremap = true, silent = true, desc = "Toggle Swagger preview" }
)
