return {
    "chrisgrieser/nvim-scissors",
    opts = {
        snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },

    dependencies = { "nvim-telescope/telescope.nvim", "L3MON4D3/LuaSnip" },

    config = function()
        -- default settings
        require("scissors").setup({
            snippetDir = vim.fn.stdpath("config") .. "/snippets",
            editSnippetPopup = {
                height = 0.4, -- relative to the window, number between 0 and 1
                width = 0.6,
                border = "rounded",
                keymaps = {
                    cancel = "q",
                    saveChanges = "<CR>", -- alternatively, can also use `:w`
                    goBackToSearch = "<BS>",
                    deleteSnippet = "<C-BS>",
                    duplicateSnippet = "<C-d>",
                    openInFile = "<C-o>",
                    insertNextPlaceholder = "<C-t>", -- insert & normal mode
                    -- jumpBetweenBodyAndPrefix = "<C-Tab>", -- insert & normal mode
                },
            },
            snippetSelection = {
                telescope = {
                    -- By default, the query only searches snippet prefixes. Set this to
                    -- `true` to also search the body of the snippets.
                    alsoSearchSnippetBody = true,
                },
            },
            -- `none` writes as a minified json file using `vim.encode.json`.
            -- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
            -- you version control your snippets.
            jsonFormatter = "jq", -- "yq"|"jq"|"none"
        })
    end,
}
