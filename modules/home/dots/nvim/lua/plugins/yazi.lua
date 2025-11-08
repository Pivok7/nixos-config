return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = { "folke/snacks.nvim" },

    keys = {
        {
            "<leader>e",
            mode = { "n", "v" },
            "<cmd>Yazi<cr>",
            desc = "Open yazi",
        },
    },

    opts = {
        open_for_directories = false,
        keymaps = {
            show_help = "<f1>",
        },
    },
}
