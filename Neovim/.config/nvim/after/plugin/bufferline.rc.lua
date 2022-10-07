local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {})

vim.api.nvim_set_keymap('n', '<C-Tab>', '<cmd>BufferLineCyclePrev<CR>', {})
