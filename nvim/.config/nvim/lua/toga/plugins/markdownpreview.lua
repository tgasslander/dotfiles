return {
    "iamcco/markdown-preview.nvim",
    -- Downloads a self-contained server binary. Avoids `yarn install`, which
    -- needs nvm's node on PATH at build *and* run time -- nvm is only sourced
    -- from ~/.zshrc, so a GUI-launched nvim never sees it.
    build = function(plugin)
        -- This plugin is ft-lazy-loaded, so it is NOT on the runtimepath when
        -- the build task runs and mkdp#util#* fails to resolve (E117). lazy.nvim
        -- logs that but still exits 0, so the breakage is silent.
        vim.opt.runtimepath:append(plugin.dir)
        -- install_sync, not install: install downloads in an async job that
        -- never completes under `nvim --headless ... +qa` in the bootstrap.
        vim.fn["mkdp#util#install_sync"]()
    end,
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
}
