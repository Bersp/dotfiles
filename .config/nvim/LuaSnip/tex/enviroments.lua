local ls = require("luasnip")
local v = require("utils").luasnip.visual_node

local snippets = {}
for j, env in ipairs({ "note", "definition", "theorem", "proof", "corollary", "frame" }) do
	snippets[j] = s(
		{ trig = env },
		fmta([[
			\begin{]] .. env .. [[}{<>}{}
				<>
			\end{]] .. env .. [[}
     ]], { i(1), i(0) })
	)
end
ls.add_snippets("tex", snippets)

local snippets = {
	s(
		{ trig = "beg" },
		fmta(
			[[
			\begin{<>}
				<>
			\end{<>}
			]],
			{ i(1), i(0), rep(1) }
		)
	),

	s(
		{ trig = "fig" },
		fmta(
			[[
				\begin{figure}[ht]
					\centering
					\includegraphics[width=<>\linewidth]{<>}
				\end{figure}
			]],
			{ i(1), i(0) }
		)
	),

	s(
		{ trig = "lfig" },
		fmta(
			[[
				\begin{figure}[ht]
					\centering
					\includegraphics[width=<>\linewidth]{figures/<>}
					\caption{}
					\label{fig:<>}
				\end{figure}
			]],
			{
				i(1),
				i(2),
				extras.lambda(l._1:gsub("figures/", ""):gsub(".pdf", ""), 2),
			}
		)
	),

	s(
		{ trig = "alig" },
		fmta(
			[[
			\begin{aligned}
				<>
			\end{aligned}
			]],
			{ v(1) }
		)
	),

	s(
		{ trig = "minipage" },
		fmta(
			[[
			\begin{minipage}{0.49\textwidth}
				<>
			\end{minipage} \hfill
			\begin{minipage}{0.49\textwidth}
				<>
			\end{minipage}
			]],
			{ i(1), i(0) }
		)
	),

	s(
		{ trig = "2figs" },
		fmta(
			[[
			\begin{minipage}{0.49\textwidth}
				<>
			\end{minipage} \hfill
			\begin{minipage}{0.49\textwidth}
				<>
			\end{minipage}
		]],
			{ i(1), i(0) }
		)
	),

	s(
		{ trig = "env" },
		fmta(
			[[
			\[
				<>
			\]
		]],
			{ i(0) }
		)
	),

	s(
		{ trig = "eq" },
		fmta(
			[[
			\begin{equation}
				<>
			\end{equation}
			]],
			{ v(1) }
		)
	),
}
ls.add_snippets("tex", snippets)
