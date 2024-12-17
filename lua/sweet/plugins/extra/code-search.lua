return {
    "napisani/nvim-github-codesearch",
    build = "nix-shell && make && echo",
    config = function()
        local gh_search = require("nvim-github-codesearch")
        gh_search.setup({
            -- an optional table entry to explicitly configure the API key to use for Github API requests.
            -- alternatively, you can configure this parameter by export an environment variable named "GITHUB_AUTH_TOKEN"

            -- this table entry is optional, if not provided "https://api.github.com" will be used by default
            -- otherwise this parameter can be used to configure a different Github API URL.
            github_api_url = "https://api.github.com",

            -- whether to use telescope to display the github search results or not
            use_telescope = true,
        })
    end,

    vim.keymap.set("n", "<leader>cs", function()
        local gh_search = require("nvim-github-codesearch")
        -- this will display a prompt to enter search terms
        gh_search.prompt()

        -- this will submit a search for the designated query without displaying a prompt
        -- gh_search.search("some query")

        -- removes any temp files created by nvim-github-codesearch
        -- gh_search.cleanup()
    end, { desc = "Github code search" }), -- close current split window
}
