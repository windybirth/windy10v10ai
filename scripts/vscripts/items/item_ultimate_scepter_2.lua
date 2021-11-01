
LinkLuaModifier("modifier_item_ultimate_scepter_2_consumed", "items/item_ultimate_scepter_2.lua", LUA_MODIFIER_MOTION_NONE)
modifier_item_ultimate_scepter_2_data = {}

function Scepter2OnCreated(keys)
	--if not keys.caster:HasModifier("modifier_item_ultimate_scepter") then
		keys.caster:AddNewModifier(keys.caster, nil, "modifier_item_ultimate_scepter", {duration = -1})
	--end
end

--[[ ============================================================================================================
	Author: Rook
	Date: January 26, 2015
	Called when Aghanim's Regalia is sold or dropped.  Removes the stock Aghanim's Scepter modifier if no other 
	Aghanim's Scepter exist in the player's inventory.
================================================================================================================= ]]
function Scepter2OnDestroy(keys)
	local num_scepters_in_inventory = 0
	for i=0, 5, 1 do --Search for Aghanim's Regalia in the player's inventory.
		local current_item = keys.caster:GetItemInSlot(i)
		if current_item ~= nil then
			local item_name = current_item:GetName()
			
			if item_name == "item_ultimate_scepter2" or item_name == "item_ultimate_scepter" then
				num_scepters_in_inventory = num_scepters_in_inventory + 1
			end
		end
	end
	--Remove the stock Aghanim's Scepter modifier if the player no longer has a Scepter in their inventory.
	if num_scepters_in_inventory == 0 and keys.caster:HasModifier("modifier_item_ultimate_scepter") and not keys.caster:HasModifier("modifier_item_ultimate_scepter_2_consumed") then
		keys.caster:RemoveModifierByName("modifier_item_ultimate_scepter")
	end
end

--[[	Author: Hewdraw
		Date: 17.05.2015	]]
function Scepter2OnSpell(keys)
	if keys.caster:IsRealHero() and keys.target:IsRealHero() and not keys.caster:HasModifier("modifier_arc_warden_tempest_double") and not keys.target:HasModifier("modifier_arc_warden_tempest_double") and not keys.target:HasModifier(keys.modifier) then
		keys.target:AddNewModifier(keys.caster, nil, "modifier_item_ultimate_scepter", {duration = -1})
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.target, keys.modifier, {})
		keys.target:EmitSound("Hero_Alchemist.Scepter.Cast")
		keys.caster:RemoveItem(keys.ability)
	end
end

modifier_item_ultimate_scepter_2_consumed = class({})

function modifier_item_ultimate_scepter_2_consumed:IsPurgable() return false end
function modifier_item_ultimate_scepter_2_consumed:RemoveOnDeath() return false end
function modifier_item_ultimate_scepter_2_consumed:AllowIllusionDuplicate() return true end
function modifier_item_ultimate_scepter_2_consumed:GetTexture() return "item_ultimate_regalia" end

function modifier_item_ultimate_scepter_2_consumed:OnCreated()
	local ability = self:GetAbility()
	if modifier_item_ultimate_scepter_2_data.bonus_all_stats == nil and ability then
		modifier_item_ultimate_scepter_2_data.bonus_all_stats = ability:GetSpecialValueFor("bonus_all_stats")
		modifier_item_ultimate_scepter_2_data.bonus_health = ability:GetSpecialValueFor("bonus_health")
		modifier_item_ultimate_scepter_2_data.bonus_mana = ability:GetSpecialValueFor("bonus_mana")
		modifier_item_ultimate_scepter_2_data.spell_amp = ability:GetSpecialValueFor("spell_amp")
	end
end

function modifier_item_ultimate_scepter_2_consumed:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_PROPERTY_HEALTH_BONUS,
		MODIFIER_PROPERTY_MANA_BONUS,
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
	}
end

function modifier_item_ultimate_scepter_2_consumed:GetModifierBonusStats_Strength()
	return modifier_item_ultimate_scepter_2_data.bonus_all_stats
end
function modifier_item_ultimate_scepter_2_consumed:GetModifierBonusStats_Agility()
	return modifier_item_ultimate_scepter_2_data.bonus_all_stats
end
function modifier_item_ultimate_scepter_2_consumed:GetModifierBonusStats_Intellect()
	return modifier_item_ultimate_scepter_2_data.bonus_all_stats
end
function modifier_item_ultimate_scepter_2_consumed:GetModifierHealthBonus()
	return modifier_item_ultimate_scepter_2_data.bonus_health
end
function modifier_item_ultimate_scepter_2_consumed:GetModifierManaBonus()
	return modifier_item_ultimate_scepter_2_data.bonus_mana
end
function modifier_item_ultimate_scepter_2_consumed:GetModifierSpellAmplify_Percentage()
	return modifier_item_ultimate_scepter_2_data.spell_amp
end
