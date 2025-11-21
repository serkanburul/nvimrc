vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>v", vim.cmd.Vex)

vim.keymap.set("v", "<leader>y", '"+Y',    { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>st", ":tab split | tabprevious | close | tabnext<CR>")

vim.keymap.set("n", "<leader>R", "<C-w>R", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", "<C-w>r", { noremap = true, silent = true })

vim.api.nvim_set_keymap("", "<leader>n", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<leader>p", ":tabprevious<CR>", { noremap = true, silent = true })

vim.keymap.set(
    "n",
    "<leader>q",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
