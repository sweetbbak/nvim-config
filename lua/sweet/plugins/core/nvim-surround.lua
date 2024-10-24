return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    -- config = true,
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                insert = "<C-g>s",
                insert_line = "<C-g>S",
                normal = "ms",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "ms",
                visual_line = "mS",
                delete = "ds",
                change = "cs",
                change_line = "cS",
            },
        })
    end,
}

-- return {
--     "echasnovski/mini.surround",
--     opts = {
--         mappings = {
--             add = "ms",
--             delete = "msd",
--             find = "msf",
--             find_left = "msF",
--             highlight = "msh",
--             replace = "msr",
--             update_n_lines = "msn",
--         },
--     },
-- }
