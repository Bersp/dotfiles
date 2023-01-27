local ls = require("luasnip")
local utils = require("utils")
local v = utils.luasnip.visual_node

snippets = {
	s({ trig = "bf" }, fmta([[\textbf{<>} <>]], { v(1), i(0) })),
	s({ trig = "it" }, fmta([[\textit{<>} <>]], { v(1), i(0) })),
}
ls.add_snippets("tex", snippets)

local _snippets = {
	s({ trig = "a;", snippetType = "autosnippet" }, fmta([[\alpha<>]], { i(0) })),
	s({ trig = "b;", snippetType = "autosnippet" }, fmta([[\beta<>]], { i(0) })),
	s({ trig = "b;", snippetType = "autosnippet" }, fmta([[\gamma<>]], { i(0) })),
	s({ trig = "d;", snippetType = "autosnippet" }, fmta([[\delta<>]], { i(0) })),
	s({ trig = "ve;", snippetType = "autosnippet" }, fmta([[\varepsilon<>]], { i(0) })),
	s({ trig = "vp;", snippetType = "autosnippet" }, fmta([[\varphi<>]], { i(0) })),

	s({ trig = "dd" }, fmta([[\dd <>]], { i(0) })),

	s({ trig = "-->", snippetType = "autosnippet" }, fmta([[\implies <>]], { i(0) })),

	s({ trig = "int" }, fmta([[\int_{<>}^{<>} <>]], { i(1), i(2), i(0) })),
	s({ trig = "oint" }, fmta([[\oint_{<>} <>]], { i(1), i(0) })),
	s({ trig = "int0" }, fmta([[\int_0^\infty <>]], { i(0) })),
	s({ trig = "intinf" }, fmta([[\int_{-\infty}^\infty <>]], { i(0) })),

	s({ trig = "sum" }, fmta([[\sum_{<>}^{<>} <>]], { i(1), i(2), i(0) })),
	s({ trig = "sumi" }, fmta([[\sum_{i=1}^N <>]], { i(0) })),

	s({ trig = "dag", wordTrig = false }, fmta([[^\dag<>]], { i(0) })),

	s({ trig = "dv" }, fmta([[\dv{<>}{<>}<>]], { i(1), i(2), i(0) })),
	s({ trig = "pdv" }, fmta([[\pdv{<>}{<>}<>]], { i(1), i(2), i(0) })),
	s({ trig = "pdve" }, fmta([[\eval{\pdv{<>}{<>}}_{<>} <>]], { i(1), i(2), i(3), i(0) })),
	s({ trig = "eval" }, fmta([[\eval{<>}_{<>}<>]], { v(1), i(2), i(0) })),

	s({ trig = "und" }, fmta([[\underbrace{<>}_{<>}]], { v(1), i(0) })),
}

snippets = {}
for _, snip in ipairs(_snippets) do
	snip.condition = utils.latex.in_mathzone
	table.insert(snippets, snip)
end

ls.add_snippets("tex", snippets)
