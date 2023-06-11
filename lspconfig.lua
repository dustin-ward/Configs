local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {"gopls"},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
}

lspconfig.svelte.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {"svelteserver", "--stdio"},
	filetypes = {"svelte", "html"},
	root_dir = util.root_pattern("package.json", ".git"),
}

lspconfig.tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {"typescript-language-server", "--stdio"},
	filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	init_options = {
		hostInfo = "neovim"
	},
	root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
	single_file_support = true,
}
