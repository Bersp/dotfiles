return {
	"hkupty/iron.nvim",
	config = function ()
		require('iron.core').setup({
			config = {
				-- If iron should expose `<plug>(...)` mappings for the plugins
				should_map_plug = false,
				-- Whether a repl should be discarded or not
				scratch_repl = true,
				-- Your repl definitions come here
				repl_definition = {
					sh = {
						command = { "zsh" },
					},
				},
				repl_open_cmd = [[bo sp]],
			},

			keymaps = {
				visual_send = [[<leader>\]],
				send_file = [[<space>\]],
			},

			highlight = {
				italic = false,
			},
		})
	end
}
