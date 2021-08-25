nmap <buffer> <Leader><CR> :update<bar>:VimtexCompile<CR>
nmap <buffer> <Leader><Leader><CR> :update<bar>:VimtexView<CR>
lua require('latex/latex_sections')
lua require('latex/screenshots_to_latex')
