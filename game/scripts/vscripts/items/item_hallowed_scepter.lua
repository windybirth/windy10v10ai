if item_hallowed_scepter == nil then item_hallowed_scepter = class({}) end

LinkLuaModifier("modifier_item_hallowed_scepter", "items/item_hallowed_scepter.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_hallowed_scepter_active", "items/item_hallowed_scepter.lua", LUA_MODIFIER_MOTION_NONE)

function item_hallowed_scepter:GetIntrinsicModifierName()
	return "modifier_item_hallowed_scepter"
end

function item_hallowed_scepter:OnSpellStart()
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("active_boost_duration")

	EmitSoundOn("arcane_scepter", caster)
	caster:AddNewModifier(caster, self, "modifier_item_hallowed_scepter_active", { duration = duration })
end

if modifier_item_hallowed_scepter == nil then modifier_item_hallowed_scepter = class({}) end

function modifier_item_hallowed_scepter:IsHidden() return true end

function modifier_item_hallowed_scepter:IsPurgable() return false end

function modifier_item_hallowed_scepter:RemoveOnDeath() return false end

function modifier_item_hallowed_scepter:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE +
		MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_item_hallowed_scepter:OnCreated()
	self.stats_modifier_name = "modifier_item_hallowed_scepter_stats"
	if IsServer() then
		if not self:GetAbility() then self:Destroy() end
	end
	self.spell_amp_per_int = self:GetAbility():GetSpecialValueFor("spell_amp_per_int")

	if not IsServer() then return end

	for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
		mod:GetAbility():SetSecondaryCharges(_)
	end
	RefreshItemDataDrivenModifier(self:GetAbility(), self.stats_modifier_name)
end

function modifier_item_hallowed_scepter:OnDestroy()
	if not IsServer() then return end

	for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
		mod:GetAbility():SetSecondaryCharges(_)
	end
	RefreshItemDataDrivenModifier(self:GetAbility(), self.stats_modifier_name)
end

function modifier_item_hallowed_scepter:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
	}
end

function modifier_item_hallowed_scepter:GetModifierSpellAmplify_Percentage()
	if self:GetAbility() and self:GetAbility():GetSecondaryCharges() == 1 then
		local current_int = self:GetParent():GetIntellect(false)
		return current_int * self.spell_amp_per_int
	end
end

modifier_item_hallowed_scepter_active = class({})

function modifier_item_hallowed_scepter_active:IsPermanent() return false end

function modifier_item_hallowed_scepter_active:IsHidden() return false end

function modifier_item_hallowed_scepter_active:IsPurgeable() return false end

function modifier_item_hallowed_scepter_active:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
	}
end

function modifier_item_hallowed_scepter_active:GetModifierSpellAmplify_Percentage()
	return self:GetAbility():GetSpecialValueFor("active_boost")
end

function modifier_item_hallowed_scepter_active:GetTexture()
	return "item_hallowed_scepter"
end

function modifier_item_hallowed_scepter_active:GetEffectName()
	return "particles/items4_fx/arcane_scepter.vpcf"
end

function modifier_item_hallowed_scepter_active:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
