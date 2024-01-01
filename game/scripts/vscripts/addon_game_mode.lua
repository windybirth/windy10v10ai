local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 6,["19"] = 6,["20"] = 6,["21"] = 6});
local ____exports = {}
require("utils.index")
require("ai_game_mode")
local ____modules = require("modules.index")
local ActivateModules = ____modules.ActivateModules
local ____precache = require("utils.precache")
local Precache = ____precache.default
__TS__ObjectAssign(
    getfenv(),
    {
        Activate = function()
            ActivateModules(nil)
            AIGameMode:InitGameMode()
        end,
        Precache = Precache
    }
)
return ____exports
