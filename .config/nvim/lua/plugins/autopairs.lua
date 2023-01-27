return {
	"windwp/nvim-autopairs",
	config = function()
		local npairs = require("nvim-autopairs")
		local remap = vim.api.nvim_set_keymap
		local Rule = require("nvim-autopairs.rule")

		npairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add pair on that treesitter node
			},
			ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
		})

		-- Add space between parentheses
		npairs.add_rules({
			Rule(" ", " "):with_pair(function(opts)
				local pair = opts.line:sub(opts.col - 1, opts.col)
				return vim.tbl_contains({ "()", "[]", "{}" }, pair)
			end),
			Rule("( ", " )")
				:with_pair(function()
					return false
				end)
				:with_move(function(opts)
					return opts.prev_char:match(".%)") ~= nil
				end)
				:use_key(")"),
			Rule("{ ", " }")
				:with_pair(function()
					return false
				end)
				:with_move(function(opts)
					return opts.prev_char:match(".%}") ~= nil
				end)
				:use_key("}"),
			Rule("[ ", " ]")
				:with_pair(function()
					return false
				end)
				:with_move(function(opts)
					return opts.prev_char:match(".%]") ~= nil
				end)
				:use_key("]"),
		})

		local status, ts_conf = pcall(require, "nvim-treesitter.configs")
		if status then
			ts_conf.setup({ autopairs = { enable = true } })
		end

		local status, compe = pcall(require, "nvim-autopairs.completion.compe")
		if status then
			compe.setup({
				map_cr = true, --  map <CR> on insert mode
				map_complete = true, -- it will auto insert `(` after select function or method item
				auto_select = false, -- auto select first item
			})
		end
	end,
}
