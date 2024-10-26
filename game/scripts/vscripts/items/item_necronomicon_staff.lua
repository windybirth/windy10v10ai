LinkLuaModifier("modifier_item_necronomicon_staff", "items/item_necronomicon_staff.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_necronomicon_staff_debuff", "items/item_necronomicon_staff.lua", LUA_MODIFIER_MOTION_NONE)
--Abilities
if item_necronomicon_staff == nil then
	item_necronomicon_staff = class({})
end
function item_necronomicon_staff:GetIntrinsicModifierName()
	return "modifier_item_necronomicon_staff"
end

function item_necronomicon_staff:OnSpellStart()
	local target = self:GetCursorTarget()
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("sheep_duration")
	local blast_damage_base = self:GetSpecialValueFor("blast_damage_base")
	local blast_att_multiplier = self:GetSpecialValueFor("blast_att_multiplier")

	if target:TriggerSpellAbsorb(self) or target:IsMagicImmune() then
		return
	end

	local allAtt = caster:GetStrength() + caster:GetAgility() + caster:GetIntellect(false)
	local damage = blast_damage_base + allAtt * blast_att_multiplier
	local damageTable = {
		victim = target,
		attacker = caster,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self.ability,
	}
	ApplyDamage(damageTable)
	target:EmitSound("DOTA_Item.Sheepstick.Activate")

	duration = duration * (1 - target:GetStatusResistance())
	target:AddNewModifier(caster, self, "modifier_item_necronomicon_staff_debuff", { duration = duration })
end

---------------------------------------------------------------------
--Modifiers
if modifier_item_necronomicon_staff == nil then
	modifier_item_necronomicon_staff = class({})
end
function modifier_item_necronomicon_staff:IsHidden()
	return true
end

function modifier_item_necronomicon_staff:IsDebuff()
	return false
end

function modifier_item_necronomicon_staff:IsPurgable()
	return false
end

function modifier_item_necronomicon_staff:IsPurgeException()
	return false
end

function modifier_item_necronomicon_staff:IsStunDebuff()
	return false
end

function modifier_item_necronomicon_staff:AllowIllusionDuplicate()
	return false
end

function modifier_item_necronomicon_staff:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_item_necronomicon_staff:OnCreated(params)
	self.stats_modifier_name = "modifier_item_necronomicon_staff_stats"
	if self:GetAbility() == nil then
		return
	end
	self.ability = self:GetAbility()
	self.bonus_mana_regen = self.ability:GetSpecialValueFor("bonus_mana_regen")
	self.spell_amp = self.ability:GetSpecialValueFor("spell_amp")
	self.mp_regen_amp = self.ability:GetSpecialValueFor("mp_regen_amp")

	self.sheep_duration = self.ability:GetSpecialValueFor("sheep_duration")
	self.tooltip_range = self.ability:GetSpecialValueFor("tooltip_range")
	if IsServer() then
		RefreshItemDataDrivenModifier(self:GetAbility(), self.stats_modifier_name)
	end
end

function modifier_item_necronomicon_staff:OnDestroy()
	if IsServer() then
		RefreshItemDataDrivenModifier(self:GetAbility(), self.stats_modifier_name)
	end
end

function modifier_item_necronomicon_staff:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
		MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
	}
end

function modifier_item_necronomicon_staff:GetModifierConstantManaRegen(params)
	return self.bonus_mana_regen
end

function modifier_item_necronomicon_staff:GetModifierSpellAmplify_Percentage(params)
	return self.spell_amp
end

function modifier_item_necronomicon_staff:GetModifierMPRegenAmplify_Percentage(params)
	return self.mp_regen_amp
end

---------------------------------------------------------------------
if modifier_item_necronomicon_staff_debuff == nil then
	modifier_item_necronomicon_staff_debuff = class({})
end
function modifier_item_necronomicon_staff_debuff:IsHidden()
	return false
end

function modifier_item_necronomicon_staff_debuff:IsDebuff()
	return true
end

function modifier_item_necronomicon_staff_debuff:IsPurgable()
	return false
end

function modifier_item_necronomicon_staff_debuff:IsPurgeException()
	return true
end

function modifier_item_necronomicon_staff_debuff:IsStunDebuff()
	return false
end

function modifier_item_necronomicon_staff_debuff:AllowIllusionDuplicate()
	return false
end

function modifier_item_necronomicon_staff_debuff:OnCreated(params)
	self.sheep_movement_speed = self:GetAbility():GetSpecialValueFor("sheep_movement_speed")
	-- self.blast_damage_multiplier = self:GetAbility():GetSpecialValueFor("blast_damage_multiplier")

	self.blast_int_bonus = 0
	self.blast_int_percent = self:GetAbility():GetSpecialValueFor("blast_int_percent")
	if self:GetParent():IsHero() then
		self.blast_int_bonus = self:GetParent():GetIntellect(false) * self.blast_int_percent * 0.01
	end

	local model_list = { "models/props_gameplay/pig.vmdl", "models/props_gameplay/sheep01.vmdl" }
	self.model_file = model_list[RandomInt(1, #model_list)]
end

function modifier_item_necronomicon_staff_debuff:CheckState()
	return {
		[MODIFIER_STATE_SILENCED] = true,
		[MODIFIER_STATE_MUTED] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_HEXED] = true,
	}
end

function modifier_item_necronomicon_staff_debuff:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BASE_OVERRIDE,
		MODIFIER_PROPERTY_MODEL_CHANGE,
		-- MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DECREPIFY_UNIQUE,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
	}
end

function modifier_item_necronomicon_staff_debuff:GetModifierMoveSpeedOverride(params)
	return self.sheep_movement_speed
end

function modifier_item_necronomicon_staff_debuff:GetModifierModelChange(params)
	return self.model_file
end

-- function modifier_item_necronomicon_staff_debuff:GetModifierMagicalResistanceDecrepifyUnique(params)
--     return self.blast_damage_multiplier
-- end
function modifier_item_necronomicon_staff_debuff:GetModifierBonusStats_Intellect(params)
	return self.blast_int_bonus
end
