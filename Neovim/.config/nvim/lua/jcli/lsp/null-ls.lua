local null_ls = require("null-ls")

local M = {}

local b = null_ls.builtins

local sources = {
  b.formatting.shfmt, -- shell/bash
  b.formatting.clang_format, -- c/cpp
  b.formatting.deno_fmt, -- js/ts
  b.formatting.black, -- python
  b.formatting.rustfmt, -- rust
  b.formatting.stylua,

  b.code_actions.gitsigns, -- git actions

  b.diagnostics.write_good, -- flash fiction writing
}

null_ls.setup({
  debug = false,
  sources = sources,
})

return M
