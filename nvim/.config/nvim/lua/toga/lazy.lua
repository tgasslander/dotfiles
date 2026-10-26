require("lazy").setup({ { import = "toga.plugins" }, { import = "toga.plugins.lsp" } }, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
    -- No plugins require luarocks; disable hererocks so the missing luarocks
    -- install stops being reported as an error in :checkhealth lazy.
    rocks = {
        enabled = false,
    },
})
