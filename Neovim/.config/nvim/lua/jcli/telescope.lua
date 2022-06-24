local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

local Job = require("plenary.job")

local M = {}

require("telescope").setup({
  defaults = {
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    entry_prefix = " ",
    file_ignore_patterns = {},
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    initial_mode = "insert",
    layout_strategy = "horizontal",
    mappings = {
      i = {
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
        ["<esc>"] = actions.close,
      },
    },
    path_display = { shorten = 5 },
    pickers = {
      find_files = { hidden = true },
      live_grep = { only_sort_text = true },
    },
    prompt_prefix = " ",
    selection_caret = " ",
    selection_strategy = "reset",
    set_env = { ["COLORTERM"] = "truecolor" },
    sorting_strategy = "ascending",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    winblend = 0,
  },
  extensions = {
    project = {
        base_dirs = {
            "~/Projects",
        }
    },
    hidden_files = true,
    theme = "dropdown"
  }
})


-- Load extensions
require("telescope").load_extension("project")


-- Custom functions
M.find_all_files = function()
  local opts = {}
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then require("telescope.builtin").find_files(opts) end
end

M.search_from_home = function()
    require("telescope.builtin").find_files({
        hidden = true,
        cwd = "/home/jcli"
    })
end


return M
