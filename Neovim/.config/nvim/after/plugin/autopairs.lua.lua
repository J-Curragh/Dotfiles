local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then return end

autopairs.setup {
  disable_filetype = { 'TelescopePrompt', 'vim' }
}

local status_cmp_autopairs, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if (not status_cmp_autopairs) then return end

local status_cmp, cmp = pcall(require, 'cmp')
if (not status_cmp) then return end

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
