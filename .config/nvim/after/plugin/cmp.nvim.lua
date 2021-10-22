if vim.g.loaded_cmp then
vim.o.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append({ c = true })

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({

  completion = {
    autocomplete = false
  },

	documentation = false,

	snippet = {
		expand = function(args)
			 vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},

	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.close(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-n>'] = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
		['<C-p>'] = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
	},

	formatting = {
		format = require("lspkind").cmp_format({with_text = true, menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				ultisnip = "[UltiSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
			})}),
	},

	experimental = {
		native_menu = false,
		ghost_text = true,
	},

	sources ={
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		--{ name = 'ultisnips' }, -- For ultisnips users.
	}

})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Colors
vim.cmd"hi CmpItemMenu guifg=#4C566A"

-- Autopairs
require("nvim-autopairs.completion.cmp").setup {
   map_cr = false, --  map <CR> on insert mode
   map_complete = true, -- it will auto insert `(` after select function or method item
}
end