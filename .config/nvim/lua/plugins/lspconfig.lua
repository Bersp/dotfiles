vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>")
vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>")
vim.keymap.set("n", "<leader>R", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

local lspconfig = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"smjonas/inc-rename.nvim",
	},
	config = function()
		require("inc_rename").setup()
		nvim_lsp = require("lspconfig")

		-- Python
		nvim_lsp.pyright.setup({
			on_attach = on_attach,
			settings = { python = { linting = false }, diagnostic = false },
			flags = {
				debounce_text_changes = 150,
			},
		})

		-- Lua
		nvim_lsp.sumneko_lua.setup({})

		-- Fortran
		nvim_lsp.fortls.setup({})

		-- Latex
		nvim_lsp.texlab.setup({})

		-- Javascript
		nvim_lsp.eslint.setup({})
		nvim_lsp.tsserver.setup({})

		-- HTML and CSS
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		require("lspconfig").html.setup({
			capabilities = capabilities,
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			provideFormatter = true,
		})
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require'lspconfig'.cssls.setup {
			capabilities = capabilities,
		}

		-- Config on_atach
		local on_attach = function(client, bufnr) end

		-- -- Disable lsp diagnostics
		vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

		-- -- Disable auto signature
		vim.cmd([[let g:completion_enable_auto_signature = 0]])
	end,
}

return lspconfig
