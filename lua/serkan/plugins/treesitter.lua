return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false, -- main branch lazy-loading desteklemiyor
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup()

            local langs = {
                "vimdoc", "javascript", "c", "lua",
                "jsdoc", "bash", "go", "python", "html",
            }
            ts.install(langs)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = langs,
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
