local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 6,["6"] = 12,["7"] = 12,["8"] = 13,["10"] = 14,["11"] = 14,["12"] = 15,["14"] = 16,["16"] = 14,["18"] = 12,["19"] = 19,["20"] = 36,["21"] = 36,["22"] = 36,["23"] = 36,["24"] = 36,["25"] = 36,["26"] = 36,["27"] = 36,["28"] = 36,["29"] = 36,["30"] = 36,["31"] = 36,["32"] = 36,["33"] = 36});
local ____exports = {}
local ServerAddress = IsInToolsMode() and "http://" or (ONLINE_TEST_MODE and "http://" or "http://")
local ____IsInToolsMode_result_1
if IsInToolsMode() then
    ____IsInToolsMode_result_1 = "Invalid_NotDedicatedServer"
else
    local ____ONLINE_TEST_MODE_0
    if ONLINE_TEST_MODE then
        ____ONLINE_TEST_MODE_0 = GetDedicatedServerKeyV3("server")
    else
        ____ONLINE_TEST_MODE_0 = GetDedicatedServerKeyV3("server")
    end
    ____IsInToolsMode_result_1 = ____ONLINE_TEST_MODE_0
end
____exports.ServerAuthKey = ____IsInToolsMode_result_1
____exports.NoSignatureURLs = {"/api/v1/game/statistic/saveStatisticData"}
____exports.OpenAPI = {
    NETWORK_ACTIVITY_TIMEOUT = 10000,
    ABSOLUTE_TIMEOUT = 10000,
    BASE = ServerAddress,
    VERSION = "1.0.0",
    WITH_CREDENTIALS = false,
    CREDENTIALS = "include",
    TOKEN = nil,
    USERNAME = nil,
    PASSWORD = nil,
    HEADERS = nil,
    ENCODE_PATH = nil,
    AUTHKEY = ____exports.ServerAuthKey
}
return ____exports
