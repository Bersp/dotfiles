return {
	{
		"williamboman/mason.nvim",
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = { ensure_installed = { "sumneko_lua" } },
	},
}
