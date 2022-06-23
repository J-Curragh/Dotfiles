require("lspconfig")

local installer = require("nvim-lsp-installer")

installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("jcli.lsp.handlers").on_attach,
    capabilities = require("jcli.lsp.handlers").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko = require("jcli.lsp.providers.sumneko")
    opts = vim.tbl_deep_extend("force", sumneko, opts)
  end

  if server.name == "jsonls" then
    local jsonls = require("jcli.lsp.providers.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls, opts)
  end

  server:setup(opts)
end)

