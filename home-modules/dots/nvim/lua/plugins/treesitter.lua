return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',

    opts = {
        ensure_installed = { 'lua' },
        auto_install = true,
        highlight = { enable = false, },
        indent = { enable = true },
    },

}


