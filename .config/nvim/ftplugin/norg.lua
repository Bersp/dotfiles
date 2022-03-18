vim.opt.conceallevel = 2
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.spell = true


vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>op', [[yi{:!zathura "<C-R>0"<CR>]], {noremap = true})
