local R = require("jcli.map")

R.nnoremap("<C-t>", ":FloatermNew --silent=true --disposable=true<CR>")
R.tnoremap("<C-q>", [[<C-\><C-n>:FloatermKill<CR>]])
