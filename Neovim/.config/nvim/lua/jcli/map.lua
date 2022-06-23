local M = {}

function map(mode, opts)
    opts = opts or { noremap = true }
    return function(key_seq, cmd, extra_opts)
	-- merge option maps
	extra_opts = vim.tbl_extend("force", opts, extra_opts or {})

	vim.keymap.set(mode, key_seq, cmd, extra_opts) 
    end
end

-- normal mode
M.nmap = map("n", { noremap = false })
M.nnoremap = map("n")

-- terminal mode
M.tnoremap = map("t")

-- insert mode
M.inoremap = map("i")

return M
