return {
    "t-troebst/perfanno.nvim",
    config = function()
        local perfanno = require("perfanno")
        local util = require("perfanno.util")

        local bgcolor = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "gui")

        perfanno.setup({
            -- Creates a 10-step RGB color gradient beween bgcolor and "#CC3300"
            -- line_highlights = util.make_bg_highlights(bgcolor, "#CC3300", 10),
            -- vt_highlight = util.make_fg_highlight("#CC3300"),
        })

        local telescope = require("telescope")
        local actions = telescope.extensions.perfanno.actions
        telescope.setup({
            extensions = {
                perfanno = {
                    -- Special mappings in the telescope finders
                    mappings = {
                        ["i"] = {
                            -- Find hottest callers of selected entry
                            ["<C-h>"] = actions.hottest_callers,
                            -- Find hottest callees of selected entry
                            ["<C-l>"] = actions.hottest_callees,
                        },

                        ["n"] = {
                            ["gu"] = actions.hottest_callers,
                            ["gd"] = actions.hottest_callees,
                        },
                    },
                },
            },
        })

        local keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        keymap("n", "<LEADER>plf", ":PerfLoadFlat<CR>", opts)
        keymap("n", "<LEADER>plg", ":PerfLoadCallGraph<CR>", opts)
        keymap("n", "<LEADER>plo", ":PerfLoadFlameGraph<CR>", opts)

        keymap("n", "<LEADER>pe", ":PerfPickEvent<CR>", opts)

        keymap("n", "<LEADER>px", ":PerfAnnotate<CR>", opts)
        keymap("n", "<LEADER>pf", ":PerfAnnotateFunction<CR>", opts)
        keymap("v", "<LEADER>px", ":PerfAnnotateSelection<CR>", opts)

        keymap("n", "<LEADER>pt", ":PerfToggleAnnotations<CR>", opts)

        keymap("n", "<LEADER>ph", ":PerfHottestLines<CR>", opts)
        keymap("n", "<LEADER>ps", ":PerfHottestSymbols<CR>", opts)
        keymap("n", "<LEADER>pc", ":PerfHottestCallersFunction<CR>", opts)
        keymap("v", "<LEADER>pc", ":PerfHottestCallersSelection<CR>", opts)
    end,
}
