local status, treesitter = pcall(require, 'nvim_treesitter')
if not status then return end

vim.o.foldmethod = 'expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'

require'nvim-treesitter.configs'.setup {

  indent = {
    enable = true,
    disable = {'python'}
	},

	ensure_installed = {
		'lua',
		'python',
		'c',
		'markdown',
		'markdown_inline',
		'bibtex',
		'vim',
		'javascript',
		'typescript',
		'css',
		'json',
	},

	--Incremental selection
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<CR>',
			node_incremental = '<CR>',
			node_decremental = '<BS>',
			scope_incremental = 'g<CR>',
		},
	},
}
