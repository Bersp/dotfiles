vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fr", "<cmd>Rg<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", { noremap = true })
vim.keymap.set("n", "z=", ":Telescope spell_suggest<CR>", { noremap = true })

local telescope_f = {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = telescope.extensions.file_browser.actions
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						-- ["<c-j>"] = actions.move_selection_next,
						-- ["<c-k>"] = actions.move_selection_previous,
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
					"%.gif",
					"%.tif",
					"%.tiff",
					"%.eot",
					"%.doctree",
					"%.woff",
					"__pycache__",
				},
			},
			pickers = {
				find_files = { theme = "ivy" },
				git_files = { theme = "ivy" },
				grep_string = { theme = "ivy" },
				live_grep = { theme = "ivy" },
				spell_suggest = { theme = "ivy" },
				lsp_definitions = { theme = "ivy" },
				lsp_references = { theme = "ivy" },
				buffers = { theme = "ivy" },
			},
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
					mappings = {
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			},
		})
		telescope.load_extension("file_browser")
	end,
}

return { "nvim-telescope/telescope-file-browser.nvim", telescope_f }
