if vim.g.loaded_nvim_treesitter then
require('nvim_treesitter')
vim.o.foldmethod = 'expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'

require'nvim-treesitter.configs'.setup {

  indent = {
    enable = true,
    disable = {"python"}
	},

	pyfold = {
			enable = true,
			custom_foldtext = true -- Sets provided foldtext on window where module is active
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
}

end
