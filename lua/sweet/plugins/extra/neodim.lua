return {
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function()
        require("neodim").setup({
            alpha = 0.75,
            blend_color = "#1e1e1e",
            hide = {
                underline = true,
                virtual_text = true,
                -- signs = true, -- disable sign decorations for 'unused' diagnostics
                signs = false, -- re-enable sign decorations for 'unused' diagnostics
            },
            regex = {
                "[uU]nused",
                "[nN]ever [rR]ead",
                "[nN]ot [rR]ead",
                "[nN]ot [uU]sed",
            },
            priority = 128,
            disable = {},
            -- disable `regex` option when filetype is "rust"
            -- rust = {},
        })
    end,
}
