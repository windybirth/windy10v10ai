local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 10,["23"] = 15,["24"] = 2});
local ____exports = {}
____exports.Helper = __TS__Class()
local Helper = ____exports.Helper
Helper.name = "Helper"
function Helper.prototype.____constructor(self)
end
function Helper.IsHumanPlayer(self, npc)
    if npc:IsRealHero() then
        if npc:GetPlayerOwnerID() >= 0 then
            local player = PlayerResource:GetPlayer(npc:GetPlayerOwnerID())
            if player then
                local steamAccountID = PlayerResource:GetSteamAccountID(npc:GetPlayerOwnerID())
                if steamAccountID > 0 then
                    return true
                end
            end
        end
    end
    return false
end
return ____exports
