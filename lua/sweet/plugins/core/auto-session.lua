return {
    {
        "rmagatti/auto-session",
        config = function()
            local auto_session = require("auto-session")

            auto_session.setup({
                auto_restore_enabled = false,
                auto_save_enabled = true,
                auto_session_allowed_dirs = { "~/dev", "~/src", "~/.config", "~/pkgs", "~/arch" },
                auto_session_suppress_dirs = { "~/Downloads", "~/Documents", "~/Desktop/" },
            })

            local keymap = vim.keymap

            keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session" }) -- restore last workspace session for current directory
            keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session" }) -- save workspace session for current working directory
            keymap.set("n", "<leader>ww", "<cmd>SessionSearch<CR>", { desc = "Search for sessions" }) -- save workspace session for current working directory
        end,
    },
    {
        "gennaro-tedesco/nvim-possession",
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        config = true,
        init = function()
            local possession = require("nvim-possession")
            vim.keymap.set("n", "<leader>sl", function()
                possession.list()
            end)
            vim.keymap.set("n", "<leader>sn", function()
                possession.new()
            end)
            vim.keymap.set("n", "<leader>su", function()
                possession.update()
            end)
            vim.keymap.set("n", "<leader>sd", function()
                possession.delete()
            end)
        end,
    },
}
