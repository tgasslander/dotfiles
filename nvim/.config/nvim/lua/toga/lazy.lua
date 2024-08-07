require("lazy").setup({ { import = "toga.plugins" }, { import = "toga.plugins.lsp" } }, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})
