vim.keymap.set("n", "<Leader>gp", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "<Leader>R", "<cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<F2>", "<cmd>Lspsaga outline<CR>")
vim.keymap.set({"n", "t"}, "<F3>", "<cmd>Lspsaga term_toggle<CR>")

return {
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = true,
				separator = "  ",
				ignore_patterns = {},
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = false,
				color_mode = true,
			},
			ui = { kind = { ["Folder"] = { "%m   ", "Normal" } } },
		})
		vim.opt.winbar = [[%#SagaWinbarFolder# %m  %*%#SagaWinbarFolderName#%{expand('%:p:h:t')}%*%#SagaWinbarSep#  %*%#SagaWinbarFileIcon# %*%#SagaWinbarFileName#%t]]
	end,
}
