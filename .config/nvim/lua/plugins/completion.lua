local cmp_f = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind-nvim",
		"saadparwaiz1/cmp_luasnip",
	},
}

cmp_f.config = function()
	vim.o.completeopt = "menu,menuone,noselect"
	vim.opt.shortmess:append({ c = true })
	vim.o.pumheight = 10

	local cmp = require("cmp")
	cmp.setup({
		completion = {
			--autocomplete = false,
			-- keyword_length = 3
		},

		--documentation = false,
		snippet = {
			expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
		},

		mapping = {
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.close(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-n>"] = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
			["<C-p>"] = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
		},

		window = {
			-- documentation = true,
			-- completion = cmp.config.window.bordered(),
		},

		formatting = {
			format = require("lspkind").cmp_format({
				with_text = false,
				menu = {
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					ultisnip = "[UltiSnip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[Latex]",
				},
			}),
		},

		experimental = {
			native_menu = false,
			ghost_text = false,
		},

		sources = {
			{ name = "nvim_lsp" },
			-- { name = 'buffer' },
			--{ name = 'ultisnips' }, -- For ultisnips users.
		},
	})

	-- Setup lspconfig.
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	-- Colors
	vim.cmd("hi CmpItemMenu guifg=#4C566A")

	-- Autopairs
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return cmp_f
