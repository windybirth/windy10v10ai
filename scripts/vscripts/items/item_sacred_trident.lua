if item_sacred_trident == nil then item_sacred_trident = class({}) end

LinkLuaModifier("modifier_item_sacred_trident", 			"items/item_sacred_trident.lua", LUA_MODIFIER_MOTION_NONE)

function item_sacred_trident:GetIntrinsicModifierName()
	return "modifier_item_sacred_trident" end

if modifier_item_sacred_trident == nil then modifier_item_sacred_trident = class({}) end


function modifier_item_sacred_trident:IsHidden()		return true end
function modifier_item_sacred_trident:IsPurgable()		return false end
function modifier_item_sacred_trident:RemoveOnDeath()	return false end
function modifier_item_sacred_trident:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end
  
function modifier_item_sacred_trident:OnCreated()
	if not self:GetAbility() then self:Destroy() return end

	self.bonus_strength = self:GetAbility():GetSpecialValueFor("bonus_strength")
	self.status_resistance = self:GetAbility():GetSpecialValueFor("status_resistance")
	self.hp_regen_amp = self:GetAbility():GetSpecialValueFor("hp_regen_amp")
	self.bonus_agility = self:GetAbility():GetSpecialValueFor("bonus_agility")
	self.movement_speed_percent_bonus = self:GetAbility():GetSpecialValueFor("movement_speed_percent_bonus")
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor("bonus_attack_speed")
	self.bonus_intellect = self:GetAbility():GetSpecialValueFor("bonus_intellect")
	self.spell_amp = self:GetAbility():GetSpecialValueFor("spell_amp")
	self.spell_lifesteal_amp = self:GetAbility():GetSpecialValueFor("spell_lifesteal_amp")
	self.mana_regen_multiplier = self:GetAbility():GetSpecialValueFor("mana_regen_multiplier")

	if not IsServer() then return end

	for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
        mod:GetAbility():SetSecondaryCharges(_)
    end
end 

function modifier_item_sacred_trident:OnDestroy()
    if not IsServer() then return end
    
    for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
        mod:GetAbility():SetSecondaryCharges(_)
    end
end

function modifier_item_sacred_trident:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
		MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE,
		MODIFIER_PROPERTY_LIFESTEAL_AMPLIFY_PERCENTAGE,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE_UNIQUE,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
		MODIFIER_PROPERTY_SPELL_LIFESTEAL_AMPLIFY_PERCENTAGE,
		MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
	}
end

function modifier_item_sacred_trident:GetModifierPreAttack_BonusDamage()
	if self:GetAbility() and self:GetAbility():GetSecondaryCharges() == 1 then
		local current_int = self:GetParent():GetIntellect() 
		local current_str = self:GetParent():GetStrength()
		local current_agi = self:GetParent():GetAgility()
		local current_tol = current_int + current_str + current_agi
		local ex_att = current_tol * self:GetAbility():GetSpecialValueFor("bonus_damage_per")
		return ex_att
	end 
end 

function modifier_item_sacred_trident:GetModifierBonusStats_Strength()
	return self.bonus_strength
end

function modifier_item_sacred_trident:GetModifierStatusResistanceStacking()
	return self.status_resistance
end

function modifier_item_sacred_trident:GetModifierHPRegenAmplify_Percentage()
	return self.hp_regen_amp
end

function modifier_item_sacred_trident:GetModifierLifestealRegenAmplify_Percentage()
	return self.hp_regen_amp
end

function modifier_item_sacred_trident:GetModifierBonusStats_Agility()
	return self.bonus_agility
end

function modifier_item_sacred_trident:GetModifierMoveSpeedBonus_Percentage_Unique()
	return self.movement_speed_percent_bonus
end

function modifier_item_sacred_trident:GetModifierAttackSpeedBonus_Constant()
	return self.bonus_attack_speed
end

function modifier_item_sacred_trident:GetModifierBonusStats_Intellect()
	return self.bonus_intellect
end

function modifier_item_sacred_trident:GetModifierSpellAmplify_Percentage()
	return self.spell_amp
end

function modifier_item_sacred_trident:GetModifierSpellLifestealRegenAmplify_Percentage()
	return self.spell_lifesteal_amp
end

function modifier_item_sacred_trident:GetModifierMPRegenAmplify_Percentage()
	return self.mana_regen_multiplier
end
