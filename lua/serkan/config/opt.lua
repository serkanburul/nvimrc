vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn ="200"

vim.cmd [[cnoreabbrev w update]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
	end,
})

vim.g.mapleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_altv = 1
vim.g.netrw_alto = 1
