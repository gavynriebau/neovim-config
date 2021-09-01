local M = {}

M.enable = function(enable)
    _G.enable_logging = enable
end

_G.log = function(msg)
    if not _G.enable_logging then
        return
    end
    print(string.format("echo '%s - %s'", os.date(), msg))
end

return M
