return {
    "neovim/nvim-lspconfig",

    vim.lsp.enable("lua_ls"),
    vim.lsp.enable("nixd"),
    vim.lsp.enable("clangd"),
    vim.lsp.enable("pyright"),
    vim.lsp.enable("rust_analyzer"),
    vim.lsp.enable("zls"),
    vim.lsp.enable("texlab"),
    vim.lsp.enable("ts_ls"),
    vim.lsp.enable("tailwindcss"),
}
