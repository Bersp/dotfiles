let g:vimtex_compiler_latexmk_engines = {'latexmk': '-pdf'}
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 2
"let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_syntax_conceal = {
	  \ 'accents': 0,
	  \ 'ligatures': 0,
	  \ 'cites': 0,
	  \ 'fancy': 0,
	  \ 'greek': 0,
	  \ 'math_bounds': 0,
	  \ 'math_delimiters': 0,
	  \ 'math_fracs': 0,
	  \ 'math_super_sub': 0,
	  \ 'math_symbols': 0,
	  \ 'sections': 1,
	  \ 'styles': 0,
	  \}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_syntax_nospell_comments = 1
augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
augroup END
