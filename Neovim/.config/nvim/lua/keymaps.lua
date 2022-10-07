local keymap = vim.keymap

-- Do not copy text when deleting under cursor
keymap.set('n', 'x', '"_x')

-- Increment/decrement integers
keymap.set('n', '+', '<C-a>')
keymap.set('n', '_', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

