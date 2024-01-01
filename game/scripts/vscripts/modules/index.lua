local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["14"] = 16,["15"] = 17,["16"] = 19,["17"] = 21,["18"] = 23,["20"] = 16});
local ____exports = {}
local ____Debug = require("modules.Debug")
local Debug = ____Debug.Debug
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____xnet_2Dtable = require("modules.xnet-table")
local XNetTable = ____xnet_2Dtable.XNetTable
--- 这个方法会在game_mode实体生成之后调用，且仅调用一次
-- 因此在这里作为单例模式使用
function ____exports.ActivateModules(self)
    if GameRules.XNetTable == nil then
        GameRules.XNetTable = __TS__New(XNetTable)
        __TS__New(GameConfig)
        __TS__New(Debug)
    end
end
return ____exports
