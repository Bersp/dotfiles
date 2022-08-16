local status, zen_mode = pcall(require, 'zen-mode')
if not status then return end

zen_mode.setup {
		window = {
			backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			-- height and width can be:
			-- * an absolute number of cells when > 1
			-- * a percentage of the width / height of the editor when <= 1
			-- * a function that returns the width or the height
			width = 90, -- width of the Zen window
			height = 0.9, -- height of the Zen window
			options = {
				number = false,
				relativenumber = false,
				cursorline = false,
			},
		},

	on_open = function(win)
		vim.cmd[[call pencil#init({'wrap': 'soft'})]]
	end,

	on_close = function()
		vim.cmd[[NoPencil]]
	end,
}

--vim.keymap.set('n', '<F12>', function() return require("zen-mode").toggle() end, {noremap = true})
