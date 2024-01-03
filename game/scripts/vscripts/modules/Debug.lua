local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 3,["14"] = 4,["15"] = 3,["17"] = 5,["18"] = 7,["19"] = 13,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 11,["26"] = 17,["27"] = 18,["28"] = 20,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 28,["35"] = 30,["36"] = 31,["38"] = 36,["41"] = 39,["42"] = 40,["43"] = 41,["44"] = 42,["45"] = 42,["46"] = 42,["47"] = 42,["48"] = 42,["50"] = 45,["51"] = 46,["52"] = 47,["53"] = 48,["54"] = 48,["55"] = 48,["56"] = 48,["57"] = 48,["59"] = 17,["60"] = 3,["61"] = 4});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
____exports.Debug = __TS__Class()
local Debug = ____exports.Debug
Debug.name = "Debug"
function Debug.prototype.____constructor(self)
    self.DebugEnabled = false
    self.OnlineDebugWhiteList = {136407523}
    self.DebugEnabled = IsInToolsMode()
    ListenToGameEvent(
        "player_chat",
        function(____, keys) return self:OnPlayerChat(keys) end,
        self
    )
end
function Debug.prototype.OnPlayerChat(self, keys)
    local steamid = PlayerResource:GetSteamAccountID(keys.playerid)
    if not __TS__ArrayIncludes(self.OnlineDebugWhiteList, steamid) then
        return
    end
    local strs = __TS__StringSplit(keys.text, " ")
    local cmd = strs[1]
    local args = __TS__ArraySlice(strs, 1)
    print((((((((("[DEBUG] " .. tostring(steamid)) .. " ") .. tostring(keys.playerid)) .. " ") .. tostring(keys.teamonly)) .. " ") .. tostring(keys.userid)) .. " ") .. keys.text)
    if cmd == "-debug" then
        self.DebugEnabled = not self.DebugEnabled
    end
    if not self.DebugEnabled then
        return
    end
    if __TS__StringStartsWith(cmd, "get_key_v3") then
        local version = args[1]
        local key = GetDedicatedServerKeyV3(version)
        Say(
            HeroList:GetHero(0),
            (version .. ": ") .. key,
            false
        )
    end
    if __TS__StringStartsWith(cmd, "get_key_v2") then
        local version = args[1]
        local key = GetDedicatedServerKeyV2(version)
        Say(
            HeroList:GetHero(0),
            (version .. ": ") .. key,
            false
        )
    end
end
Debug = __TS__Decorate({reloadable}, Debug)
____exports.Debug = Debug
return ____exports
