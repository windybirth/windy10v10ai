local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 3,["11"] = 2});
local ____exports = {}
____exports.GameConfig = __TS__Class()
local GameConfig = ____exports.GameConfig
GameConfig.name = "GameConfig"
function GameConfig.prototype.____constructor(self)
    SendToServerConsole("dota_max_physical_items_purchase_limit 9999")
end
return ____exports
