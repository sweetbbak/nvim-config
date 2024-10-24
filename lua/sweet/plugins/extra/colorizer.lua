return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    -- config = true,
    config = function()
        -- Attaches to every FileType mode
        -- require("colorizer").setup()
        require("colorizer").setup({
            names = false, -- ignore color names
        })
    end,
}
