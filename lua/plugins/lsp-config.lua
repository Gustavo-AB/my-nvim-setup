return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "clangd" },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp"
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      -- Configurações básicas dos LSPs
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        --on_attach = function(client, bufnr)
        --  client.server_capabilities_signatureHelpProvider = false
        --  on_attach(client, bufnr)
        --end
      })

      -- Atalhos úteis
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })
    end,
  },
}
