local R = require("jcli.map")

R.nnoremap("<leader>a", ":lua require('harpoon.mark').add_file()<CR>")
R.nnoremap("<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

R.nnoremap("<C-1>", ":lua require('harpoon.ui').nav_file(1)<CR>")
R.nnoremap("<C-2>", ":lua require('harpoon.ui').nav_file(2)<CR>")
R.nnoremap("<C-3>", ":lua require('harpoon.ui').nav_file(3)<CR>")
R.nnoremap("<C-4>", ":lua require('harpoon.ui').nav_file(4)<CR>")

