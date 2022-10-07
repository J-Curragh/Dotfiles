local masonStatus, mason = pcall(require, 'mason')
if (not masonStatus) then return end
local masonLspStatus, lspconfig = pcall(require, 'mason-lspconfig')
if (not masonLspStatus) then return end

mason.setup {}
lspconfig.setup {
  ensure_installed = { 'tailwindcss' }
}

require('lspconfig').tailwindcss.setup {}
