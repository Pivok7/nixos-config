vim.o.signcolumn = "yes" -- Keep signcolumn on by default
vim.o.number = true -- Make line numbers default
vim.o.relativenumber = true -- Set relative numbered lines
vim.o.wrap = false -- Display lines as one long line
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
-- vim.o.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line
vim.o.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 16 -- Minimal number of screen columns either side of cursor if wrap is `false`
vim.o.shiftwidth = 4 -- The number of spaces inserted for each indentation
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
vim.o.cursorline = true -- Highlight the current line
-- vim.o.cursorcolumn = true -- highlight the current column
vim.o.swapfile = false -- Creates a swapfile
vim.o.fileencoding = "utf-8" -- The encoding written to a file
vim.o.termguicolors = true -- Set termguicolors to enable highlight groups
vim.o.winborder = "rounded" -- Rounded snippets windows

vim.diagnostic.config({ virtual_text = true }) -- Required for LSP messages
vim.diagnostic.config({ virtual_lines = false }) -- Use virtual lines

vim.g.cmptoggle = true -- Set cmp autocompletion on as default

-- Show trailing whitespace
vim.cmd("set list")
vim.opt.listchars = {
    tab = "  ",
    trail = "·",
    nbsp = "␣",
}
