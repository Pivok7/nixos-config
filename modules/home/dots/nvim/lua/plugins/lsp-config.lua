vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.config("tinymist", {
    cmd = { "tinymist" },
    filetypes = { "typst" },
})

local servers = {
    lua_ls = "lua-language-server",
    nixd = "nixd",
    clangd = "clangd",
    ty = "ty",
    rust_analyzer = "rust-analyzer",
    zls = "zls",
    texlab = "texlab",
    tinymist = "tinymist",
    ts_ls = "typescript-language-server",
    tailwindcss = "tailwindcss-language-server",
    svelte = "svelteserver",
    slangd = "slangd",
    omnisharp = "omnisharp",
    nushell = "nu",
    vsrocq = "vsrocqtop",
}

-- Only enable LSP servers whose binaries are actually installed,
-- so missing servers don't produce errors.
for server, binary in pairs(servers) do
    if vim.fn.executable(binary) == 1 then
        vim.lsp.enable(server)
    end
end
