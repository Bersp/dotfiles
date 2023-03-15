vim.keymap.set("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
vim.keymap.set("n", "<leader>zz", "<Cmd>Telescope zk notes {sort={'modified'}} theme=ivy<CR>")
vim.keymap.set("n", "<leader>zt", "<Cmd>Telescope zk tags theme=ivy<CR>")
vim.keymap.set("v", "<leader>zn", ":'<,'>ZkNewFromTitleSelection<CR>")
vim.keymap.set("n", "<leader>zi", ":e Index.md<CR>", {silent = true})


return {
	"mickael-menu/zk-nvim",
	config = function()
		zk = require("zk")
		vim.keymap.set(
			"n",
			"<leader>zb",
			[[<Cmd>lua zk.edit({ linkTo = { vim.api.nvim_buf_get_name(0) } }, { title = "Zk Backlinks", picker = "telescope", telescope = require('telescope.themes').get_ivy({}) })<CR>]]
		)

		zk.setup({
			-- can be "telescope", "fzf" or "select" (`vim.ui.select`)
			-- it's recommended to use "telescope" or "fzf"
			picker = "telescope",

			lsp = {
				-- `config` is passed to `vim.lsp.start_client(config)`
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
					-- on_attach = ...
					-- etc, see `:h vim.lsp.start_client()`
				},

				-- automatically attach buffers in a zk notebook that match the given filetypes
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})
	end,
}
