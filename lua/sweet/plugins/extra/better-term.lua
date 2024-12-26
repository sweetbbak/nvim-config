-- return {
--     "CRAG666/betterTerm.nvim",
--     opts = {
--         position = "bot",
--         size = 15,
--     },
--
--     vim.keymap.set({ "n", "t" }, "<C-;>", function()
--         local betterTerm = require("betterTerm")
--         betterTerm.open()
--     end, { desc = "Open terminal" }),
-- }

return {
    "NvChad/nvterm",
    config = function()
        require("nvterm").setup({
            terminals = {
                shell = vim.o.shell,
                list = {},
                type_opts = {
                    float = {
                        relative = "editor",
                        -- defaults:
                        -- row = 0.3,
                        -- col = 0.25,
                        -- width = 0.5,
                        -- height = 0.4,

                        row = 0.20,
                        col = 0.14,
                        width = 0.69,
                        height = 0.57,
                        border = "none",
                    },
                    horizontal = { location = "rightbelow", split_ratio = 0.5 },
                    vertical = { location = "rightbelow", split_ratio = 0.5 },
                },
            },
            behavior = {
                autoclose_on_quit = {
                    enabled = false,
                    confirm = true,
                },
                close_on_exit = true,
                auto_insert = true,
            },
        })

        local keymap = vim.keymap -- for conciseness

        -- keymap.set({ "n", "t" }, "<C-;>", function()
        --     require("nvterm.terminal").toggle("float")
        -- end, { desc = "Open terminal floating" })

        keymap.set({ "n", "t" }, "<A-i>", function()
            require("nvterm.terminal").toggle("vertical")
        end, { desc = "Open terminal floating" })

        keymap.set({ "n", "t" }, "<A-u>", function()
            require("nvterm.terminal").toggle("horizontal")
        end, { desc = "Open terminal floating" })

        keymap.set({ "n" }, "<leader>oz", function()
            require("nvterm.terminal").send("zig build")
        end, { desc = "Open terminal execute zig build" })

        keymap.set({ "n" }, "<leader>oj", function()
            require("nvterm.terminal").send("just")
        end, { desc = "Open terminal execute just" })

        local ft_cmds = {
            python = "python3 " .. vim.fn.expand("%"),
            bash = "bash " .. vim.fn.expand("%"),
            go = "go run " .. vim.fn.expand("%"),
            zig = "zig build",
        }

        keymap.set({ "n" }, "<leader>of", function()
            require("nvterm.terminal").send(ft_cmds[vim.bo.filetype])
        end, { desc = "Open terminal detect filetype" })
    end,
}

-- require("nvterm.terminal").toggle "float"
-- require("nvterm.terminal").toggle "horizontal"
-- require("nvterm.terminal").toggle "vertical"
