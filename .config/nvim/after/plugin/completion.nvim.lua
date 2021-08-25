if vim.g.loaded_completion then
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess:append({ c = true })

vim.cmd[[imap <TAB> <Plug>(completion_smart_tab)]]
vim.cmd[[imap <S-TAB> <Plug>(completion_smart_s_tab)]]

vim.cmd[[let g:completion_enable_auto_popup = 0]]
vim.cmd[[let g:completion_enable_auto_hover = 0]]

vim.cmd[[let g:completion_enable_snippet = 'UltiSnips']]
end
