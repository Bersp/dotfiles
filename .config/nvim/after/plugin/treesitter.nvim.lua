if vim.g.loaded_nvim_treesitter then
require('nvim_treesitter')
vim.o.foldmethod = 'expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'
end
