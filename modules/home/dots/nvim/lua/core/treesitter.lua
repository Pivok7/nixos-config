vim.treesitter.language.register("rocq", "coq")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "coq",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
