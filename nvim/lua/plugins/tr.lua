return {
    "xiaozhang1990/translate",
    -- enabled = false,
    config = function()
        require("translate").setup({
            keymaps = {
                ['tt'] = "local_translation",
                ['to'] = "online_translation",
                ['ts'] = "sound",
            }
        })
    end
}
