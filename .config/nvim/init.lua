vim.api.nvim_set_keymap('n', ' ', '', {noremap = true})
vim.g.mapleader = ' '

-- vim.commands {{{
	local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
	local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
	local g = vim.g      -- a table to access global variables
	local opt = vim.opt  -- to set options
--- }}}

-- Plugins {{{

-- Autoinstall packer {{{
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd 'packadd packer.nvim'
end
-- }}}

require('packer').startup(function()
-- Packer can manage itself
	use 'wbthomason/packer.nvim'

-- Essential Plugins
	use 'scrooloose/nerdcommenter' -- plugin para comentar
	use 'tpope/vim-surround' -- surround
	use 'junegunn/fzf.vim' -- fuzzy finder

-- Other Plugins
	use 'sirver/ultisnips' -- better snippets (suscribe Tab)
	use 'tpope/vim-fugitive' -- git plugin
	use 'lervag/vimtex' -- vimtex
	use 'michaeljsmith/vim-indent-object' -- indent objects
	use 'KabbAmine/vCoolor.vim' -- color picker
	use 'lilydjwg/colorizer' -- colors on files e.g.#000
	use 'junegunn/goyo.vim' -- goyo
	use 'dstein64/vim-startuptime'
	--use 'christianchiarulli/nvcode-color-schemes.vim'
	use 'sbdchd/neoformat' -- format code

-- Lua Plugins
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}  -- treesitter
	use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}} -- statusline
	use 'windwp/nvim-autopairs'
	use 'hkupty/iron.nvim' -- ipython interaction
	use {'nvim-telescope/telescope.nvim', -- Telescope
			 requires = {'nvim-lua/plenary.nvim';
			 						 {'kyazdani42/nvim-web-devicons', opt = true}}
		 }
	use {'nvim-neorg/neorg', requires = 'nvim-lua/plenary.nvim'}

-- LSP
	use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'

-- Completition
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use 'onsails/lspkind-nvim'

end)
-- }}}

-- General config {{{
	-- Color
	opt.termguicolors = true
	cmd[[color bersp_nord]]

	-- Change defaults
	opt.relativenumber = true  -- show line numbers
	opt.number         = true  -- but show the actual number for the line we're on

	opt.incsearch      = true  -- makes search act like search in modern browsers
	opt.showmatch      = true  -- show matching brackets when text indicator is over them
	opt.inccommand     = 'split' -- show live sustitution
	opt.cmdheight      = 1     -- height of the command bar
	opt.ignorecase     = true  -- ignore case when searching...
	opt.smartcase      = true  -- ... unless there is a capital letter in the query
	opt.hidden         = true  -- i like having buffers stay around
	opt.splitright     = true  -- prefer windows splitting to the right
	opt.splitbelow     = true  -- prefer windows splitting to the bottom
	opt.updatetime     = 1000  -- make updates happen faster
	opt.hlsearch       = false -- no highlight when search as default
	opt.scrolloff      = 7     -- make it so there are always ten lines below my cursor
	opt.foldlevel      = 99    -- don't fold if i don't say so
	opt.mouse		   		 = 'a'   -- use mouse
	opt.breakindent    = true  -- breaklines with tabs
	opt.gdefault       = true  -- breaklines with tabs
	opt.spelllang      = 'es,en'

	-- Indent
	opt.autoindent     = true
	opt.tabstop		   	 = 4
	opt.shiftwidth     = 4
	opt.expandtab      = false

	-- Return to last edit position when opening files
	cmd[[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
	
	-- Set undodir persist
	if fn.empty(fn.glob('/tmp/undo-dir')) > 0 then
		os.execute('mkdir /tmp/undo-dir')
	end
	opt.undodir = '/tmp/undo-dir'
	opt.undofile = true

	-- Set cursorline
	cmd[[
	augroup CursorLine
		au!
		au VimEnter * setlocal cursorline
		au WinEnter * setlocal cursorline
		au BufWinEnter * setlocal cursorline
		au WinLeave * setlocal nocursorline
	augroup END
	]]

-- }}}

-- Mappings {{{
	local function map(mode, lhs, rhs, opts)
		local options = {noremap = true}
		if opts then options = vim.tbl_extend('force', options, opts) end
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	end

	-- Yank and paste from clipboard
	map('', '<leader>y', '"+y')
	map('', '<leader>p', '"+p')

	-- Yank and paste from clipboard
	map('', '<S-h>', '^')
	map('', '<S-L>', '$')

	-- Yank to end of the line
	map('n', '<S-y>', 'y$')

	-- Open and select buffers
	map('n', 'gb', ':ls<cr>:buffer<space>')

	-- Split navegation
	map('n', '<C-j>', '<C-w>j')
	map('n', '<C-k>', '<C-w>k')
	map('n', '<C-h>', '<C-w>h')
	map('n', '<C-l>', '<C-w>l')

	-- Sustitude/replace word under de cursor TODO: Pasar a lua
	map('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>//<Left>')

	-- Highlight search results TODO: Pasar a lua
	vim.cmd[[nmap <Leader>h :set hls! <CR> :echo "Highlight search change" <CR>h]]

	-- Normal-mode in Terminal-mode (and not in fzf) TODO: Pasar a lua
	vim.cmd[[autocmd TermOpen * tnoremap <Esc> <c-\><c-n>]]
-- }}}

-- UltiSnips config (odio tener que poner esto acá) {{{
	cmd[[
	let g:UltiSnipsExpandTrigger = "<TAB>"
	let g:UltiSnipsJumpForwardTrigger = "<TAB>"
	let g:UltiSnipsJumpBackwardTrigger = "<S-TAB>"
	let g:ultisnips_python_style = "numpy"
	]]
-- }}}

-- vim:foldmethod=marker:foldlevel=0
