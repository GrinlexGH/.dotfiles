return {
    "akinsho/bufferline.nvim",
    ---@module "bufferline"
    ---@type bufferline.Config
    opts = {
        options = {
            mode = "tabs",
            seporator_style = "slant",
            custom_filter = function(buf_number)
                local exclude_ft = { "NvimTree", "trouble" }
                return not vim.tbl_contains(exclude_ft, vim.bo[buf_number].filetype)
            end
        },
    },
}
