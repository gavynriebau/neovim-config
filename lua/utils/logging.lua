local M = {}

M.enable = function(enable)
    _G.enable_logging = enable
end

_G.log = function(msg)
    if not _G.enable_logging then
        return
    end
    --vim.fn.system(string.format("echo '%s - %s' >> /tmp/test.log", os.date(), msg))
    print(string.format("echo '%s - %s' >> /tmp/test.log", os.date(), msg))
end

return M
