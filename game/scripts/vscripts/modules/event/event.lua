local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["19"] = 7,["20"] = 7,["21"] = 9,["22"] = 9,["23"] = 9,["24"] = 9,["25"] = 9,["26"] = 6,["27"] = 12,["28"] = 13,["29"] = 16,["30"] = 17,["31"] = 18,["32"] = 19,["35"] = 12,["36"] = 24,["37"] = 25,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 27,["42"] = 26,["43"] = 26,["46"] = 32,["47"] = 33,["50"] = 37,["51"] = 39,["52"] = 40,["53"] = 41,["56"] = 24});
local ____exports = {}
local ____player = require("api.player")
local Player = ____player.Player
local ____helper = require("modules.helper.helper")
local Helper = ____helper.Helper
local ____property_controller = require("modules.property.property_controller")
local PropertyController = ____property_controller.PropertyController
____exports.Event = __TS__Class()
local Event = ____exports.Event
Event.name = "Event"
function Event.prototype.____constructor(self)
    ListenToGameEvent(
        "dota_player_gained_level",
        function(____, keys) return self:OnPlayerLevelUp(keys) end,
        self
    )
    ListenToGameEvent(
        "npc_spawned",
        function(____, keys) return self:OnNpcSpawned(keys) end,
        self
    )
end
function Event.prototype.OnPlayerLevelUp(self, keys)
    local hero = EntIndexToHScript(keys.hero_entindex)
    if Helper:IsHumanPlayer(hero) then
        if keys.level % PropertyController.HERO_LEVEL_PER_POINT == 1 then
            print("[Event] OnPlayerLevelUp SetPlayerProperty " .. hero:GetUnitName())
            Player:SetPlayerProperty(hero)
        end
    end
end
function Event.prototype.OnNpcSpawned(self, keys)
    if GameRules:State_Get() < DOTA_GAMERULES_STATE_PRE_GAME then
        Timers:CreateTimer(
            1,
            function()
                self:OnNpcSpawned(keys)
            end
        )
        return
    end
    local npc = EntIndexToHScript(keys.entindex)
    if not npc then
        return
    end
    if keys.is_respawn == 0 then
        if Helper:IsHumanPlayer(npc) then
            print("[Event] OnNpcSpawned SetPlayerProperty " .. npc:GetUnitName())
            Player:SetPlayerProperty(npc)
        end
    end
end
return ____exports
