vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { noremap = true })
--vim.keymap.set("n", "<leader>fr", "<cmd>Rg<CR>", { noremap = true })
vim.keymap.set(
	"n",
	"<leader>fr",
	[[<cmd>lua require'telescope.builtin'.grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' } <CR>]],
	{ noremap = true }
)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", { noremap = true })
vim.keymap.set("n", "z=", ":Telescope spell_suggest<CR>", { noremap = true })

local telescope_f = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-telescope/telescope-media-files.nvim",
	},
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
					"main",
					"%.o",
					"%.mod",
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
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
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
						["i"] = {
							["<C-h>"] = fb_actions.goto_parent_dir,
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("media_files")
		telescope.load_extension("zk")
	end,
}

--return { "nvim-telescope/telescope-file-browser.nvim", telescope_f }
return telescope_f
