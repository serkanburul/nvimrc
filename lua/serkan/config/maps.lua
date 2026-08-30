local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>v", vim.cmd.Vex)

vim.keymap.set("v", "<leader>y", '"+Y', opts)
vim.keymap.set("n", "<leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<leader>l", "<C-w>l", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>st", ":tab split | tabprevious | close | tabnext<CR>", opts)

vim.keymap.set("n", "<leader>R", "<C-w>R",  opts)
vim.keymap.set("n", "<leader>r", "<C-w>r",  opts)

vim.api.nvim_set_keymap("", "<leader>n", ":tabnext<CR>", opts)
vim.api.nvim_set_keymap("", "<leader>p", ":tabprevious<CR>", opts)

vim.keymap.set(
    "n",
    "<leader>q",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set('n', '<Up>', '/', { noremap = true, desc = "Arama modunu başlat" })
