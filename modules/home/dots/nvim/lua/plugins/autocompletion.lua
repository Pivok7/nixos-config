vim.pack.add({
    { src = "https://github.com/Saghen/blink.cmp", version = "v1.10.2" },
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://codeberg.org/FelipeLema/cmp-async-path",
    "https://github.com/L3MON4D3/LuaSnip",
})

-- Toggle cmp autocompletion
vim.keymap.set(
    "n",
    "<leader>a",
    "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>",
    { desc = "Toggle autocompletion" }
)

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),

        -- Allows arrows to fall back without interacting with cmp
        ["<Up>"] = cmp.mapping(function(fallback)
            fallback()
        end, { "i", "c" }),
        ["<Down>"] = cmp.mapping(function(fallback)
            fallback()
        end, { "i", "c" }),
    }),

    sources = {
        { name = "nvim_lsp" },
	{ name = "async_path" },
        { name = "buffer" },
    },

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
            { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
    }),

    enabled = function()
        return vim.g.cmptoggle
    end,
})

pcall(require, "blink.cmp")
