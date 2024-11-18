return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            require("nvim-treesitter.parsers").get_parser_configs().brainfuck = {
                install_info = {
                    url = "https://github.com/hrmorley34/tree-sitter-brainfuck",
                    files = { "src/parser.c" },
                },
                filetype = "b",
            }

            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                },
                -- enable indentation
                -- indent = { enable = true },
                indent = { enable = false },
                -- enable autotagging (w/ nvim-ts-autotag plugin)
                autotag = {
                    enable = true,
                },
                -- ensure these language parsers are installed
                ensure_installed = {
                    "json",
                    "go",
                    "gomod",
                    "gowork",
                    "gosum",
                    "bash",
                    "lua",
                    "nix",
                    "dockerfile",
                    "vim",
                    "query",
                    "gitignore",
                    "javascript",
                    "typescript",
                    "tsx",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "zig",
                },
                rainbow = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })

            -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
            require("ts_context_commentstring").setup({})
        end,
    },
}
