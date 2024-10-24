return {
    "andrew-george/telescope-themes",
    config = function()
        require("telescope").load_extension("themes")
    end,
}
-- -- return {
--     "lrangell/theme-cycler.nvim",
--     -- config = function()
--     -- local themer = require("themeCycler").setup()
--     require("theme-cycler").setup(),
--     -- end,
-- }
