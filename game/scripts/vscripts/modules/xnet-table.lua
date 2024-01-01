local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayUnshift = ____lualib.__TS__ArrayUnshift
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 6,["13"] = 7,["15"] = 10,["16"] = 11,["17"] = 12,["19"] = 14,["20"] = 4,["39"] = 41,["40"] = 42,["41"] = 41,["43"] = 56,["44"] = 59,["45"] = 61,["46"] = 65,["47"] = 130,["48"] = 44,["49"] = 45,["50"] = 47,["51"] = 47,["52"] = 47,["53"] = 47,["54"] = 47,["55"] = 43,["56"] = 50,["57"] = 51,["58"] = 50,["59"] = 82,["60"] = 87,["63"] = 88,["64"] = 89,["65"] = 89,["66"] = 89,["68"] = 90,["69"] = 90,["70"] = 90,["72"] = 90,["73"] = 91,["74"] = 93,["75"] = 82,["76"] = 106,["77"] = 111,["80"] = 113,["81"] = 114,["82"] = 114,["83"] = 114,["85"] = 115,["86"] = 115,["87"] = 115,["89"] = 116,["90"] = 116,["91"] = 116,["93"] = 116,["94"] = 117,["95"] = 120,["96"] = 106,["97"] = 144,["98"] = 149,["99"] = 153,["100"] = 156,["101"] = 156,["102"] = 156,["104"] = 156,["105"] = 157,["106"] = 158,["107"] = 158,["108"] = 158,["110"] = 158,["111"] = 159,["112"] = 160,["114"] = 164,["115"] = 171,["116"] = 172,["117"] = 172,["119"] = 183,["121"] = 184,["122"] = 184,["123"] = 185,["124"] = 184,["128"] = 144,["129"] = 190,["130"] = 195,["131"] = 197,["132"] = 199,["134"] = 206,["135"] = 206,["137"] = 190,["138"] = 214,["139"] = 216,["140"] = 221,["141"] = 222,["142"] = 227,["143"] = 228,["144"] = 230,["145"] = 231,["147"] = 232,["148"] = 232,["149"] = 233,["150"] = 234,["151"] = 237,["152"] = 238,["153"] = 232,["157"] = 243,["159"] = 245,["160"] = 214,["161"] = 248,["162"] = 249,["163"] = 248,["164"] = 254,["165"] = 257,["166"] = 258,["167"] = 259,["170"] = 262,["171"] = 263,["172"] = 266,["175"] = 270,["178"] = 271,["180"] = 272,["181"] = 273,["182"] = 273,["184"] = 274,["185"] = 277,["190"] = 254,["191"] = 282,["192"] = 283,["193"] = 284,["194"] = 286,["195"] = 287,["196"] = 289,["198"] = 292,["199"] = 293,["200"] = 295,["202"] = 298,["203"] = 299,["204"] = 300,["205"] = 301,["206"] = 304,["207"] = 306,["209"] = 313,["210"] = 316,["211"] = 317,["215"] = 324,["216"] = 283,["217"] = 282,["218"] = 41,["219"] = 42});
local ____exports = {}
local ____tstl_2Dutils = require("utils.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local function get_table_size(self, t)
    if type(t) ~= "table" then
        return #tostring(t)
    end
    local size = 0
    for k, v in pairs(t) do
        size = size + get_table_size(nil, k) + get_table_size(nil, v)
    end
    return size
end
--- A module that uses events to simulate a network table, primarily intended to implement the
-- functionality of Valve's official `CustomNetTables`
-- as described at: https://developer.valvesoftware.com/wiki/Dota_2_Workshop_Tools/Custom_Nettables
-- The main purpose is to overcome the 2MB limit of the network table and allow for transmission of larger data sets.
-- It should be noted that sending events takes up server frame time, so for very large data sets
-- they will be split up and sent separately before being reassembled.
-- For small, frequently updated data in-game, it is still recommended to
-- use the native CustomNetTables to avoid affecting network performance.
-- 
-- 一个使用事件来模拟网表的模块，其主要目的是为了实现官方的 `CustomNetTables` 的功能
-- 具体见：https://developer.valvesoftware.com/wiki/Dota_2_Workshop_Tools/Custom_Nettables
-- 主要目的是为了突破网表的2MB的限制，用以实现更大的数据传输。
-- 需要注意的是，发送事件需要占用服务器帧时间，所以对于特别大的数据将会拆分后发送再组合。
-- 游戏中的小体积高频数据同步，依然推荐使用原生的CustomNetTables，以避免影响网络性能。
-- 
-- @export
-- @class XNetTable
-- @license MIT
____exports.XNetTable = __TS__Class()
local XNetTable = ____exports.XNetTable
XNetTable.name = "XNetTable"
function XNetTable.prototype.____constructor(self)
    self.MTU = 1024 * 12
    self._data = {}
    self._player_data = {}
    self._data_queue = {}
    self._last_update_time_mark = {}
    print("[XNetTable] Activated")
    self:_startHeartbeat()
    ListenToGameEvent(
        "player_connect_full",
        function(____, keys) return self:_onPlayerConnectFull(keys) end,
        self
    )
end
function XNetTable.prototype.Reload(self)
    print("[XNetTable] Reloaded")
end
function XNetTable.prototype.SetTableValue(self, tname, key, value)
    if not IsServer() then
        return
    end
    local key_name = tostring(key)
    local ____self__data_0, ____tname_1 = self._data, tname
    if ____self__data_0[____tname_1] == nil then
        ____self__data_0[____tname_1] = {}
    end
    local ____value_2 = value
    if ____value_2 == nil then
        ____value_2 = {}
    end
    value = ____value_2
    self._data[tname][key_name] = value
    self:_appendUpdateRequest(nil, tname, key_name, value)
end
function XNetTable.prototype.SetPlayerTableValue(self, playerId, tname, key, value)
    if not IsServer() then
        return
    end
    local key_name = tostring(key)
    local ____self__player_data_3, ____playerId_4 = self._player_data, playerId
    if ____self__player_data_3[____playerId_4] == nil then
        ____self__player_data_3[____playerId_4] = {}
    end
    local ____self__player_data_playerId_5, ____tname_6 = self._player_data[playerId], tname
    if ____self__player_data_playerId_5[____tname_6] == nil then
        ____self__player_data_playerId_5[____tname_6] = {}
    end
    local ____value_7 = value
    if ____value_7 == nil then
        ____value_7 = {}
    end
    value = ____value_7
    self._player_data[playerId][tname][key_name] = value
    self:_appendUpdateRequest(playerId, tname, key_name, value)
end
function XNetTable.prototype._appendUpdateRequest(self, playerId, tname, key, value)
    local k = tostring(key)
    local size = get_table_size(nil, value)
    local ____playerId_8 = playerId
    if ____playerId_8 == nil then
        ____playerId_8 = "all"
    end
    local mark_name = (((tostring(____playerId_8) .. ".") .. tname) .. ".") .. k
    local now = GameRules:GetGameTime()
    local ____self__last_update_time_mark_mark_name_9 = self._last_update_time_mark[mark_name]
    if ____self__last_update_time_mark_mark_name_9 == nil then
        ____self__last_update_time_mark_mark_name_9 = 0
    end
    local last_update_time = ____self__last_update_time_mark_mark_name_9
    if now == last_update_time then
        print(("[XNetTable] " .. mark_name) .. "同一帧执行了多次更新，建议优化代码，一帧最多只更新一次，本次更新照常执行")
    end
    self._last_update_time_mark[mark_name] = now
    if size < self.MTU then
        local ____self__data_queue_10 = self._data_queue
        ____self__data_queue_10[#____self__data_queue_10 + 1] = {target = playerId, data_length = size, data = {table_name = tname, key = k, content = value}}
    else
        local data = self:_prepareDataChunks(tname, k, value)
        do
            local i = 0
            while i < #data do
                self:_insertDataToQueue(data[i + 1], playerId)
                i = i + 1
            end
        end
    end
end
function XNetTable.prototype._insertDataToQueue(self, data, playerId, positively)
    local size = get_table_size(nil, data)
    if positively then
        __TS__ArrayUnshift(self._data_queue, {target = playerId, data_length = size, data = data})
    else
        local ____self__data_queue_11 = self._data_queue
        ____self__data_queue_11[#____self__data_queue_11 + 1] = {target = playerId, data_length = size, data = data}
    end
end
function XNetTable.prototype._prepareDataChunks(self, tname, key, value)
    local data = self:_encodeTable({table = tname, key = key, value = value})
    local chunks = {}
    local chunk_size = self.MTU - 2
    local unique_id = DoUniqueString("")
    local data_length = string.len(data)
    if data_length > chunk_size then
        local chunk_count = math.ceil(data_length / chunk_size)
        do
            local i = 0
            while i < chunk_count do
                local chunk = __TS__StringSubstring(data, i * chunk_size, (i + 1) * chunk_size)
                print(string.len(chunk))
                chunk = (((((("#" .. unique_id) .. "#") .. tostring(chunk_count)) .. "#") .. tostring(i)) .. "#") .. chunk
                chunks[#chunks + 1] = chunk
                i = i + 1
            end
        end
    else
        chunks[#chunks + 1] = data
    end
    return chunks
end
function XNetTable.prototype._encodeTable(self, t)
    return json.encode(t)
end
function XNetTable.prototype._onPlayerConnectFull(self, keys)
    local playerId = keys.PlayerID
    local player = PlayerResource:GetPlayer(playerId)
    if player == nil then
        return
    end
    for tname in pairs(self._data) do
        for key in pairs(self._data[tname]) do
            self:_appendUpdateRequest(playerId, tname, key, self._data[tname][key])
        end
    end
    if self._player_data[playerId] == nil then
        return
    end
    for tname in pairs(self._player_data[playerId]) do
        do
            local ____table = self._player_data[playerId][tname]
            if ____table == nil then
                goto __continue32
            end
            for key in pairs(____table) do
                self:_appendUpdateRequest(playerId, tname, key, ____table[key])
            end
        end
        ::__continue32::
    end
end
function XNetTable.prototype._startHeartbeat(self)
    Timers:CreateTimer(function()
        local data_sent_length = 0
        while #self._data_queue > 0 do
            if data_sent_length > self.MTU then
                return FrameTime()
            end
            local data = table.remove(self._data_queue, 1)
            if data == nil then
                return FrameTime()
            end
            local content = data.data
            local content_length = data.data_length
            local target = data.target
            data_sent_length = data_sent_length + content_length
            if target == nil or target == -1 then
                CustomGameEventManager:Send_ServerToAllClients("x_net_table", {data = content})
            else
                local player = PlayerResource:GetPlayer(target)
                if player ~= nil and not player:IsNull() then
                    CustomGameEventManager:Send_ServerToPlayer(player, "x_net_table", {data = content})
                end
            end
        end
        return FrameTime()
    end)
end
XNetTable = __TS__Decorate({reloadable}, XNetTable)
____exports.XNetTable = XNetTable
return ____exports
