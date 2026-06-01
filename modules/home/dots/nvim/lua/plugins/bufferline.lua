vim.pack.add({
    "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previus tab" })
vim.keymap.set("n", "<leader>wj", "<cmd>BufferLineMovePrev<CR>", { desc = "Move tab left" })
vim.keymap.set("n", "<leader>wk", "<cmd>BufferLineMoveNext<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>wh", "<cmd>lua require('bufferline').move_to(1)<CR>", { desc = "Move tab to start" })
vim.keymap.set("n", "<leader>wl", "<cmd>lua require('bufferline').move_to(-1)<CR>", { desc = "Move tab to end" })
vim.keymap.set("n", "<leader>wp", "<cmd>BufferLineTogglePin<CR>", { desc = "Pin tab" })
vim.keymap.set("n", "<leader>wq", "<cmd>bdelete!<CR>", { desc = "Close current tab" }, opts)
vim.keymap.set("n", "<leader>wn", "<cmd>enew <CR>", { desc = "Open new tab" }, opts)

require("bufferline").setup({
    options = {
	always_show_bufferline = true,
	themable = true,
	buffer_close_icon = "",
	modified_icon = "●",
	icon_pinned = "󰐃",
    },
})
