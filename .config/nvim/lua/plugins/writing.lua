return {
	{
		"plasticboy/vim-markdown",
		dependencies = { "godlygeek/tabular" },
		config = function()
			vim.cmd([[
				let g:vim_markdown_conceal_code_blocks = 0
				let g:vim_markdown_frontmatter = 1
				let g:vim_markdown_no_extensions_in_markdown = 1
				let g:vim_markdown_follow_anchor = 1
				let g:vim_markdown_autowrite = 1
				let g:vim_markdown_math = 1
				let g:tex_conceal = ''

				function OpenMarkdownPreview (url)
				execute "silent ! qutebrowser --target=window " . a:url
				endfunction

				let g:mkdp_browserfunc = 'OpenMarkdownPreview'

				let g:mkdp_preview_options = {
				\ 'mkit': {},
				\ 'katex': {},
				\ 'uml': {},
				\ 'maid': {},
				\ 'disable_sync_scroll': 0,
				\ 'sync_scroll_type': 'middle',
				\ 'hide_yaml_meta': 1,
				\ 'sequence_diagrams': {},
				\ 'flowchart_diagrams': {},
				\ 'content_editable': v:false,
				\ 'disable_filename': 0,
				\ 'toc': {}
				\ }
			]])
		end,
	},

	{
		"iamcco/markdown-preview.nvim", --markdown preview
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"preservim/vim-pencil",
		cmd = "PencilSoft",
	},
}
