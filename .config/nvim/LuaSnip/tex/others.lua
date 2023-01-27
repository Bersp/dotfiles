local ls = require("luasnip")
local utils = require("utils")

local vec_node = {
	f(function(_, snip)
		return string.format("\\vb{%s} ", snip.captures[1])
	end, {}),
}

local _snippets = {
	s({ trig = "([%a][%a])(%.,)" }, vim.deepcopy(vec_node)),
	s({ trig = "([%a][%a])(,%.)" }, vim.deepcopy(vec_node)),
	s({ trig = "([%a])(%.,)" }, vim.deepcopy(vec_node)),
	s({ trig = "([%a])(,%.)" }, vim.deepcopy(vec_node)),

	s({ trig = "<(.*)|" }, {
		f(function(_, snip)
			return string.format("\\bra{%s}", snip.captures[1])
		end),
	}),

	s({ trig = "|(.*)>" }, {
		f(function(_, snip)
			return string.format("\\ket{%s}", snip.captures[1])
		end),
	}),
}

local snippets = {}
for _, snip in ipairs(_snippets) do
	snip.condition = utils.latex.in_mathzone
	snip.regTrig = true
	table.insert(snippets, snip)
end

ls.add_snippets("tex", snippets, { type = "autosnippets" })
