let g:vimtex_compiler_latexmk_engines = {'latexmk': '-pdf'}
let g:tex_flavor = "latex"
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
let g:vimtex_syntax_conceal_disable = 1
augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
augroup END
