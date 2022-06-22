local function init() 
  require('auto-pandoc')
  vim.api.nvim_set_keymap('n', '<leader>p', ':lua require("auto-pandoc").run_pandoc()<CR>', {noremap = true, silent = true})
end

return { init = init }

