return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		require("null-ls").setup({
			sources = {
				require("null-ls").builtins.formatting.stylua,
				require("null-ls").builtins.formatting.autopep8,
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
