vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

vim.treesitter.language.register("rocq", "coq")

require("nvim-treesitter").install({
    "bash",
    "c",
    "cpp",
    "c_sharp",
    "css",
    "glsl",
    "html",
    "javascript",
    "json",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "nix",
    "nu",
    "python",
    "rust",
    "slang",
    "svelte",
    "tsx",
    "typescript",
    "typst",
    "yaml",
    "zig",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "c",
        "cpp",
        "cs",
        "css",
        "glsl",
        "help",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "nix",
        "nu",
        "python",
        "rust",
        "slang",
        "svelte",
        "tsx",
        "typescript",
        "typst",
        "vim",
        "yaml",
        "zig",
        "coq",
    },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
