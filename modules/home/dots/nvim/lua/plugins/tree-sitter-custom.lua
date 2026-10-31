vim.pack.add({ "https://codeberg.org/doomy/tree-sitter-revo" })

vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
        require("nvim-treesitter.parsers").rocq = {
            install_info = {
                url = "https://github.com/aruzdh/tree-sitter-rocq",
                queries = "queries",
            },
        }

        require("nvim-treesitter.parsers").ziggy = {
            install_info = {
                url = "https://github.com/kristoff-it/ziggy",
                location = "tree-sitter-ziggy",
                queries = "tree-sitter-ziggy/queries",
            },
        }

        require("nvim-treesitter.parsers").ziggy_schema = {
            install_info = {
                url = "https://github.com/kristoff-it/ziggy",
                location = "tree-sitter-ziggy-schema",
                queries = "tree-sitter-ziggy-schema/queries",
            },
        }

        require("nvim-treesitter.parsers").revo = {
            install_info = {
                -- nvim-treesitter can't unpack Codeberg archives, so build from
                -- the vim.pack checkout instead of a tarball.
                path = vim.fs.joinpath(vim.fn.stdpath("data"), "site", "pack", "core", "opt", "tree-sitter-revo"),
                queries = "queries",
            },
        }
    end,
})

vim.treesitter.language.register("rocq", "coq")
vim.treesitter.language.register("ziggy_schema", "ziggy-schema")
vim.treesitter.language.register("revo", { "rv", "revo" })

vim.filetype.add({
    extension = {
        ziggy = "ziggy",
        ["ziggy-schema"] = "ziggy_schema",
        rv = "revo",
        revo = "revo",
    },
})
