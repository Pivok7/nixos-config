return {
    "neovim/nvim-lspconfig",

    vim.lsp.enable("lua_ls"),
    vim.lsp.enable("nixd"),
    vim.lsp.enable("clangd"),
    vim.lsp.enable("pyright"),
    vim.lsp.enable("rust_analyzer"),
    vim.lsp.enable("zls"),
    vim.lsp.enable("texlab"),
    vim.lsp.enable("tynimist"),
    vim.lsp.enable("ts_ls"),
    vim.lsp.enable("tailwindcss"),
    vim.lsp.enable("slangd"),
    vim.lsp.enable("astro"),
    vim.lsp.enable("omnisharp"),

    vim.lsp.config("tinymist", {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	settings = {
	    -- ...
	}
    })
}
