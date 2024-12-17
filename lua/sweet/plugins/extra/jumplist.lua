-- return {
--     "Rex-Sanchez/jumplist.nvim",
--     config = function()
--         local j = require("jumplist").setup({})
--         vim.keymap.set("n", "<leader>ji", function()
--             j:add_to_jump_list()
--         end)
--         vim.keymap.set("n", "<leader>jj", function()
--             j:picker()
--         end)
--     end,
-- }

---@type LazyPluginSpec
return {
    dir = "/home/sweet/dev/jump.nvim",
    -- import = "/home/sweet/dev/jump.nvim",
    config = function()
        -- local j = require("jumplist").setup({})
        -- local j = require("jump.nvim").setup({})
        -- local j = require("/home/sweet/dev/jump.nvim/lua/jump/init.lua").setup({})
        local j = require("jump").setup({})
        vim.keymap.set("n", "<leader>ji", function()
            j:add_to_jump_list()
        end)
        vim.keymap.set("n", "<leader>jj", function()
            j:picker()
        end)
    end,
}
