return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
            keymap.set("n", "gt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show global diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics severity_bound=ERROR<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- deprecaated
        -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        -- for type, icon in pairs(signs) do
        --     local hl = "DiagnosticSign" .. type
        --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        -- end
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.INFO] = "󰋼 ",
                    [vim.diagnostic.severity.HINT] = "󰌵 ",
                },
                texthl = {
                    [vim.diagnostic.severity.ERROR] = "Error",
                    [vim.diagnostic.severity.WARN] = "Error",
                    [vim.diagnostic.severity.HINT] = "Hint",
                    [vim.diagnostic.severity.INFO] = "Info",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
        })
        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure typescript server with plugin
        lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "bash-language-server", "start" },
            filetypes = { "sh", "zsh", "shell" },
        })

        lspconfig["asm_lsp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "s", "asm", "S" },
            cmd = { "asm-lsp" },
        })

        lspconfig["nixd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            -- cmd = { "nixd-next" },
        })

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "clangd", "--enable-config" },
        })

        lspconfig["cmake"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["gdscript"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure svelte server
        -- lspconfig["svelte"].setup({
        --   capabilities = capabilities,
        --   on_attach = function(client, bufnr)
        --     on_attach(client, bufnr)
        --
        --     vim.api.nvim_create_autocmd("BufWritePost", {
        --       pattern = { "*.js", "*.ts" },
        --       callback = function(ctx)
        --         if client.name == "svelte" then
        --           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
        --         end
        --       end,
        --     })
        --   end,
        -- })
        --
        -- -- configure prisma orm server
        -- lspconfig["prismals"].setup({
        --   capabilities = capabilities,
        --   on_attach = on_attach,
        -- })
        --
        -- -- configure graphql language server
        -- lspconfig["graphql"].setup({
        --   capabilities = capabilities,
        --   on_attach = on_attach,
        --   filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        -- })

        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            -- filetypes = { "go" },
        })
        -- god damn ZLS is annoying af. It completely shits itself when there is any error no matter how stupid
        vim.g.zig_fmt_autosave = 0
        lspconfig["zls"].setup({
            -- on_attach = function(client, bufnr)
            -- client.resolved_capabilities.document_formatting = false
            -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
            -- end,
            capabilities = capabilities,
            on_attach = on_attach,
            -- log_level = vim.lsp.protocol.MessageType.Log,
            -- message_level = vim.lsp.protocol.MessageType.Log,
            -- cmd = {
            --     "zls",
            --     "--enable-debug-log",
            -- },

            -- on_attach = function(client, bufnr)
            --     on_attach(client, bufnr)
            --
            --     vim.api.nvim_create_autocmd("BufWritePost", {
            --         pattern = { "*.zig", "*.zon" },
            --         callback = function(ctx)
            --             if client.name == "zls" then
            --             end
            --         end,
            --     })
            -- end,
            settings = {
                zls = {
                    enable_snippets = true,
                    enable_build_on_save = true,
                    -- enable_autofix = true,
                    operator_completions = true,
                    include_at_in_builtins = true,
                    use_comptime_interpreter = true,
                },
            },
        })

        -- lspconfig["java-language-server"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     -- filetypes = { "go" },
        -- })

        -- configure python server
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["csharp_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure python server
        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            -- settings = {
            --     ["rust-analyzer"] = {
            --         check = {
            --             extraArgs = { "-r" },
            --         },
            --     },
            -- },
        })

        -- lspconfig["nil_ls"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
