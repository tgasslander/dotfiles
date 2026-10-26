return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- main does NOT support lazy-loading; load eagerly and keep parsers current
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        -- autotag now configures itself and hooks native treesitter directly,
        -- rather than through an nvim-treesitter module
        { "windwp/nvim-ts-autotag", opts = {} },
    },
    config = function()
        local ts = require("nvim-treesitter")

        ts.setup()

        -- main-branch equivalent of the old `ensure_installed`: async install,
        -- a no-op for parsers that are already present
        ts.install({
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "prisma",
            "markdown",
            "markdown_inline",
            "svelte",
            "graphql",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "query",
            "vimdoc",
            "c",
            "rust",
            "go",
            "gomod",
            "gowork",
            "gosum",
        })

        -- highlighting, indentation, injections are Neovim features now; enable
        -- them per-buffer for any filetype we actually have a parser for
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- start() auto-detects the language from filetype and errors if
                -- no parser is installed, so guard it
                if not pcall(vim.treesitter.start, args.buf) then
                    return
                end
                -- experimental treesitter indentation (was `indent = { enable = true }`)
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
