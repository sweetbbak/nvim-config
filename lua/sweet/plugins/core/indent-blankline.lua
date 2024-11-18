-- indent guides for Neovim
-- return {
--     "lukas-reineke/indent-blankline.nvim",
--     opts = {
--         indent = {
--             -- char = "│",
--             -- tab_char = "│",
--             char = "┋",
--             tab_char = "┋",
--             smart_indent_cap = true,
--         },
--         scope = { enabled = false },
--         exclude = {
--             filetypes = {
--                 "help",
--                 "alpha",
--                 "dashboard",
--                 "neo-tree",
--                 "Trouble",
--                 "trouble",
--                 "lazy",
--                 "mason",
--                 "notify",
--                 "toggleterm",
--                 "lazyterm",
--             },
--         },
--     },
--     main = "ibl",
-- }

return {
    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        -- event = "Lazy",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
                smart_indent_cap = true,
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
        main = "ibl",
    },

    -- Active indent guide and indent text objects. When you're browsing
    -- code, this highlights the current level of indentation, and animates
    -- the highlighting.
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
}
