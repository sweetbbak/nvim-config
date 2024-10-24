-- a neat color picker for more in depth color operations
return {
    { "nvchad/volt", lazy = true },
    {
        "nvchad/minty",
        cmd = { "Shades", "Huefy" },
    },
    -- a nice little right click menu
    { "nvchad/menu", lazy = true },
    -- Keyboard users
    vim.keymap.set("n", "<C-t>", function()
        require("menu").open("default")
    end, {}),

    -- mouse users + nvimtree users!
    vim.keymap.set("n", "<RightMouse>", function()
        vim.cmd.exec('"normal! \\<RightMouse>"')

        local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
        require("menu").open(options, { mouse = true })
    end, {}),
}
