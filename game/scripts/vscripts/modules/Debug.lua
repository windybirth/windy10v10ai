local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 4,["14"] = 3,["16"] = 5,["17"] = 7,["18"] = 13,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 11,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 21,["30"] = 23,["31"] = 24,["32"] = 25,["35"] = 31,["38"] = 34,["39"] = 35,["40"] = 36,["41"] = 37,["42"] = 37,["43"] = 37,["44"] = 37,["45"] = 37,["47"] = 40,["48"] = 41,["49"] = 42,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 43,["56"] = 17,["57"] = 3,["58"] = 4});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
____exports.Debug = __TS__Class()
local Debug = ____exports.Debug
Debug.name = "Debug"
function Debug.prototype.____constructor(self)
    self.DebugEnabled = false
    self.OnlineDebugWhiteList = {86815341}
    self.DebugEnabled = IsInToolsMode()
    ListenToGameEvent(
        "player_chat",
        function(____, keys) return self:OnPlayerChat(keys) end,
        self
    )
end
function Debug.prototype.OnPlayerChat(self, keys)
    local strs = __TS__StringSplit(keys.text, " ")
    local cmd = strs[1]
    local args = __TS__ArraySlice(strs, 1)
    local steamid = PlayerResource:GetSteamAccountID(keys.playerid)
    if cmd == "-debug" then
        if __TS__ArrayIncludes(self.OnlineDebugWhiteList, steamid) then
            self.DebugEnabled = not self.DebugEnabled
        end
    end
    if not self.DebugEnabled then
        return
    end
    if cmd == "get_key_v3" then
        local version = args[1]
        local key = GetDedicatedServerKeyV3(version)
        Say(
            HeroList:GetHero(0),
            (version .. ": ") .. key,
            true
        )
    end
    if cmd == "get_key_v2" then
        local version = args[1]
        local key = GetDedicatedServerKeyV2(version)
        Say(
            HeroList:GetHero(0),
            (version .. ": ") .. key,
            true
        )
    end
end
Debug = __TS__Decorate({reloadable}, Debug)
____exports.Debug = Debug
return ____exports
