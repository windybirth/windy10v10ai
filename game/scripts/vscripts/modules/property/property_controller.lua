local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 2,["11"] = 3,["12"] = 4,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 9,["18"] = 10,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 21,["30"] = 22,["31"] = 23,["32"] = 26,["33"] = 26,["34"] = 26,["36"] = 31,["37"] = 32,["38"] = 33,["39"] = 34,["40"] = 35,["41"] = 36,["42"] = 37,["43"] = 38,["44"] = 39,["45"] = 40,["46"] = 41,["47"] = 42,["48"] = 43,["49"] = 44,["50"] = 45,["51"] = 48,["52"] = 53,["53"] = 57,["54"] = 61,["55"] = 65,["56"] = 69,["57"] = 73,["58"] = 30,["59"] = 102,["61"] = 103,["62"] = 103,["63"] = 104,["64"] = 105,["65"] = 106,["66"] = 107,["67"] = 108,["68"] = 109,["72"] = 103,["75"] = 102,["76"] = 117,["77"] = 118,["78"] = 119,["79"] = 120,["80"] = 122,["81"] = 123,["82"] = 124,["83"] = 125,["85"] = 129,["86"] = 130,["89"] = 135,["90"] = 136,["91"] = 137,["92"] = 138,["93"] = 139,["94"] = 140,["97"] = 145,["98"] = 146,["99"] = 147,["102"] = 117,["103"] = 152,["104"] = 157,["105"] = 158,["106"] = 159,["107"] = 160,["108"] = 161,["111"] = 164,["112"] = 165,["113"] = 166,["114"] = 152,["115"] = 169,["116"] = 174,["119"] = 178,["121"] = 180,["122"] = 180,["123"] = 181,["124"] = 180,["127"] = 183,["129"] = 185,["131"] = 188,["132"] = 193,["133"] = 196,["134"] = 169,["135"] = 27,["136"] = 28,["137"] = 29,["138"] = 79,["139"] = 79,["140"] = 79,["141"] = 79,["142"] = 79,["143"] = 79,["144"] = 79,["145"] = 79,["146"] = 79,["147"] = 79,["148"] = 79,["149"] = 79,["150"] = 79,["151"] = 79,["152"] = 79,["153"] = 79,["154"] = 79,["155"] = 79,["156"] = 99});
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
    print((("[PropertyController] setModifier " .. name) .. " origin level ") .. tostring(property.level))
    local activeLevel = property.level
    if __TS__ArrayIncludes(____exports.PropertyController.limitPropertyNames, name) then
        local activeLevelMax = math.floor(hero:GetLevel() / ____exports.PropertyController.HERO_LEVEL_PER_POINT)
        activeLevel = math.min(property.level, activeLevelMax)
        print(((("[PropertyController] setModifier " .. name) .. " ") .. tostring(activeLevel)) .. " limit")
    end
    if name == "property_skill_points_bonus" then
        ____exports.PropertyController:setBonusSkillPoints(hero, property, activeLevel)
        return
    end
    local propertyValuePerLevel = ____exports.PropertyController.propertyValuePerLevel:get(property.name)
    if propertyValuePerLevel then
        local value = propertyValuePerLevel * activeLevel
        if value > 0 then
            hero:RemoveModifierByName(property.name)
            hero:AddNewModifier(hero, nil, property.name, {value = value})
        end
    else
        local dataDrivenName = ____exports.PropertyController.propertyDataDrivenName:get(property.name)
        if dataDrivenName then
            self:refreshDataDrivenPlayerProperty(hero, dataDrivenName, activeLevel)
        end
    end
end
function PropertyController.setBonusSkillPoints(self, hero, property, activeLevel)
    local steamId = property.steamId
    local shoudAddSP = math.floor(activeLevel / 2)
    local currentAddedSP = ____exports.PropertyController.bnusSkillPointsAdded:get(steamId) or 0
    local deltaSP = shoudAddSP - currentAddedSP
    if deltaSP <= 0 then
        return
    end
    print((("[PropertyController] setBonusSkillPoints " .. tostring(shoudAddSP)) .. " ") .. tostring(deltaSP))
    hero:SetAbilityPoints(hero:GetAbilityPoints() + deltaSP)
    ____exports.PropertyController.bnusSkillPointsAdded:set(steamId, shoudAddSP)
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
PropertyController.bnusSkillPointsAdded = __TS__New(Map)
PropertyController.limitPropertyNames = {
    "property_skill_points_bonus",
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
