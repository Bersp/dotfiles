local M = {}

M.latex = {
	in_mathzone = function()
		return vim.fn["vimtex#syntax#in_mathzone"]() == 1
	end,
}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node

local visual_node_f = function(args, parent)
	if #parent.snippet.env.SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
	else -- If SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

M.luasnip = {
	visual_node = function(...)
		return d(..., visual_node_f)
	end,
}

return M
