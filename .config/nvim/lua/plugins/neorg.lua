return {
	"nvim-neorg/neorg",
	config = function()
		require("neorg").setup({
			-- Tell Neorg what modules to load
			load = {
				["core.defaults"] = {}, -- Load all the default modules
				["core.keybinds"] = { -- Configure core.keybinds
					config = {
						default_keybinds = true, -- Generate the default keybinds
						neorg_leader = "<Leader>o", -- This is the default if unspecified
					},
				},
				["core.norg.concealer"] = {
					config = {
						icons = {
							todo = {
								done = { icon = "" },
								pending = { icon = "+" },
								on_hold = { icon = "" },
								urgent = { icon = "!" },
								cancelled = { icon = "/" },
								uncertain = { icon = "?" },
							},
						},
					},
				},
				["core.norg.dirman"] = { -- Manage your directories with Neorg
					config = {
						workspaces = {
							my_workspace = "~/Documents/neorg",
						},
					},
				},
			},
		})

		local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

		parser_configs.norg_meta = {
			install_info = {
				url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
				files = { "src/parser.c" },
				branch = "main",
			},
		}

		parser_configs.norg_table = {
			install_info = {
				url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
				files = { "src/parser.c" },
				branch = "main",
			},
		}
	end,
}
