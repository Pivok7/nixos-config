vim.pack.add({
    "https://github.com/mikavilpas/yazi.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
})

require("yazi").setup({
    open_for_directories = false,
    keymaps = {
	show_help = "<f1>",
    },
})

vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Yazi<cr>", { desc = "Open yazi" })
