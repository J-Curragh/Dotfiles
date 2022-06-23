local R = require("jcli.map")

local M = {}

local function lsp_keymaps(bufnr)
    R.nnoremap("gD", ":lua vim.lsp.buf.declaration()<CR>")
    R.nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
    R.nnoremap("<Leader>h", ":lua vim.lsp.buf.hover()<CR>")
    R.nnoremap("gi", ":lua vim.lsp.buf.implementation()<CR>")
    R.nnoremap("<C-k>", ":lua vim.lsp.buf.signature_help()<CR>")
    R.nnoremap("gr", ":lua vim.lsp.buf.references()<CR>")
    R.nnoremap("rn", ":lua vim.lsp.buf.rename()<CR>")
    R.nnoremap("pd", ":lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>")
    R.nnoremap("nd", ":lua vim.diagnostic.goto_next({ border = 'rounded })<CR>")
    R.nnoremap("gl", ":lua vim.diagnostic.open_float()<CR>")
    R.nnoremap("<Leader>q", ":lua vim.diagnostic.setloclist()<CR>")
    vim.cmd([[
        command! Format execute 'lua vim.lsp.buf.formatting()'
    ]])
end

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]], false
    )
  end
end
    
M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do 
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
