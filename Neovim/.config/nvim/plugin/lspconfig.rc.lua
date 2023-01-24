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
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
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

nvim_lsp.bashls.setup {}

nvim_lsp.prismals.setup {}

nvim_lsp.clojure_lsp.setup {}

nvim_lsp.nimls.setup {}

nvim_lsp.ruby_ls.setup {}

nvim_lsp.ocamllsp.setup {}

nvim_lsp.clangd.setup {}

nvim_lsp.perlnavigator.setup {
  cmd = {
    'node', '/Users/jcli/PerlNavigator/server/out/server.js', '--stdio'
  },
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
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

nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = {
        {
          description = "Babel configuration",
          fileMatch = {
            ".babelrc.json",
            ".babelrc",
            "babel.config.json",
          },
          url = "https://json.schemastore.org/babelrc.json",
        },
        {
          description = "ESLint config",
          fileMatch = {
            ".eslintrc.json",
            ".eslintrc",
          },
          url = "https://json.schemastore.org/eslintrc.json",
        },
        {
          description = "Prettier config",
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
          },
          url = "https://json.schemastore.org/prettierrc",
        },
        {
          description = "NPM configuration file",
          fileMatch = {
            "package.json",
          },
          url = "https://json.schemastore.org/package.json",
        },
        {
          description = "Typescript configuration",
          fileMatch = {
            "tsconfig.json"
          },
          url = "https://json.schemastore.org/tsconfig.json"
        },
        {
          description = "Javascript configuration",
          fileMatch = {
            "jsconfig.json"
          },
          url = "https://json.schemastore.org/jsconfig.json"
        },
        -- llvm ecosystem
        {
          description = "Schema for CMake Presets",
          fileMatch = {
            "CMakePresets.json",
            "CMakeUserPresets.json",
          },
          url = "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json",
        },
      }
    }
  }
}
