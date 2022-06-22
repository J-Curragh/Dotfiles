local function set_augroup()
  vim.api.nvim_command("augroup MarkdownAuto")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType markdown setlocal wrap")
  vim.api.nvim_command("augroup END")
end

local function set_vim_g()
  vim.g.mapleader = " "
end

local function set_vim_o()
  local settings = {
    backup = false,
    encoding = 'utf-8',
    errorbells = false,
    expandtab = true,
    hidden = true,
    scrolloff = 3,
    secure = true,
    softtabstop = 2,
    shiftwidth = 2,
    showmode = false,
    splitright = true,
    tabstop = 4,
    termguicolors = true,
    updatetime = 300,
  }

  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  -- Not yet in vim.o
  vim.cmd('set nowritebackup')
end

local function set_vim_wo()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = false }
  -- wincmd = C-W
  map('n', '<leader>h', '<CMD>wincmd h<CR>', options)
  map('n', '<leader>j', '<CMD>wincmd j<CR>', options)
  map('n', '<leader>k', '<CMD>wincmd k<CR>', options)
  map('n', '<leader>l', '<CMD>wincmd l<CR>', options)
  -- Learning not to use arrow keys
  map('n', '<Up>', '<Nop>', options)
  map('n', '<Down>', '<Nop>', options)
  map('n', '<Left>', '<Nop>', options)
  map('n', '<Right>', '<Nop>', options)
  -- Code folding
  map('n', '<leader><leader>', 'za', options)
end


local function init()
  set_augroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  set_keymaps()
  vim.cmd[[colorscheme rose-pine-light]]
end

return {
  init = init
}
