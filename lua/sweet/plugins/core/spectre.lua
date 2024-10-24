return {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
}

-- return {
--     "MagicDuck/grug-far.nvim",
--     config = function()
--         require("grug-far").setup({
--             -- options, see Configuration section below
--             -- there are no required options atm
--             -- engine = 'ripgrep' is default, but 'astgrep' can be specified
--         })
--     end,
--
--     keys = {
--         {
--             "<leader>sr",
--             function()
--                 require("grug-far").open()
--             end,
--             desc = "Replace in files (grug)",
--         },
--     },
-- }
