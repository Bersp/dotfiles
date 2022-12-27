-- Options
vim.bo.shiftwidth=2
vim.bo.tabstop=2
vim.o.spell = true

keymap_opt = {noremap = true}

-- Latex compile
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><CR>', '<cmd>VimtexCompile<CR>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><Leader><CR>', '<cmd>VimtexView<CR>', keymap_opt)

-- TOC and errorstoggle
vim.api.nvim_buf_set_keymap(0, 'n', '<F2>', '<cmd>VimtexTocOpen<CR>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', '<cmd>VimtexErrors<CR>', keymap_opt)


require('latex/latex_functions')

-- Latex sections
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ln', ':call v:lua.latex_new_section()<CR>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ll', ':call v:lua.latex_section_picker()<CR>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lm', ':e main.tex<CR>', keymap_opt)


-- Latex screenshots
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ls', ':call v:lua.save_last_screenshot()<CR>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>l<S-s>', ':call v:lua.latex_figures_picker()<CR>', keymap_opt)


-- Inkscape-figures
vim.cmd[[
	imap <C-f> <Esc>: silent exec ':!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>

	nmap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
]]
