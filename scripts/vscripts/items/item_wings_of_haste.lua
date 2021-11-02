LinkLuaModifier("modifier_item_wings_of_haste_consumed", "items/item_wings_of_haste.lua", LUA_MODIFIER_MOTION_NONE)
modifier_item_wings_of_haste_data = {}

function WingsOfHasteOnSpell(keys)
	if (keys.caster:IsRealHero() or keys.caster:GetName() == "npc_dota_lone_druid_bear") and (keys.target:IsRealHero() or keys.target:GetName() == "npc_dota_lone_druid_bear") and not keys.caster:HasModifier("modifier_arc_warden_tempest_double") and not keys.target:HasModifier("modifier_arc_warden_tempest_double") and not keys.target:HasModifier(keys.modifier) then
		keys.target:AddNewModifier(keys.target, keys.ability, keys.modifier, {})
		keys.target:EmitSound("Hero_Alchemist.Scepter.Cast")
		keys.caster:RemoveItem(keys.ability)
	end
end

modifier_item_wings_of_haste_consumed = class({})

function modifier_item_wings_of_haste_consumed:IsPurgable() return false end
function modifier_item_wings_of_haste_consumed:RemoveOnDeath() return false end
function modifier_item_wings_of_haste_consumed:AllowIllusionDuplicate() return true end
function modifier_item_wings_of_haste_consumed:GetTexture() return "item_wings_of_haste" end

function modifier_item_wings_of_haste_consumed:OnCreated()
	local ability = self:GetAbility()
	if modifier_item_wings_of_haste_data.bonus_all_stats == nil and ability then
		modifier_item_wings_of_haste_data.bonus_movement_speed = ability:GetSpecialValueFor("bonus_movement_speed")
		modifier_item_wings_of_haste_data.bonus_damage = ability:GetSpecialValueFor("bonus_damage")
		modifier_item_wings_of_haste_data.bonus_attack_speed = ability:GetSpecialValueFor("bonus_attack_speed")
		modifier_item_wings_of_haste_data.bonus_all_stats = ability:GetSpecialValueFor("bonus_all_stats")
		modifier_item_wings_of_haste_data.bonus_health_regen = ability:GetSpecialValueFor("bonus_health_regen")
		modifier_item_wings_of_haste_data.bonus_mana_regen = ability:GetSpecialValueFor("bonus_mana_regen")
		modifier_item_wings_of_haste_data.bonus_armor = ability:GetSpecialValueFor("bonus_armor")
	end
end

function modifier_item_wings_of_haste_consumed:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_UNIQUE,
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
end

function modifier_item_wings_of_haste_consumed:GetModifierMoveSpeedBonus_Special_Boots() return modifier_item_wings_of_haste_data.bonus_movement_speed end
function modifier_item_wings_of_haste_consumed:GetModifierPreAttack_BonusDamage() return modifier_item_wings_of_haste_data.bonus_damage end
function modifier_item_wings_of_haste_consumed:GetModifierAttackSpeedBonus_Constant() return modifier_item_wings_of_haste_data.bonus_attack_speed end
function modifier_item_wings_of_haste_consumed:GetModifierBonusStats_Intellect() return modifier_item_wings_of_haste_data.bonus_all_stats end
function modifier_item_wings_of_haste_consumed:GetModifierBonusStats_Agility() return modifier_item_wings_of_haste_data.bonus_all_stats end
function modifier_item_wings_of_haste_consumed:GetModifierBonusStats_Strength() return modifier_item_wings_of_haste_data.bonus_all_stats end
function modifier_item_wings_of_haste_consumed:GetModifierConstantHealthRegen() return modifier_item_wings_of_haste_data.bonus_health_regen end
function modifier_item_wings_of_haste_consumed:GetModifierConstantManaRegen() return modifier_item_wings_of_haste_data.bonus_mana_regen end
function modifier_item_wings_of_haste_consumed:GetModifierPhysicalArmorBonus() return modifier_item_wings_of_haste_data.bonus_armor end
