vim.opt.conceallevel = 2
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.spell = true

-- Giladas para las notas de roll
function add_object(object_name, object_tag, l)
		vim.api.nvim_buf_set_keymap(
		0, 'n', '<Leader>n' .. l,
		'?' .. object_name .. '<CR>}O  []{$ '.. object_tag ..'}: <esc>F[a',
		{noremap = true}
	)
	vim.api.nvim_buf_set_keymap(
		0, 'v', '<Leader>n' .. l,
		'y?' .. object_name .. '<CR>}O  [<C-o>p]{$ '.. object_tag ..'}: ',
		{noremap = true}
	)
end

function goto_object(object_name, l)
		vim.api.nvim_buf_set_keymap(
		0, 'n', '<Leader>g' .. l,
		'?' .. object_name .. '<CR>',
		{noremap = true}
	)
end

add_object('Items', 'npc', 'i')
add_object('NPCs', 'npc', 'n')
add_object('Places', 'place', 'p')

goto_object('Items','i')
goto_object('NPCs', 'n')
goto_object('Places','p')

