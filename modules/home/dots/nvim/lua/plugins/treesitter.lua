return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = { "lua" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
