require'nvim-tree'.setup{
	view = {
			mappings = {
				custom_only = false,
				list = {
					{ key = "H",                            action = "dir_up" },
					{ key = "L",                            action = "cd" },
				},
			},
		},
}

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap=true})
