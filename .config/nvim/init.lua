vim.g.mapleader = " "

-- vim.commands {{{
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
--- }}}

-- Plugins {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins")
-- }}}

-- General config {{{
-- Color
opt.termguicolors = true
cmd([[color bersp_nord]])
--cmd[[
--let g:everforest_background = 'hard'
--color everforest
--]]
--cmd[[
--hi! Normal ctermbg=NONE guibg=NONE
--hi! NonText ctermbg=NONE guibg=NONE
--]]

-- Change defaults
opt.relativenumber = true -- show line numbers
opt.number = true -- but show the actual number for the line we're on
opt.laststatus = 3

opt.incsearch = true -- makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.inccommand = "split" -- show live sustitution
opt.cmdheight = 1 -- height of the command bar
opt.ignorecase = true -- ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- i like having buffers stay around
opt.splitright = true -- prefer windows splitting to the right
opt.splitbelow = true -- prefer windows splitting to the bottom
opt.updatetime = 1000 -- make updates happen faster
opt.hlsearch = false -- no highlight when search as default
opt.scrolloff = 7 -- make it so there are always ten lines below my cursor
opt.foldlevel = 99 -- don't fold if i don't say so
opt.mouse = "a" -- use mouse
opt.breakindent = true -- breaklines with tabs
opt.gdefault = true
opt.spelllang = "es,en"
opt.linebreak = true

-- Indent
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

-- No numbers in vim terminal
cmd([[autocmd TermOpen * setlocal nonumber norelativenumber]])

-- Return to last edit position when opening files
cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- Set undodir persist
if fn.empty(fn.glob("/tmp/undo-dir")) > 0 then
	os.execute("mkdir /tmp/undo-dir")
end
opt.undodir = "/tmp/undo-dir"
opt.undofile = true

-- Set cursorline
cmd([[
	augroup CursorLine
		au!
		au VimEnter * setlocal cursorline
		au WinEnter * setlocal cursorline
		au BufWinEnter * setlocal cursorline
		au WinLeave * setlocal nocursorline
		au FileType TelescopePrompt setlocal nocursorline
		au FileType TelescopeResults setlocal nocursorline
	augroup END
	]])

-- Show  name of the file on the top right corner
--opt.winbar = [[%m %f ]]

-- }}}

-- Mappings {{{
--
-- Yank and paste from clipboard
vim.keymap.set("", "<leader>y", '"+y')
vim.keymap.set("", "<leader>p", '"+p')

-- Yank to end of the line
vim.keymap.set("n", "<S-y>", "y$")

-- Open and select buffers
--vim.keymap.set("n", "gb", ":ls<cr>:buffer<space>")

-- Split navegation
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Toggle wrap
vim.keymap.set("n", "<F11>", ":set wrap!<CR>")

-- Toggle write mode
vim.cmd([[highlight FoldColumn guifg=bg guifg=bg]])
vim.keymap.set(
	"n",
	"<F12>",
	[[<cmd>set relativenumber! | set number! | PencilSoft | set ruler! | if &laststatus | set laststatus=0 | else | set laststatus=3 | endif | if &foldcolumn | set foldcolumn=0 | else | set foldcolumn=1 | endif <CR>]]
)

-- Sustitution
vim.keymap.set("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>/")
vim.keymap.set("v", "<Leader>s", [["sy:%s/\<<C-r>s\>/]])
vim.keymap.set("n", "<Leader><S-s>", [[:'<,'>s/\<<C-r><C-w>\>/]])

-- Highlight search results TODO: Pasar a lua
vim.cmd([[nmap <Leader>h :set hls! <CR> :echo "Highlight search change" <CR>h]])

-- Normal-mode in Terminal-mode (and not in fzf) TODO: Pasar a lua
vim.cmd([[autocmd TermOpen * tnoremap <Esc> <c-\><c-n>]])

-- Buffer delete but not split window
vim.keymap.set("n", "<Leader>bd", [[<cmd>b#<bar>bd#<CR>]])
-- }}}

-- vim:foldmethod=marker:foldlevel=0
