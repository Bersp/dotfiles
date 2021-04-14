lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
		["<c-j>"] = actions.move_selection_next,
		["<c-k>"] = actions.move_selection_previous,
		["<esc>"] = actions.close,
      },
    },
	file_ignore_patterns = {"%.aux", "%.gz", "%.log", "%.fls", "%.fdb_latexmk", "%.pdf"},
  },
  extensions = {
  	fzy_native = {
		override_generic_sorter = false,
		override_file_sorter = true,
	}
  }
}

require('telescope').load_extension('fzy_native')
EOF

