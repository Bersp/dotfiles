vim.opt.conceallevel = 2
vim.opt.linebreak = true

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><CR>', [[:MarkdownPreview<CR>]], {noremap = true})
