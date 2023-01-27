return {
	"L3MON4D3/LuaSnip",
	config = function()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
		require("luasnip").config.set_config({ -- Setting LuaSnip config

			-- Enable autotriggered snippets
			enable_autosnippets = true,

			-- Use Tab (or some other key if you prefer) to trigger visual selection
			store_selection_keys = "<Tab>",

			update_events = 'TextChanged,TextChangedI'
		})

		vim.cmd([[
		imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
		inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

		snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
		snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

		command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
	]])
	end,
}
