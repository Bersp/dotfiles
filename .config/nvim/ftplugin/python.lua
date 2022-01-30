-- Functions
function _G.python_compiler()
	vim.cmd("nmap <buffer> <Leader><CR> :update<bar>!python3 % \\| less<CR>")
	vim.cmd('nmap <buffer> <Leader><Leader><CR> :update<bar>vs<Space>\\|<Space>terminal ipython -i -c "\\%run %"<CR>')
end

function _G.manim_compiler_select_scene(compiler)
	local scene = vim.fn.input('Insert scene: ')

	local quality = vim.fn.input('\nInsert quality (l, m, h, k): ')
	if quality == '' then quality = 'm' end

	local n = vim.fn.input('\nInsert n: ')
	if n == '' then n = '0' end

	if compiler == 'manim' then
		play_cmd = '-p'
	elseif compiler == 'manimgl' then
		play_cmd = '-o'
	end

	vim.cmd("nmap <buffer> <Leader><CR> :update<bar>!".. compiler .." -n".. n .." -q".. quality .." ".. play_cmd .." % ".. scene .."<CR>")
end

function _G.manim_compiler(compiler)
	local scene = ''
	local quality = 'm'

	if compiler == 'manim' then
		play_cmd = '-p'
	elseif compiler == 'manimgl' then
		play_cmd = '-o'
	end

	vim.cmd("nmap <buffer> <Leader><CR> :update<bar>!".. compiler .." -q".. quality .." ".. play_cmd .." % ".. scene .."<CR>")
	vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><Leader><CR>',
														  ":lua manim_compiler_select_scene([[" .. compiler .. "]])<CR>",
															{noremap = true})
end


vim.cmd("command! SetManimCompiler execute 'call v:lua.manim_compiler()'")
vim.cmd("command! SetPythonCompiler execute 'call v:lua.python_compiler()'")

-- TODO: Función para dar formato a todo el texto EXCLUYENDO los comentarios
--function _G.neoformat_over_not_comment_lines()
	--local all_lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)

	--local li = 0
	--local lf = 0
	--local is_comment = false

	--for i, l in ipairs(all_lines) do
		--if l:find('^ *#') == nil then
			--is_comment = false
			--lf = i
		--else
			--if not is_comment then vim.cmd(li .. ',' .. lf-1 .. 'Neoformat! python yapf') end
			--is_comment = true
			--li = i+1
		--end
	--end
--end

-- File options
vim.cmd("call matchadd('ErrorMsg', '\\%81v', 100)")
vim.bo.expandtab = true

-- Choose right compiler
_G.python_compiler()

local all_lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
for i, l in ipairs(all_lines) do
	if l:find('from manim import *') ~= nil then
		_G.manim_compiler('manim')
	elseif l:find('from manimlib import *') ~= nil then
		_G.manim_compiler('manimgl')
	end
end

-- Mapiings
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>gm', '/def main():<CR>zz', {noremap = true})

vim.api.nvim_buf_set_keymap(0, 'n', '<leader><S-f>', ':Neoformat! python<CR>', {noremap = true})
vim.api.nvim_buf_set_keymap(0, 'v', '<leader><S-f>', ':Neoformat! python<CR>', {noremap = true})

