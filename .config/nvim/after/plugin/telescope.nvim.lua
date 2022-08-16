local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<c-j>"] = actions.move_selection_next,
				["<c-k>"] = actions.move_selection_previous,
				["<c-d>"] = actions.close,
			},
			n = { ["<c-d>"] = actions.close },
		},
		file_ignore_patterns = {
			"%.aux",
			"%.gz",
			"%.log",
			"%.fls",
			"%.fdb_latexmk",
			"%.pdf",
			"%.hdf5",
			"%.npy",
			--"%.png",
			--"%.jpg",
			"%.gif",
			"%.tif",
			"%.tiff",
			"%.eot",
			"%.doctree",
			"%.woff",
			"__pycache__",
		},
	},

	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		file_browser = {
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						["<C-w>"] = function() vim.cmd('normal vbd') end,
					},
					["n"] = {
						-- your custom normal mode mappings
						["N"] = fb_actions.create,
						["h"] = fb_actions.goto_parent_dir,
						["/"] = function()
							vim.cmd('startinsert')
						end
					},
				},
			},
	}
})

telescope.load_extension("file_browser")

vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fr", ":Rg<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
