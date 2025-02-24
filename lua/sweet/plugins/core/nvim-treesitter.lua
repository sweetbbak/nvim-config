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
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.ziggy = {
                install_info = {
                    url = "https://github.com/kristoff-it/ziggy", -- local path or git repo
                    includes = { "tree-sitter-ziggy/src" },
                    files = { "tree-sitter-ziggy/src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
                    -- optional entries:
                    branch = "main", -- default branch in case of git repo if different from master
                    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
                    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
                },
            }

            parser_config.ziggy_schema = {
                install_info = {
                    url = "https://github.com/kristoff-it/ziggy", -- local path or git repo
                    files = { "tree-sitter-ziggy-schema/src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
                    -- optional entries:
                    branch = "main", -- default branch in case of git repo if different from master
                    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
                    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
                },
                filetype = "ziggy-schema",
            }

            vim.filetype.add({
                extension = {
                    ziggy = "ziggy",
                    ["ziggy-schema"] = "ziggy_schema",
                },
            })

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
                    "gdscript",
                    "bash",
                    "lua",
                    "nix",
                    "dockerfile",
                    "vim",
                    "vimdoc",
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
                    "ziggy",
                    "ziggy_schema",
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
