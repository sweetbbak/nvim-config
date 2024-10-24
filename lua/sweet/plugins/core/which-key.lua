-- return {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   init = function()
--     vim.o.timeout = true
--     vim.o.timeoutlen = 165
--   end,
--   opts = {
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     -- refer to the configuration section below
--   },
-- }
return {
    "folke/which-key.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
        { "echasnovski/mini.icons", version = false },
    },

    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        preset = "helix",
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = true })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
