vim.bo.shiftwidth=2
vim.bo.tabstop=2

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><CR>', [[:update<bar>!lua % \| less<CR>]], {noremap = true})
