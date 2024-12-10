return {
    "hrsh7th/nvim-cmp",
    -- "iguanacucumber/magazine.nvim",
    -- name = "nvim-cmp", -- Otherwise highlighting gets messed up

    event = "InsertEnter",
    dependencies = {
        -- "ray-x/lsp_signature.nvim",
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip", -- snippet engine
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },

    config = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
        })

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
                -- completeopt = "menu,menuone,preview",
                -- completeopt = "menu,menuone,noselect",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            preselect = { cmp.PreselectMode.None },
            mapping = cmp.mapping.preset.insert({
                -- nvchad
                -- ["<CR>"] = cmp.mapping.confirm({
                --     behavior = cmp.ConfirmBehavior.Insert,
                --     select = true,
                -- }),

                ["<CR>"] = cmp.mapping.confirm({ select = false }),

                -- -- use tab for LSP and snippet completions
                -- ["<Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                --     elseif require("luasnip").expand_or_jumpable() then
                --         require("luasnip").expand_or_jump()
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" }),
                --
                -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                --     elseif require("luasnip").jumpable(-1) then
                --         require("luasnip").jump(-1)
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" }),

                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),

                ["<C-j>"] = cmp.mapping.scroll_docs(-4),
                ["<C-k>"] = cmp.mapping.scroll_docs(4),

                -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                -- ["<C-f>"] = cmp.mapping.scroll_docs(4),

                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window

                ["<S-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,

                --     ["<C-j>"] = cmp.mapping(function(fallback)
                --         if cmp.visible() then
                --             cmp.select_next_item()
                --         elseif require("luasnip").expand_or_jumpable() then
                --             require("luasnip").expand_or_jump()
                --         else
                --             fallback()
                --         end
                --     end, { "i", "s" }),
                --
                --     ["<C-k>"] = cmp.mapping(function(fallback)
                --         if cmp.visible() then
                --             cmp.select_prev_item()
                --         elseif require("luasnip").jumpable(-1) then
                --             require("luasnip").jump(-1)
                --         else
                --             fallback()
                --         end
                --     end, { "i", "s" }),
            }),

            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp", group_index = 1, keyword_length = 1, priority_weight = 1 },
                { name = "luasnip", group_index = 1, max_view_entries = 2 }, -- snippets
                { name = "nvim_lua", group_index = 3 },
                { name = "buffer", group_index = 3, max_view_entries = 2 }, -- text within current buffer
                { name = "path", group_index = 3, max_view_entries = 1 }, -- file system paths
            }),

            -- `:` cmdline setup.
            -- cmp.setup.cmdline(":", {
            --     mapping = cmp.mapping.preset.cmdline({
            --         ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            --         ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            --     }),
            --     sources = cmp.config.sources({
            --         { name = "nvim_lsp" },
            --         { name = "path" },
            --     }, {
            --         { name = "cmdline" },
            --         { name = "buffer" },
            --     }),
            -- }),

            experimental = {
                ghost_text = {
                    hl_group = "CmpGhostText",
                },
            },

            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                    -- snippets
                    {
                        "L3MON4D3/LuaSnip",
                        dependencies = {
                            {
                                "rafamadriz/friendly-snippets",
                                config = function()
                                    require("luasnip.loaders.from_vscode").lazy_load()
                                end,
                            },
                            {
                                "nvim-cmp",
                                dependencies = {
                                    "saadparwaiz1/cmp_luasnip",
                                },
                                opts = function(_, opts)
                                    opts.snippet = {
                                        expand = function(args)
                                            require("luasnip").lsp_expand(args.body)
                                        end,
                                    }
                                    table.insert(opts.sources, { name = "luasnip" })
                                end,
                            },
                        },
                        opts = {
                            history = true,
                            delete_check_events = "TextChanged",
                        },

                        -- stylua: ignore
                        keys = {
                          -- {
                          --   "<C-j>",
                          --   function()
                          --     return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
                          --   end,
                          --   expr = true, silent = true, mode = "i",
                          -- },
                          -- { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
                          -- { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
                          { "<C-j>", function() require("luasnip").jump(1) end, mode = { "i", "s" } },
                          { "<C-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
                          { "<C-n>", function() require("luasnip").jump(1) end, mode = { "i", "s" } },
                          { "<C-p>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
                        },
                    },
                }),
            },
        })
    end,
}
