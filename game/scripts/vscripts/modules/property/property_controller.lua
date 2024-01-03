local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 3,["12"] = 4,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 10,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 21,["30"] = 22,["31"] = 23,["32"] = 26,["33"] = 26,["34"] = 26,["36"] = 30,["37"] = 31,["38"] = 32,["39"] = 33,["40"] = 34,["41"] = 35,["42"] = 36,["43"] = 37,["44"] = 38,["45"] = 39,["46"] = 40,["47"] = 41,["48"] = 42,["49"] = 43,["50"] = 44,["51"] = 47,["52"] = 52,["53"] = 56,["54"] = 60,["55"] = 64,["56"] = 68,["57"] = 72,["58"] = 29,["59"] = 100,["61"] = 101,["62"] = 101,["63"] = 102,["64"] = 103,["65"] = 104,["66"] = 105,["67"] = 106,["68"] = 107,["72"] = 101,["75"] = 100,["76"] = 115,["77"] = 116,["78"] = 117,["79"] = 118,["80"] = 120,["81"] = 121,["82"] = 122,["83"] = 123,["85"] = 127,["86"] = 128,["87"] = 129,["88"] = 130,["89"] = 131,["90"] = 132,["93"] = 137,["94"] = 138,["95"] = 139,["98"] = 115,["99"] = 144,["100"] = 149,["103"] = 153,["105"] = 155,["106"] = 155,["107"] = 156,["108"] = 155,["111"] = 158,["113"] = 160,["115"] = 163,["116"] = 168,["117"] = 171,["118"] = 144,["119"] = 27,["120"] = 28,["121"] = 78,["122"] = 78,["123"] = 78,["124"] = 78,["125"] = 78,["126"] = 78,["127"] = 78,["128"] = 78,["129"] = 78,["130"] = 78,["131"] = 78,["132"] = 78,["133"] = 78,["134"] = 78,["135"] = 78,["136"] = 78,["137"] = 78,["138"] = 97});
local ____exports = {}
local ____property_declare = require("modifiers.property.property_declare")
local property_attackspeed_bonus_constant = ____property_declare.property_attackspeed_bonus_constant
local property_attack_range_bonus = ____property_declare.property_attack_range_bonus
local property_cannot_miss = ____property_declare.property_cannot_miss
local property_cast_range_bonus_stacking = ____property_declare.property_cast_range_bonus_stacking
local property_cooldown_percentage = ____property_declare.property_cooldown_percentage
local property_health_regen_percentage = ____property_declare.property_health_regen_percentage
local property_ignore_movespeed_limit = ____property_declare.property_ignore_movespeed_limit
local property_incoming_damage_percentage = ____property_declare.property_incoming_damage_percentage
local property_lifesteal = ____property_declare.property_lifesteal
local property_magical_resistance_bonus = ____property_declare.property_magical_resistance_bonus
local property_mana_regen_total_percentage = ____property_declare.property_mana_regen_total_percentage
local property_movespeed_bonus_constant = ____property_declare.property_movespeed_bonus_constant
local property_physical_armor_bonus = ____property_declare.property_physical_armor_bonus
local property_preattack_bonus_damage = ____property_declare.property_preattack_bonus_damage
local property_spell_amplify_percentage = ____property_declare.property_spell_amplify_percentage
local property_spell_lifesteal = ____property_declare.property_spell_lifesteal
local property_stats_agility_bonus = ____property_declare.property_stats_agility_bonus
local property_stats_intellect_bonus = ____property_declare.property_stats_intellect_bonus
local property_stats_strength_bonus = ____property_declare.property_stats_strength_bonus
local property_status_resistance_stacking = ____property_declare.property_status_resistance_stacking
local property_evasion_constant = ____property_declare.property_evasion_constant
____exports.PropertyController = __TS__Class()
local PropertyController = ____exports.PropertyController
PropertyController.name = "PropertyController"
function PropertyController.prototype.____constructor(self)
    print("PropertyController init")
    ____exports.PropertyController.propertyValuePerLevel:set(property_cooldown_percentage.name, 4)
    ____exports.PropertyController.propertyValuePerLevel:set(property_cast_range_bonus_stacking.name, 25)
    ____exports.PropertyController.propertyValuePerLevel:set(property_spell_amplify_percentage.name, 5)
    ____exports.PropertyController.propertyValuePerLevel:set(property_status_resistance_stacking.name, 4)
    ____exports.PropertyController.propertyValuePerLevel:set(property_evasion_constant.name, 4)
    ____exports.PropertyController.propertyValuePerLevel:set(property_magical_resistance_bonus.name, 4)
    ____exports.PropertyController.propertyValuePerLevel:set(property_incoming_damage_percentage.name, -4)
    ____exports.PropertyController.propertyValuePerLevel:set(property_attack_range_bonus.name, 25)
    ____exports.PropertyController.propertyValuePerLevel:set(property_health_regen_percentage.name, 0.3)
    ____exports.PropertyController.propertyValuePerLevel:set(property_mana_regen_total_percentage.name, 0.3)
    ____exports.PropertyController.propertyValuePerLevel:set(property_lifesteal.name, 10)
    ____exports.PropertyController.propertyValuePerLevel:set(property_spell_lifesteal.name, 8)
    ____exports.PropertyController.propertyValuePerLevel:set(property_ignore_movespeed_limit.name, 0.125)
    ____exports.PropertyController.propertyValuePerLevel:set(property_cannot_miss.name, 0.125)
    ____exports.PropertyController.propertyDataDrivenName:set(property_movespeed_bonus_constant.name, "modifier_player_property_movespeed_bonus_constant_level_")
    ____exports.PropertyController.propertyDataDrivenName:set(property_physical_armor_bonus.name, "modifier_player_property_physical_armor_bonus_level_")
    ____exports.PropertyController.propertyDataDrivenName:set(property_preattack_bonus_damage.name, "modifier_player_property_preattack_bonus_damage_level_")
    ____exports.PropertyController.propertyDataDrivenName:set(property_attackspeed_bonus_constant.name, "modifier_player_property_attackspeed_bonus_constant_level_")
    ____exports.PropertyController.propertyDataDrivenName:set(property_stats_strength_bonus.name, "modifier_player_property_stats_strength_bonus_level_")
    ____exports.PropertyController.propertyDataDrivenName:set(property_stats_agility_bonus.name, "modifier_player_property_stats_agility_bonus_level_")
    ____exports.PropertyController.propertyDataDrivenName:set(property_stats_intellect_bonus.name, "modifier_player_property_stats_intellect_bonus_level_")
end
function PropertyController.RefreshPlayerProperty(self, property)
    do
        local i = 0
        while i < PlayerResource:GetPlayerCount() do
            if PlayerResource:IsValidPlayer(i) then
                local steamId = PlayerResource:GetSteamAccountID(i)
                if steamId == property.steamId then
                    local hero = PlayerResource:GetSelectedHeroEntity(i)
                    if hero then
                        ____exports.PropertyController:setModifier(hero, property)
                    end
                end
            end
            i = i + 1
        end
    end
end
function PropertyController.setModifier(self, hero, property)
    local name = property.name
    local limitdLevel = property.level
    print((("[PropertyController] setModifier " .. name) .. " ") .. tostring(limitdLevel))
    if __TS__ArrayIncludes(____exports.PropertyController.limitPropertyNames, name) then
        local maxLevel = math.ceil(hero:GetLevel() / ____exports.PropertyController.HERO_LEVEL_PER_POINT)
        limitdLevel = math.min(limitdLevel, maxLevel)
        print(((("[PropertyController] setModifier " .. name) .. " ") .. tostring(limitdLevel)) .. " limit")
    end
    local propertyValuePerLevel = ____exports.PropertyController.propertyValuePerLevel:get(property.name)
    if propertyValuePerLevel then
        local value = propertyValuePerLevel * limitdLevel
        if value ~= 0 then
            hero:RemoveModifierByName(property.name)
            hero:AddNewModifier(hero, nil, property.name, {value = value})
        end
    else
        local dataDrivenName = ____exports.PropertyController.propertyDataDrivenName:get(property.name)
        if dataDrivenName then
            self:refreshDataDrivenPlayerProperty(hero, dataDrivenName, limitdLevel)
        end
    end
end
function PropertyController.refreshDataDrivenPlayerProperty(self, hero, dataDrivenName, level)
    if level == 0 then
        return
    end
    if __TS__StringEndsWith(dataDrivenName, "_level_") then
        do
            local i = 1
            while i <= 8 do
                hero:RemoveModifierByName(dataDrivenName .. tostring(i))
                i = i + 1
            end
        end
        dataDrivenName = dataDrivenName .. tostring(level)
    else
        hero:RemoveModifierByName(dataDrivenName)
    end
    local modifierItem = CreateItem("item_player_modifiers", nil, nil)
    modifierItem:ApplyDataDrivenModifier(hero, hero, dataDrivenName, {duration = -1})
    UTIL_RemoveImmediate(modifierItem)
end
PropertyController.propertyValuePerLevel = __TS__New(Map)
PropertyController.propertyDataDrivenName = __TS__New(Map)
PropertyController.limitPropertyNames = {
    "property_cast_range_bonus_stacking",
    "property_spell_amplify_percentage",
    "property_status_resistance_stacking",
    "property_evasion_constant",
    "property_magical_resistance_bonus",
    "property_incoming_damage_percentage",
    "property_attack_range_bonus",
    "property_physical_armor_bonus",
    "property_preattack_bonus_damage",
    "property_attackspeed_bonus_constant",
    "property_stats_strength_bonus",
    "property_stats_agility_bonus",
    "property_stats_intellect_bonus",
    "property_lifesteal",
    "property_spell_lifesteal"
}
PropertyController.HERO_LEVEL_PER_POINT = 2
return ____exports
