return {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require("xcodebuild").setup({
            -- put some options here or leave it empty to use default settings
            integrations = {
                xcodebuild_offline = {
                    enabled = true,
                }
            }
        })
    end,
}
