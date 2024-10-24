return {
    "RaafatTurki/hex.nvim",
    config = function()
        require("hex").setup({
            dump_cmd = "xxd -g 1 -u",
            -- dump_cmd = "hexxy",
            --
            -- logic that determines if a buffer contains binary data or not
            -- must return a bool
            is_buf_binary_pre_read = function()
                -- return false
                if vim.bo.bin then
                    return true
                end
                return false

                -- local binary_ext = { "out", "bin", "png", "jpg", "jpeg", "exe", "dll" }
                --
                -- local ext = vim.fn.expand("%:e")
                --
                -- if vim.tbl_contains(binary_ext, ext) then
                --     return true
                -- end

                -- return false

                -- only work on normal buffers
                -- if vim.bo.ft ~= "" then
                --     return false
                -- end
                -- check -b flag
                -- if vim.bo.bin then
                --     return true
                -- end
                -- check ext within binary_ext
                -- local filename = vim.fn.expand("%:t")

                -- none of the above
                -- return false
            end,

            is_file_binary_post_read = function()
                local encoding = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
                return false
                -- if encoding ~= "utf-8" then
                --     return true
                -- end
                -- return false
            end,
        })
    end,
}
