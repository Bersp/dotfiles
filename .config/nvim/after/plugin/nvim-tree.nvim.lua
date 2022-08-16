local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then return end

nvim_tree.setup{
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
