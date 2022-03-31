local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print "lspconfig init failed"
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

lspconfig.gdscript.setup{
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}
