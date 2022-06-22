if vim.g.loaded_telescope then
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
		["<c-j>"] = actions.move_selection_next,
		["<c-k>"] = actions.move_selection_previous,
		--["<esc>"] = actions.close,
      },
    },
	file_ignore_patterns = {"%.aux", "%.gz", "%.log", "%.fls", "%.fdb_latexmk", "%.pdf", "%.hdf5", "%.npy", "%.png", "%.jpg", "%.gif", "%.tif", "%.tiff", "%.eot", "%.doctree", "%.woff", "__pycache__"},
  },
  extensions = {
  	fzy_native = {
		override_generic_sorter = false,
		override_file_sorter = true,
	}
  }
}

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope git_files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fr', ':Rg<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {noremap=true})
--require('telescope').load_extension('fzy_native')
end
