if item_power == nil then item_power = class({}) end

LinkLuaModifier( "modifier_item_power", "items/item_power.lua", LUA_MODIFIER_MOTION_NONE )

function item_power:GetIntrinsicModifierName()
	return "modifier_item_power"
end

if modifier_item_power == nil then modifier_item_power = class({}) end

modifier_item_power = class({
	IsHidden = function() return true end,
	IsPurgable = function() return false end,
	IsPurgeException = function() return false end,
	RegisterFunctions = function() return {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	} end,
	GetModifierPreAttack_BonusDamage = function(self) return self.bonus_damage end,
	GetModifierAttackSpeedBonus_Constant = function(self) return self.bonus_attack_speed end
})

function modifier_item_power:OnCreated()
	self.ability = self:GetAbility()
	self.parent = self:GetParent()
	self:OnRefresh()

	if not IsServer() then return end
	self.targetTeam = self.ability:GetAbilityTargetTeam() or 0--DOTA_UNIT_TARGET_TEAM_ENEMY
	self.targetType = self.ability:GetAbilityTargetType() or 0--DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
    self.targetFlags = self.ability:GetAbilityTargetFlags() or 0
    self:SetHasCustomTransmitterData(true)
end

function modifier_item_power:AddCustomTransmitterData()
    return
    {
        bonus_damage = self.bonus_damage,
        bonus_attack_speed = self.bonus_attack_speed,
    }
end

function modifier_item_power:HandleCustomTransmitterData(data)
    self.bonus_damage = data.bonus_damage
    self.bonus_attack_speed = data.bonus_attack_speed
end

function modifier_item_power:OnRefresh()
	if (not IsServer()) then return end
	self.ability = self:GetAbility() or self.ability
	if not self.ability then return end

	self.bonus_damage = self.ability:GetSpecialValueFor("bonus_damage")
	self.bonus_attack_speed = self.ability:GetSpecialValueFor("bonus_attack_speed")
end

function modifier_item_power:OnAttackLanded(keys)
	if not IsServer() then return end
	if keys.attacker ~= self.parent then return end
	if keys.target:GetTeam() == self.parent:GetTeam() then return end
	if(UnitFilter(keys.target, self.targetTeam, self.targetType, self.targetFlags, self.parent:GetTeamNumber()) ~= UF_SUCCESS) then
		return
	end
	keys.target:AddNewModifier(self.parent, self.ability, "modifier_item_power_debuff", {duration = 0.03})
end

modifier_item_power_debuff = class({
	IsHidden = function() return true end,
	IsPurgable = function() return false end,
	RegisterFunctions = function() return {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_TOTAL_PERCENTAGE
	} end,
	GetModifierPhysicalArmorBonus = function(self) return self.armor_penetration end,
	GetModifierPhysicalArmorTotal_Percentage = function(self) return self.armor_penetration_pct end,
})

function modifier_item_power_debuff:OnCreated()
	if not IsServer() then return end
	self.ability = self:GetAbility()
	self:OnRefresh()
end

function modifier_item_power_debuff:OnRefresh()
	if (not IsServer()) then return end
	self.ability = self:GetAbility() or self.ability
	if not self.ability then return end

	self.armor_penetration = -self.ability:GetSpecialValueFor("armor_penetration")
	self.armor_penetration_pct = -self.ability:GetSpecialValueFor("armor_penetration_pct")
end

LinkLuaModifier("modifier_item_power", "items/item_power", LUA_MODIFIER_MOTION_NONE, modifier_item_power)
LinkLuaModifier("modifier_item_power_debuff", "items/item_power", LUA_MODIFIER_MOTION_NONE, modifier_item_power_debuff)
