if vim.g.lspconfig then
local nvim_lsp = require('lspconfig')

-- Python
	nvim_lsp.pyright.setup{
		on_attach = on_attach,
		settings = {python = {linting = false}, diagnostic = false},
		flags = {
		debounce_text_changes = 150,
		},
	}

-- Lua
	local system_name
	if vim.fn.has("mac") == 1 then
		system_name = "macOS"
	elseif vim.fn.has("unix") == 1 then
		system_name = "Linux"
	elseif vim.fn.has('win32') == 1 then
		system_name = "Windows"
	else
		print("Unsupported system for sumneko")
	end

	local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
	local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

	local runtime_path = vim.split(package.path, ';')
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	require'lspconfig'.sumneko_lua.setup {
		cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
					path = runtime_path,
				},
				diagnostics = {
					globals = {'vim'},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	}

-- Config on_atach
local on_attach = function(client, bufnr) end

-- Disable lsp diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- Disable auto signature
vim.cmd[[let g:completion_enable_auto_signature = 0]]

-- Mappings
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent= true}
map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end
