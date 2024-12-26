return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                nix = { "alejandra" },
                asm = { "asmfmt" },
                nasm = { "asmfmt" },
                ziggy = { "ziggy" },
                ziggy_schema = { "ziggy_schema" },
            },
            formatters = {
                ziggy = {
                    inherit = false,
                    command = "ziggy",
                    stdin = true,
                    args = { "fmt", "--stdin" },
                },
                ziggy_schema = {
                    inherit = false,
                    command = "ziggy",
                    stdin = true,
                    args = { "fmt", "--stdin-schema" },
                },
            },

            -- format_on_save = {
            format_on_save = function(bufnr)
                -- Disable autoformat on certain filetypes
                local ignore_filetypes = { "sql", "java", "sh", "zsh", "zig" }
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    return
                end
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                -- Disable autoformat for files in a certain path
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname:match("/node_modules/") then
                    return
                end
                -- ...additional logic...
                return { timeout_ms = 750, lsp_format = "fallback", async = false }
            end,
            -- lsp_fallback = true,
            -- async = false,
            -- timeout_ms = 1000,
            -- },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
