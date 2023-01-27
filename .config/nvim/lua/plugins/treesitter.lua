return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "nvim_treesitter#foldexpr()"

		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
				disable = { "python" },
			},

			ensure_installed = {
				"lua",
				"python",
				"c",
				"markdown",
				"markdown_inline",
				"bibtex",
				"vim",
				"javascript",
				"typescript",
				"css",
				"json",
			},

			--Incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					node_decremental = "<BS>",
					scope_incremental = "g<CR>",
				},
			},
		})
	end,
}
