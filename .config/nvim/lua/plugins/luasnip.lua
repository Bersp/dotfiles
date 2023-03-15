return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load({
			include = {'html', 'css'}
		})
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
		require("luasnip").config.set_config({ -- Setting LuaSnip config

			history = false,

			-- Enable autotriggered snippets
			enable_autosnippets = true,

			-- Use Tab (or some other key if you prefer) to trigger visual selection
			store_selection_keys = "<Tab>",

			update_events = 'TextChanged,TextChangedI'
		})

		vim.cmd[[
		function! NextCharIsBracket()
			let next_char = strcharpart(getline('.')[col('.') - 1:], 0, 1)
			return next_char == ')' || next_char == ']' || next_char == '}' || next_char == '"' || next_char == "'" || next_char == '$'
		endfunction
		]]

		vim.cmd([[
		imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : NextCharIsBracket() ? '<Right>' : '<Tab>' 
		inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

		snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
		snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

		command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
	]])

	-- Leave snippet
	function leave_snippet()
			if
					((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
					and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
					and not require('luasnip').session.jump_active
			then
					require('luasnip').unlink_current()
			end
	end

	-- stop snippets when you leave to normal mode
	vim.api.nvim_command([[autocmd ModeChanged * lua leave_snippet()]])
	end,
}
