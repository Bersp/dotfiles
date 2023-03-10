vim.bo.shiftwidth=3
vim.bo.tabstop=3

vim.keymap.set('n', [[<Leader><CR>]], [[:update<bar>bo sp <bar> ter make clean && make && ./main <CR> <bar> <S-g>]])
