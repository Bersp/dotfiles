local iron = require('iron')

iron.core.set_config {
  repl_open_cmd = "10 split",
  preferred = {
    python = "ipython"
  }
}

local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

map('n', [[<leader>\]], [[<cmd>lua require("iron").core.send(vim.api.nvim_buf_get_option(0,"ft"), vim.api.nvim_buf_get_lines(0, 0, -1, false))<cr>]], opts)
map('v', [[<leader>\]], [[<Plug>(iron-visual-send)]], opts)
