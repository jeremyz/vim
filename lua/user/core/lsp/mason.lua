local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  print "mason init failed"
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  print "mason-lspconfig init failed"
  return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  print "lspconfig init failed"
  return
end

require('lspconfig.ui.windows').default_options.border = 'rounded'

local servers = {
  "clangd",
  "jdtls",
  "jsonls",
  "ltex",
  "rust_analyzer",
  "solargraph",
  "sumneko_lua",
}

mason.setup({
    ui = {
        border = "single",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
  ensure_installed = servers,
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {
      on_attach = require("user.core.lsp.handlers").on_attach,
      capabilities = require("user.core.lsp.handlers").capabilities,
      falgs = {
        debounce_text_changes = 5000,
      },
    }

    local require_ok, server = pcall(require, "user.core.lsp.settings." .. server_name)
    if require_ok then
      opts = vim.tbl_deep_extend("force", server, opts)
    end

    lspconfig[server_name].setup(opts)
  end,
})
