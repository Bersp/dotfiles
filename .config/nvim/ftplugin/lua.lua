-- Options
vim.bo.shiftwidth=2
vim.bo.tabstop=2

-- Functions
function _G.lua_compiler()
	vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><CR>', [[:update<bar>!lua % \| less<CR>]], {noremap = true})
end

function _G.love_compiler()
	vim.api.nvim_buf_set_keymap(0, 'n', '<Leader><CR>', [[:update<bar>!../love %:p:h <CR>]], {noremap = true})
end
