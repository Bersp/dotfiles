-- Functions
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
vim.cmd("command! SetManimCompiler execute 'call v:lua.manim_compiler()'")
vim.cmd("command! SetPythonCompiler execute 'call v:lua.python_compiler()'")

-- File options
vim.cmd("call matchadd('ErrorMsg', '\\%81v', 100)")
vim.bo.expandtab = true

-- Mappings
_G.python_compiler()

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>gm', '/def main():<CR>zz', {noremap = true})

vim.api.nvim_buf_set_keymap(0, 'n', '<leader><S-f>', ':Neoformat! python<CR>', {noremap = true})
vim.api.nvim_buf_set_keymap(0, 'v', '<leader><S-f>', ':Neoformat! python<CR>', {noremap = true})

