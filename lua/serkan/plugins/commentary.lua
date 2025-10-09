return {
    "numToStr/Comment.nvim",
    event = { "bufreadpre", "bufnewfile" },
    config = function()
        require("Comment").setup({
            toggler = {
                line = "cm",
                block = "mc",
            },
            opleader = {
                line = "cm",
                block = "mc",
            },
            extra = {
                above = "cO",
                below = "co",
                eol = "cA",
            },
        })
    end,
}
