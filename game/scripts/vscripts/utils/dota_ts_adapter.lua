local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 123,["9"] = 123,["10"] = 124,["11"] = 125,["12"] = 126,["13"] = 127,["14"] = 128,["15"] = 128,["16"] = 128,["17"] = 128,["19"] = 131,["22"] = 135,["23"] = 136,["24"] = 136,["25"] = 137,["26"] = 138,["27"] = 141,["28"] = 142,["29"] = 143,["33"] = 148,["36"] = 2,["37"] = 2,["38"] = 2,["40"] = 2,["41"] = 5,["42"] = 5,["43"] = 5,["45"] = 5,["46"] = 8,["47"] = 8,["48"] = 8,["50"] = 8,["51"] = 9,["52"] = 16,["53"] = 9,["54"] = 24,["55"] = 28,["56"] = 24,["57"] = 31,["58"] = 32,["59"] = 31,["60"] = 37,["61"] = 37,["62"] = 37,["63"] = 37,["64"] = 40,["65"] = 40,["66"] = 40,["67"] = 40,["68"] = 43,["69"] = 43,["70"] = 43,["71"] = 43,["72"] = 46,["73"] = 46,["74"] = 46,["75"] = 46,["76"] = 46,["78"] = 46,["79"] = 47,["80"] = 47,["81"] = 47,["82"] = 47,["83"] = 47,["85"] = 47,["86"] = 48,["87"] = 50,["88"] = 52,["89"] = 54,["91"] = 56,["93"] = 59,["94"] = 61,["95"] = 63,["96"] = 65,["97"] = 66,["98"] = 67,["99"] = 68,["100"] = 69,["102"] = 66,["103"] = 51,["104"] = 74,["105"] = 75,["106"] = 77,["108"] = 79,["110"] = 82,["111"] = 83,["112"] = 85,["113"] = 87,["114"] = 89,["115"] = 90,["116"] = 91,["117"] = 92,["118"] = 93,["120"] = 90,["121"] = 97,["122"] = 98,["123"] = 99,["124"] = 100,["125"] = 101,["127"] = 103,["128"] = 104,["130"] = 106,["131"] = 107,["134"] = 111,["136"] = 114,["137"] = 74,["138"] = 117,["139"] = 118,["140"] = 119,["142"] = 117});
local ____exports = {}
local getFileScope, toDotaClassInstance
function getFileScope(self)
    local level = 1
    while true do
        local info = debug.getinfo(level, "S")
        if info and info.what == "main" then
            return {
                getfenv(level),
                info.source
            }
        end
        level = level + 1
    end
end
function toDotaClassInstance(self, instance, ____table)
    local ____table_6 = ____table
    local prototype = ____table_6.prototype
    while prototype do
        for key in pairs(prototype) do
            if not (rawget(instance, key) ~= nil) then
                if key ~= "__index" then
                    instance[key] = prototype[key]
                end
            end
        end
        prototype = getmetatable(prototype)
    end
end
____exports.BaseAbility = __TS__Class()
local BaseAbility = ____exports.BaseAbility
BaseAbility.name = "BaseAbility"
function BaseAbility.prototype.____constructor(self)
end
____exports.BaseItem = __TS__Class()
local BaseItem = ____exports.BaseItem
BaseItem.name = "BaseItem"
function BaseItem.prototype.____constructor(self)
end
____exports.BaseModifier = __TS__Class()
local BaseModifier = ____exports.BaseModifier
BaseModifier.name = "BaseModifier"
function BaseModifier.prototype.____constructor(self)
end
function BaseModifier.apply(self, target, caster, ability, modifierTable)
    return target:AddNewModifier(caster, ability, self.name, modifierTable)
end
function BaseModifier.find_on(self, target)
    return target:FindModifierByName(self.name)
end
function BaseModifier.remove(self, target)
    target:RemoveModifierByName(self.name)
end
____exports.BaseModifierMotionHorizontal = __TS__Class()
local BaseModifierMotionHorizontal = ____exports.BaseModifierMotionHorizontal
BaseModifierMotionHorizontal.name = "BaseModifierMotionHorizontal"
__TS__ClassExtends(BaseModifierMotionHorizontal, ____exports.BaseModifier)
____exports.BaseModifierMotionVertical = __TS__Class()
local BaseModifierMotionVertical = ____exports.BaseModifierMotionVertical
BaseModifierMotionVertical.name = "BaseModifierMotionVertical"
__TS__ClassExtends(BaseModifierMotionVertical, ____exports.BaseModifier)
____exports.BaseModifierMotionBoth = __TS__Class()
local BaseModifierMotionBoth = ____exports.BaseModifierMotionBoth
BaseModifierMotionBoth.name = "BaseModifierMotionBoth"
__TS__ClassExtends(BaseModifierMotionBoth, ____exports.BaseModifier)
local ____setmetatable_2 = setmetatable
local ____exports_BaseAbility_prototype_1 = ____exports.BaseAbility.prototype
local ____CDOTA_Ability_Lua_0 = CDOTA_Ability_Lua
if ____CDOTA_Ability_Lua_0 == nil then
    ____CDOTA_Ability_Lua_0 = C_DOTA_Ability_Lua
end
____setmetatable_2(____exports_BaseAbility_prototype_1, {__index = ____CDOTA_Ability_Lua_0})
local ____setmetatable_5 = setmetatable
local ____exports_BaseItem_prototype_4 = ____exports.BaseItem.prototype
local ____CDOTA_Item_Lua_3 = CDOTA_Item_Lua
if ____CDOTA_Item_Lua_3 == nil then
    ____CDOTA_Item_Lua_3 = C_DOTA_Item_Lua
end
____setmetatable_5(____exports_BaseItem_prototype_4, {__index = ____CDOTA_Item_Lua_3})
setmetatable(____exports.BaseModifier.prototype, {__index = CDOTA_Modifier_Lua})
____exports.registerAbility = function(____, name) return function(____, ability)
    if name ~= nil then
        ability.name = name
    else
        name = ability.name
    end
    local env = unpack(getFileScope(nil))
    env[name] = {}
    toDotaClassInstance(nil, env[name], ability)
    local originalSpawn = env[name].Spawn
    env[name].Spawn = function(self)
        self:____constructor()
        if originalSpawn then
            originalSpawn(self)
        end
    end
end end
____exports.registerModifier = function(____, name) return function(____, modifier)
    if name ~= nil then
        modifier.name = name
    else
        name = modifier.name
    end
    local env, source = unpack(getFileScope(nil))
    local fileName = string.gsub(source, ".*scripts[\\/]vscripts[\\/]", "")
    env[name] = {}
    toDotaClassInstance(nil, env[name], modifier)
    local originalOnCreated = env[name].OnCreated
    env[name].OnCreated = function(self, parameters)
        self:____constructor()
        if originalOnCreated then
            originalOnCreated(self, parameters)
        end
    end
    local ____type = LUA_MODIFIER_MOTION_NONE
    local base = modifier.____super
    while base do
        if base == ____exports.BaseModifierMotionBoth then
            ____type = LUA_MODIFIER_MOTION_BOTH
            break
        elseif base == ____exports.BaseModifierMotionHorizontal then
            ____type = LUA_MODIFIER_MOTION_HORIZONTAL
            break
        elseif base == ____exports.BaseModifierMotionVertical then
            ____type = LUA_MODIFIER_MOTION_VERTICAL
            break
        end
        base = base.____super
    end
    LinkLuaModifier(name, fileName, ____type)
end end
local function clearTable(self, ____table)
    for key in pairs(____table) do
        __TS__Delete(____table, key)
    end
end
return ____exports
