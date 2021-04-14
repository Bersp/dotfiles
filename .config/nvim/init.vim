
"      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


let mapleader=" "

" Plugins {{{

set rtp+=/usr/local/opt/fzf
call plug#begin('~/.config/nvim/plugged')
" Essential Plugins
	Plug 'itchyny/lightline.vim' " lightline
	Plug 'scrooloose/nerdcommenter' " plugin para comentar
	Plug 'tpope/vim-surround' " surround
	Plug 'junegunn/fzf.vim' " fuzzy finder
	Plug 'Raimondi/delimitMate' " auto-paréntesis

" Colorschemes
	" Plug 'rafi/awesome-vim-colorschemes' " colorscheme
	" Plug 'drewtempelmeyer/palenight.vim' " colorsheme
	Plug 'christianchiarulli/nvcode-color-schemes.vim'

" Other Plugins
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletation
	Plug 'sirver/ultisnips' " better snippets (suscribe Tab)
	Plug 'chrisbra/csv.vim' " comandos para el csv
	Plug 'tpope/vim-fugitive' " git plugin
	Plug 'tmhedberg/SimpylFold' " foldea python bien
	Plug 'godlygeek/tabular' " plugin para pandoc y csv
	Plug 'lervag/vimtex' " vimtex
	Plug 'michaeljsmith/vim-indent-object' " indent objects
	Plug 'KabbAmine/vCoolor.vim' " color picker
	Plug 'lilydjwg/colorizer' " colors on files e.g.#000
	Plug 'junegunn/goyo.vim' " goyo
	Plug 'dstein64/vim-startuptime'

" Lua Plugins
	Plug 'hkupty/iron.nvim' " IPython interaction
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Treesitter

	" Telescope
	Plug 'nvim-lua/popup.nvim' " for Telescope
	Plug 'nvim-lua/plenary.nvim' " for Telescope
	Plug 'nvim-telescope/telescope-fzy-native.nvim' " for Telescope
	Plug 'kyazdani42/nvim-web-devicons' " for Telescope
	Plug 'nvim-telescope/telescope.nvim' " Telescope

" Syntax and file dependent plugins
	Plug 'vimwiki/vimwiki' " for notetaking but used only for markdown syntax

" My Plugins
	" Plug 'file:///Users/bersp/.vim/plugged/vimlab' " VimLab
	" Plug 'file:///Users/bersp/.vim/plugged/ddvim' " D&D Plug
call plug#end()

" }}}

" Files {{{

" Python
	autocmd BufRead,BufNewFile *.py call matchadd('ErrorMsg', '\%81v', 100)
	autocmd FileType python setlocal expandtab

" Latex
	autocmd FileType tex setlocal spell spelllang=es,en
	autocmd FileType tex lua require('bersp/latex_sections')

" Markdown
	autocmd FileType markdown setlocal spell spelllang=es,en
	autocmd FileType markdown setlocal linebreak
	autocmd FileType markdown setlocal conceallevel=2

" Latex (for inkscape-latex)
	autocmd FileType tex imap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
	autocmd FileType tex nmap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Javascript
	autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Lua
	autocmd FileType lua setlocal shiftwidth=2 tabstop=2

" Tabular csv
	autocmd FileType csv nmap <buffer> <Leader><Leader> :Tabularize /,<CR>

" Proccesing
	autocmd BufNewFile,BufRead *.pde :set filetype=java
	autocmd FileType java setlocal shiftwidth=2 tabstop=2

" }}}

" General config {{{

" Some basics:
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set foldlevel=99
	set foldmethod=indent
	set nohlsearch
	set path+=**
	set hidden
	set mouse=a
	set inccommand=split
	set tabstop=4
	set shiftwidth=4
	set gdefault
	let g:netrw_dirhistmax = 0

" Colors
	set termguicolors
	colorscheme custom_nord
	hi clear TSError
	" hi! Normal ctermbg=NONE guibg=NONE
	" hi! NonText ctermbg=NONE guibg=NONE

" Splits open at the bottom and right
	set splitbelow splitright

" Cursorline
	augroup CursorLine
		au!
		au VimEnter * setlocal cursorline
		au WinEnter * setlocal cursorline
		au BufWinEnter * setlocal cursorline
		au WinLeave * setlocal nocursorline
	augroup END

" Dont show de --INSERT--
	set noshowmode

" Visual mode pressing * or # searches for the current selection
	vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
	vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Return to last edit position when opening files
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set 7 lines to the cursor - when moving vertically using j/k
	set so=7

" Ignore compiled files
	set wildignore=*.o,*~,*.pyc

" Smartcase
	set ignorecase
	set smartcase

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Set undodir persist
	if !isdirectory("/tmp/undo-dir")
		call mkdir("/tmp/undo-dir", "", 0700)
	endif
	set undodir=/tmp/undo-dir
	set undofile

" }}}

" Plugins settings {{{

" Lightline {{{
	let g:lightline = {
		  \ 'colorscheme': 'nord',
		  \ }
	" }}}

" FZF {{{
	" nmap <Leader>ff :Files<CR>
	" nmap <Leader>fg :Files ~<CR>
	" nmap <Leader>fb :Buffers<CR>
	" nmap <Leader>/ :Lines<CR>
	" }}}

" Telescope fzf{{{
	nmap <leader>ff <cmd>Telescope find_files prompt_prefix=🔍<cr>
	nmap <leader>fr <cmd>Telescope live_grep prompt_prefix=🔍<cr>
	nmap <leader>ft <cmd>Telescope treesitter prompt_prefix=🔍<cr>
	nmap <leader>fb <cmd>Telescope buffers prompt_prefix=🔍<cr>
	nmap <leader>fg <cmd>Telescope git_files prompt_prefix=🔍<cr>
" }}}

" Vim-markdown and vimwiki{{{
	" let g:tex_conceal = ""
	" let g:vim_markdown_math = 1
	" let g:vim_markdown_frontmatter = 1
	" let g:vim_markdown_toc_autofit = 1

	let g:vimwiki_autowriteall = 0
	let g:vimwiki_ext2syntax = {}

	" }}}

" Iron {{{
  nmap <leader>\ <cmd>lua require("iron").core.send(vim.api.nvim_buf_get_option(0,"ft"), vim.api.nvim_buf_get_lines(0, 0, -1, false))<cr>
  " nmap <leader>\ :w<CR> \| <Cmd>lua require("iron").core.send(vim.api.nvim_buf_get_option(0,"ft"), "%run "..vim.api.nvim_buf_get_name(0))<CR>
  vmap <leader>\ <Plug>(iron-visual-send)
  nmap <leader><leader>\ <Plug>(iron-send-line)
  nmap <leader><leader><s-C> <Plug>(iron-cr)
  nmap <leader><leader>r <Plug>(iron-repeat-cmd)
  nmap <leader><leader>i <plug>(iron-interrupt)
  nmap <leader><leader>q <Plug>(iron-exit)
  nmap <leader><leader>c <Plug>(iron-clear)
	" }}}

" Python-syntax {{{
	let g:python_highlight_indent_errors = 0
	let g:python_highlight_space_errors = 0
	let g:python_highlight_all = 1
	" }}}

" Nerdcommenter {{{
	let g:NERDSpaceDelims = 1
	" }}}

" Vimtex {{{
	let g:vimtex_compiler_latexmk_engines = {'latexmk': '-pdf'}
	let g:tex_flavor = "latex"
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=1
	augroup vimtex_config
		au!
		au User VimtexEventQuit call vimtex#compiler#clean(0)
	augroup END
	" }}}

" Ultisnips {{{
	let g:UltiSnipsExpandTrigger = "<TAB>"
	let g:UltiSnipsJumpForwardTrigger = '<TAB>'
	let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
	let g:coc_snippet_next = '<TAB>'
	let g:coc_snippet_prev = '<S-TAB>'
	" }}}

" vCoolor {{{
	let g:vcoolor_disable_mappings = 1
	let g:vcoolor_map = '~C'
	" }}}

" CoC {{{
	" Maps
	nmap <leader>gd <Plug>(coc-definition)
	nmap <leader>gr <Plug>(coc-references)

	" Some config
	set nobackup
	set nowritebackup
	set cmdheight=1
	set updatetime=300
	set shortmess+=c

	" Completition with C-j, C-k
	inoremap <silent><expr> <C-j>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<C-j>" :
		  \ coc#refresh()
	inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" C-Space to trigger completation
	inoremap <silent><expr> <c-space> coc#refresh()
	" }}}

" Treesitter {{{
	lua require('nvim_treesitter')
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	" }}}

" Goyo {{{
	function! s:goyo_enter()
	  let b:quitting = 0
	  let b:quitting_bang = 0
	  autocmd QuitPre <buffer> let b:quitting = 1
	  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
	endfunction

	function! s:goyo_leave()
	  " Quit Vim if this is the only remaining buffer
	  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
		  qa!
		else
		  qa
		endif
	  endif
	endfunction

	autocmd! User GoyoEnter call <SID>goyo_enter()
	autocmd! User GoyoLeave call <SID>goyo_leave()
	" }}}
" }}}

" Mappings {{{

" Yank and paste from clipboard
	map <Leader>y "+y
	map <Leader>p "+p

" Open and select buffers
	nnoremap gb :ls<CR>:buffer<Space>

" Split navigation
	nmap <C-j> <C-w>j
	nmap <C-k> <C-w>k
	nmap <C-h> <C-w>h
	nmap <C-l> <C-w>l

	tmap <C-j> <esc><C-w>j
	tmap <C-k> <esc><C-w>k
	tmap <C-h> <esc><C-w>h
	tmap <C-l> <esc><C-w>l

" Sustitude/replace word under de cursor
	nmap <Leader>s :%s/\<<C-r><C-w>\>//<Left>

" Highlight search results
	nmap <Leader>h :set hls! <CR> :echo "Highlight search change" <CR>h

" Normal-mode in Terminal-mode (and not in fzf)
  autocmd TermOpen * tnoremap <Esc> <c-\><c-n>

" Resize windows
	nmap <C-w>0 <C-w>=

" Compile {{{
	autocmd FileType python nmap <buffer> <Leader><CR> :update<bar>!python3 % \| less<CR>
	autocmd FileType lua nmap <buffer> <Leader><CR> :update<bar>!lua % \| less<CR>
	autocmd FileType tex nmap <buffer> <Leader><CR> :update<bar>:VimtexCompile<CR>
    autocmd FileType c nmap <buffer> <Leader><CR> :update<bar>!clang -o %<.out % && ./%<.out<CR>
	autocmd FileType cpp nmap <buffer> <Leader><CR> :update<bar>!make %< && ./%<<CR>
	autocmd FileType markdown nmap <buffer> <Leader><CR> :update<bar>!md2pdf "%" "%<.pdf" <CR><CR>
	autocmd FileType sh nmap <buffer> <Leader><CR> :update<bar>!bash %<CR>
	autocmd FileType java nmap <buffer> <Leader><CR> :update<bar>!bspc rule -a \* -o state=floating && ~/Documents/processing-3.5.4/processing-java --sketch=%:p:h --run <CR>

	" }}}

" Second Compile {{{
	autocmd FileType python nmap <buffer> <Leader><Leader><CR> :update<bar>vs<Space>\|<Space>terminal ipython -i -c "\%run %"<CR>
	autocmd FileType markdown nnoremap <buffer> <Leader><Leader><CR> :update<bar>!zathura "%<.pdf" & disown<CR><CR>
	autocmd FileType tex nmap <buffer> <Leader><Leader><CR> :update<bar>:VimtexView<CR>

" Foundry markdown alternativy
	" autocmd FileType markdown nmap <buffer> <Leader><CR> :update<bar>!python3 /Users/bersp/Dropbox/Config_files_and_scripting/fvtt_pdf_compile/foundry_pdf_compile.py "%:p"<CR>
	" autocmd FileType markdown nnoremap <buffer> <Leader><Leader><CR> :update<bar>!open -g "$(echo "%<" \| rev \| cut -c20- \| rev).pdf"<CR><CR>
	" }}}

" }}}

" vim:foldmethod=marker:foldlevel=0
