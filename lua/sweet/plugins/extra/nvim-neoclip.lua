return {
    "AckslD/nvim-neoclip.lua",
    requires = {
        { "kkharji/sqlite.lua", module = "sqlite" },
        { "nvim-telescope/telescope.nvim" },
    },
    config = function()
        require("neoclip").setup()
    end,
    vim.keymap.set("n", "<leader>fn", "<cmd>Telescope neoclip<cr>", { desc = "Clipboard manager" }),
    vim.keymap.set("n", "<leader>fm", "<cmd>Telescope macroscope<cr>", { desc = "Fzf macros" }), -- OR :lua require('telescope').extensions.macroscope.default()
}
