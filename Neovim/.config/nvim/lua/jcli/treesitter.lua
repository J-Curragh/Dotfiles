local parsers = {
  "bash", "fish", "commonlisp", "python", -- stuff i use for Unix scripting
  "c", "cpp", "lua", "rust", "java", -- development stack
  "css", "html", "javascript", "tsx", "http", "graphql", "jsdoc", -- web dev
  "make", "llvm", "cmake", "dockerfile", -- build tools
  "json", "toml", "rasi", "yaml", -- markup/markdown
  "latex", "bibtex", --typesetting
}

local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = parsers,
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
})

