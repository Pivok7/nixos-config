return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find [F]iles" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Find by [G]rep" })
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Find [D]iagnostics" })
            vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Finder [R]esume" })
            vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
            vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Find Existing [B]uffers" })
        end,
    },
}
