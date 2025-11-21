return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vimdoc", "javascript", "c", "lua",
                    "jsdoc", "bash", "go", "python", "html",
                },
                sync_install = false,
                auto_install = true,
                indent = { enable = true },
                autotag = { enable = true },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "markdown" },
                },
            })
        end
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
