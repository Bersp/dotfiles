return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.autopep8,
				null_ls.builtins.formatting.fprettify
			},

			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.cmd("nnoremap <silent><buffer> <Leader>F :lua vim.lsp.buf.format{async=True}<CR>")
				end

				if client.server_capabilities.documentRangeFormattingProvider then
					vim.cmd("xnoremap <silent><buffer> <Leader>F :lua vim.lsp.buf.range_formatting({})<CR>")
				end
			end,
		})
	end,
}
