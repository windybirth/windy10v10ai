if item_power == nil then item_power = class({}) end

LinkLuaModifier("modifier_item_power", "items/item_power.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier("modifier_item_power_debuff", "items/item_power.lua", LUA_MODIFIER_MOTION_NONE)

function item_power:GetIntrinsicModifierName()
	return "modifier_item_power"
end

if modifier_item_power == nil then modifier_item_power = class({}) end

function modifier_item_power:IsDebuff() return false end
function modifier_item_power:IsHidden() return true end
function modifier_item_power:IsPurgable() return false end
function modifier_item_power:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE end

function modifier_item_power:DeclareFunctions()
    return
    {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end

function modifier_item_power:OnCreated()
	self.stats_modifier_name = "modifier_item_power_stats"
	self.parent=self:GetParent()
    if self:GetAbility() == nil then
		return
    end
	self.ability=self:GetAbility()
	self.bonus_damage = self.ability:GetSpecialValueFor("bonus_damage")
	self.bonus_attack_speed = self.ability:GetSpecialValueFor("bonus_attack_speed")
	if IsServer() then
		RefreshItemDataDrivenModifier(self:GetAbility(), self.stats_modifier_name)
		for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
			mod:GetAbility():SetSecondaryCharges(_)
		end
	end
end

function modifier_item_power:OnDestroy()
	if IsServer() then
		RefreshItemDataDrivenModifier(self:GetAbility(), self.stats_modifier_name)
		for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
			mod:GetAbility():SetSecondaryCharges(_)
		end
	end
end

function modifier_item_power:OnAttackLanded(keys)
	if not IsServer() then return end
	if self:GetAbility() and self:GetAbility():GetSecondaryCharges() ~= 1 then
        return
    end
	if keys.target:GetTeam() == self.parent:GetTeam() then return end
	if(UnitFilter(keys.target, self.targetTeam, self.targetType, self.targetFlags, self.parent:GetTeamNumber()) ~= UF_SUCCESS) then
		return
	end
	keys.target:AddNewModifier(self.parent, self.ability, "modifier_item_power_debuff", {duration = 0.03})
end

modifier_item_power_debuff=class({})

function modifier_item_power_debuff:GetTexture()
    return "item_power"
end

function modifier_item_power_debuff:IsDebuff()
    return true
end

function modifier_item_power_debuff:IsHidden()
    return true
end

function modifier_item_power_debuff:IsPurgable()
    return false
end

function modifier_item_power_debuff:DeclareFunctions()
    return
    {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_TOTAL_PERCENTAGE
   }
end

function modifier_item_power_debuff:OnCreated()
	self.armor_penetration = -self.ability:GetSpecialValueFor("armor_penetration")
	self.armor_penetration_pct = -self.ability:GetSpecialValueFor("armor_penetration_pct")
	if not IsServer() then return end
	self.ability = self:GetAbility()
end

LinkLuaModifier("modifier_item_power", "items/item_power", LUA_MODIFIER_MOTION_NONE, modifier_item_power)
LinkLuaModifier("modifier_item_power_debuff", "items/item_power", LUA_MODIFIER_MOTION_NONE, modifier_item_power_debuff)
