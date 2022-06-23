local V = vim.fn

local M = {}

local function install_packer()
    local path = V.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if V.empty(V.glob(path)) > 0 then
        V.system({
            "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", path
        })
        print("Packer not found. It has been installed. You should restart NOW!!!")
    end


    vim.cmd([[packadd packer.nvim]])

end

M.init = function()
    -- Install packer if not installed.
    install_packer()

    -- Auto-reloading
    vim.cmd([[
        augroup packer_config_change
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerSync
        augroup end
    ]])

    local status_ok, packer = pcall(require, "packer")

    if not status_ok then
        vim.notify("didnt work")
        return
    end

    packer.init({
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    })

    return packer
end

return M
