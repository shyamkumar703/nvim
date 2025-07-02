return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true
            }
        })
        require('mini.icons').setup({ style = 'ascii' })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
