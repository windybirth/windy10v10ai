if item_undying_heart == nil then item_undying_heart = class({}) end

LinkLuaModifier("modifier_item_undying_heart", 			"items/item_undying_heart.lua", LUA_MODIFIER_MOTION_NONE)

function item_undying_heart:GetIntrinsicModifierName()
	return "modifier_item_undying_heart" end

if modifier_item_undying_heart == nil then modifier_item_undying_heart = class({}) end

function modifier_item_undying_heart:IsHidden()		return true end
function modifier_item_undying_heart:IsPurgable()	return false end
function modifier_item_undying_heart:RemoveOnDeath()	return false end
function modifier_item_undying_heart:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_item_undying_heart:OnCreated()
	if IsServer() then
        if not self:GetAbility() then self:Destroy() end
    end
	if not IsServer() then return end
end 

function modifier_item_undying_heart:OnDestroy()
	if not IsServer() then return end
end
 
function modifier_item_undying_heart:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_HEALTH_BONUS,
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE_UNIQUE,
		MODIFIER_PROPERTY_EVASION_CONSTANT,
		MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
	}
end

function modifier_item_undying_heart:GetModifierBonusStats_Strength()
	return self:GetAbility():GetSpecialValueFor("bonus_strength")
end

function modifier_item_undying_heart:GetModifierBonusStats_Health()
	return self:GetAbility():GetSpecialValueFor("bonus_health")
end

function modifier_item_undying_heart:GetModifierHealthRegenPercentageUnique()
	return self:GetAbility():GetSpecialValueFor("health_regen_pct")
end

function modifier_item_undying_heart:GetModifierEvasion_Constant()
	return self:GetAbility():GetSpecialValueFor("bonus_evasion")
end

function modifier_item_undying_heart:GetModifierStatusResistanceStacking()
	return self:GetAbility():GetSpecialValueFor("status_resistance")
end
