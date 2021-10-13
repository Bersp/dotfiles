vim.o.spell = true

keymap_opt = {noremap = true}

-- Latex compile
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><CR>', '<cmd>VimtexCompile<CR>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><Leader><CR>', '<cmd>VimtexView<CR>', keymap_opt)


-- Latex sections
require('latex/latex_sections')
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ln', ':call v:lua.latex_new_section()<cr>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ll', ':call v:lua.latex_section_picker()<cr>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lm', ':e main.tex<cr>', keymap_opt)


-- Latex screenshots
require('latex/screenshots_to_latex')
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ls', ':call v:lua.save_last_screenshot()<cr>', keymap_opt)
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>l<S-s>', ':call v:lua.subscribe_screenshot()<cr>', keymap_opt)
