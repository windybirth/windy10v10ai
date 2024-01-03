local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["18"] = 18,["19"] = 19,["20"] = 21,["21"] = 23,["22"] = 25,["23"] = 27,["24"] = 29,["26"] = 18});
local ____exports = {}
local ____Debug = require("modules.Debug")
local Debug = ____Debug.Debug
local ____GameConfig = require("modules.GameConfig")
local GameConfig = ____GameConfig.GameConfig
local ____event = require("modules.event.event")
local Event = ____event.Event
local ____property_controller = require("modules.property.property_controller")
local PropertyController = ____property_controller.PropertyController
local ____xnet_2Dtable = require("modules.xnet-table")
local XNetTable = ____xnet_2Dtable.XNetTable
--- 这个方法会在game_mode实体生成之后调用，且仅调用一次
-- 因此在这里作为单例模式使用
function ____exports.ActivateModules(self)
    if GameRules.XNetTable == nil then
        GameRules.XNetTable = __TS__New(XNetTable)
        __TS__New(GameConfig)
        __TS__New(Debug)
        __TS__New(Event)
        __TS__New(PropertyController)
    end
end
return ____exports
