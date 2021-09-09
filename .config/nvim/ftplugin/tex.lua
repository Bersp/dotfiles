opt = {noremap = true}

-- Latex compile
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><CR>', '<cmd>VimtexCompile<CR>', opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><Leader><CR>', '<cmd>VimtexView<CR>', opt)


-- Latex sections
require('latex/latex_sections')
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ln', ':call v:lua.latex_new_section()<cr>', opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ll', ':call v:lua.latex_section_picker()<cr>', opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lm', ':e main.tex<cr>', opt)


-- Latex screenshots
require('latex/screenshots_to_latex')
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ls', ':call v:lua.save_last_screenshot()<cr>', opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>l<S-s>', ':call v:lua.subscribe_screenshot()<cr>', opt)
