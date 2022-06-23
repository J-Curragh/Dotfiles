local R = require("jcli.map")

R.nnoremap("<Leader>.", ":lua require('jcli.telescope').find_all_files()<CR>")
R.nnoremap("<Space>f", ":lua require('jcli.telescope').search_from_home()<CR>")

R.nnoremap("<C-u>", ":lua require('telescope').extensions.project.project{}<CR>")
