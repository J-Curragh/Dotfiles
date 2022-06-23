local actions = require("telescope.actions")

local M = {}

require("telescope").setup({
    defaults = {
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,

	    mappings = {
            i = {
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
                ["<esc>"] = actions.close,
            },
        },
    },
    extensions = {
        project = {
            base_dirs = {
                "~/Projects"
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
    require("telescope.builtin").find_files({
        hidden = true
    })
end

M.search_from_home = function()
    require("telescope.builtin").find_files({
        hidden = true,
        cwd = "/home/jcli"
    })
end


return M
