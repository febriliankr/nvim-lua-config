local M = {}

function M.config()
    require("config.lsp.langserver")
    require("config.lsp.diagnostic")
    require("config.lsp.nulls")
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
