lua << EOF
function _G.python_compiler()
	vim.cmd("nmap <buffer> <Leader><CR> :update<bar>!python3 % \\| less<CR>")
	vim.cmd('nmap <buffer> <Leader><Leader><CR> :update<bar>vs<Space>\\|<Space>terminal ipython -i -c "\\%run %"<CR>')
end

function _G.manim_compiler()
	local scene = vim.fn.input('Insert scene: ')
	local quality = vim.fn.input('\nInsert quality (l, m, h, k): ')
	if quality == '' then quality = 'm' end
	vim.cmd("nmap <buffer> <Leader><CR> :update<bar>!manim -q".. quality .." -p % " .. scene .. "<CR>")
end

_G.python_compiler()
EOF
command SetManimCompiler execute "call v:lua.manim_compiler()"
command SetPythonCompiler execute "call v:lua.python_compiler()"
