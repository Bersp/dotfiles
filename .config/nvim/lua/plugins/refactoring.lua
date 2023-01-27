vim.keymap.set(
	"v",
	"<leader>re",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.keymap.set(
	"v",
	"<leader>rf",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.keymap.set(
	"v",
	"<leader>rv",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
vim.keymap.set(
	"v",
	"<leader>ri",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
vim.keymap.set(
	"n",
	"<leader>rp",
	":lua require('refactoring').debug.print_var({ normal = true })<CR>",
	{ noremap = true }
)
-- Remap in visual mode will print whatever is in the visual selection
vim.keymap.set("v", "<leader>rp", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })

return {
	"ThePrimeagen/refactoring.nvim",
	config = true,
}
