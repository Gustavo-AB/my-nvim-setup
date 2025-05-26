return {
	-- MASON
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
		end
	},
	-- MASON-LSPCONFIG
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end
	},
	-- LSPCONFIG
	{
		"nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require('lspconfig')

			local util = require("lspconfig.util");

			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})

			lspconfig.ts_ls.setup({
			  capabilities = capabilities	
			})
		end
	}
}
