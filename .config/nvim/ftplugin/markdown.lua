vim.opt.conceallevel = 2
vim.opt.linebreak = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

vim.keymap.set("n", "<Leader><CR>", [[:MarkdownPreview<CR>]])

require("zk_functions")
vim.keymap.set("n", "<leader>zp", ":call v:lua.paste_image()<CR>", { silent = true })
vim.keymap.set("v", "<leader>zd", ":call v:lua.delete_file()<CR>", { silent = true })
