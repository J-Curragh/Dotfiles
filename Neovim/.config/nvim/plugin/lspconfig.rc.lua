local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local status2, rt = pcall(require, 'rust-tools')
if (not status2) then return end


local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }


  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", ";ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", ";rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", ";d", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", ";D", "<Cmd>TroubleToggle workspace_diagnostics<CR>", opts)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },

      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}

nvim_lsp.jedi_language_server.setup {
  on_attach = on_attach
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

rt.setup {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      show_parameter_hints = true
    }
  },
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.set.keymap("n", "<C-space>", rt.hover_actions, { buffer = bufnr })
    end,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        }
      }
    }
  }
}
