require("sweet.core.keymaps")
require("sweet.core.options")
-- require("lua.current-theme")

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("ziggy", {}),
    pattern = "ziggy",
    callback = function()
        vim.lsp.start({
            name = "Ziggy LSP",
            cmd = { "ziggy", "lsp" },
            root_dir = vim.loop.cwd(),
            flags = { exit_timeout = 1000 },
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("ziggy_schema", {}),
    pattern = "ziggy_schema",
    callback = function()
        vim.lsp.start({
            name = "Ziggy LSP",
            cmd = { "ziggy", "lsp", "--schema" },
            root_dir = vim.loop.cwd(),
            flags = { exit_timeout = 1000 },
        })
    end,
})
