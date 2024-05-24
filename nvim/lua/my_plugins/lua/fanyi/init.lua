local default_config = require("fanyi.conf")
local M = {}
M.info = "hello lua"
function M.setup(opt)
    vim.notify("setup run")
    vim.print(default_config)
    vim.print(opt)
    -- code
    local conf = vim.tbl_deep_extend("force", default_config, opt or {})
    vim.print(conf)
end

return M
