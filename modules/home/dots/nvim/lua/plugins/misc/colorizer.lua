vim.pack.add({"https://github.com/catgoose/nvim-colorizer.lua"})

require("colorizer").setup({
    options = {
        parsers = {
            tailwind = { enable = true, lsp = true },
        },
    },
})
