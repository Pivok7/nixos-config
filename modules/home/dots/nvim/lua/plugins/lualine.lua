vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require("lualine").setup({
    sections = {
	lualine_a = { "mode" },
	lualine_b = { "branch", "diff", "diagnostics" },
	lualine_c = { "filename" },
	lualine_x = { "searchcount", "encoding", "filetype" },
	lualine_y = { "progress" },
	lualine_z = { "location" },
    },
})
