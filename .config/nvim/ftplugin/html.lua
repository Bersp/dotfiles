-- Options
vim.bo.shiftwidth=2
vim.bo.tabstop=2

vim.keymap.set("", "<Leader>F", [[:lua vim.lsp.buf.format{async=True}<CR>]], { silent = true })
