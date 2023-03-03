return {
	"kyazdani42/nvim-web-devicons",
	"tpope/vim-surround",
	"tpope/vim-fugitive",
	"lilydjwg/colorizer", -- colors on files e.g.#000
	-- "untitled-ai/jupyter_ascending.vim",
	--"phelipetls/vim-hugo",

	{
		"scrooloose/nerdcommenter",
		config = function()
			vim.cmd([[let g:NERDSpaceDelims = 0]])
		end,
	},
}
