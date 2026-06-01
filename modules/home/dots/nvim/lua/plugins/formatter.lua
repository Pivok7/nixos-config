vim.pack.add({"https://github.com/stevearc/conform.nvim"})

vim.keymap.set("n", "<leader>ff", function()
    require("conform").format()
end)

require("conform").setup({
    formatters_by_ft = {
	lua = { "stylua" },
	c = { "clang_format" },
	cpp = { "clang_format" },
	rust = { "rustfmt" },
	zig = { "zigfmt" },
	python = { "ruff_format" },
	cs = { "csharpier" },

	html = { "prettier" },
	css = { "prettier" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	svelte = { "prettier" },

	tex = { "latexindent" },
	typst = { "typstyle" },

	nix = { "nixfmt" },
    },

    formatters = {
	stylua = {
	    append_args = { "--indent-type", "Spaces", "--indent-width", "4" },
	},

	clang_format = {
	    append_args = { "--style", "{BasedOnStyle: llvm, IndentWidth: 4}" },
	},

	prettier = {
	    append_args = { "--tab-width", "4" },
	},

	latexindent = {
	    append_args = { "-y=defaultIndent: '    '" },
	},
    },
})
