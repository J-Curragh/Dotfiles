local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end

local sources = {
  -- Javascript/Typescript/Json
  null_ls.builtins.diagnostics.standardjs,
  null_ls.builtins.formatting.prettierd,
  -- Zsh
  null_ls.builtins.diagnostics.zsh,
  -- Python
  null_ls.builtins.formatting.black.with({
    extra_args = { "--config=~/.config/black/" }
  }),
  null_ls.builtins.diagnostics.flake8,
  -- Ruby
  null_ls.builtins.formatting.rubocop,
  -- OCaml
  null_ls.builtins.formatting.ocamlformat
}

null_ls.setup {
  on_attach = on_attach,
  sources = sources
}


vim.cmd("command! ToggleEslint lua require('null-ls.sources').toggle('eslint')")
