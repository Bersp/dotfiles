if vim.g.loaded_lspsaga then
local saga = require('lspsaga')

saga.init_lsp_saga{
	 finder_definition_icon = ' ',
	 finder_reference_icon = ' ',
	 max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
	 finder_action_keys = {
		 open = 'o', vsplit = 'v', split = 's', quit = '<esc>', scroll_down = '<C-f>', scroll_up = '<C-b>'
	 },
	 code_action_keys = {
		 quit = '<esc>',exec = '<CR>'
	 },
	 rename_action_keys = {
		 quit = '<C-c>',exec = '<CR>'  -- quit can be a table
	 },
	 definition_preview_icon = '',
	 rename_prompt_prefix = ':',
	 code_action_prompt = {
		 enable = false,
	 },
}

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent= true}

map('n', '<leader>gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
map('n', '<leader>gp', '<cmd>Lspsaga preview_definition<CR>', opts)
map('n', '<leader>R', '<cmd>Lspsaga rename<CR>', opts)

map('n', '<S-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)


map('n', '<C-f>', '<cmd>lua require("lspsaga.action", opts).smart_scroll_with_saga(1)<CR>', opts)
map('n', '<C-b>', '<cmd>lua require("lspsaga.action", opts).smart_scroll_with_saga(-1)<CR>', opts)
end
