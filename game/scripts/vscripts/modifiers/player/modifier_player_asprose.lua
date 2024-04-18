modifier_player_asprose = class({})

function modifier_player_asprose:IsPurgable() return false end

function modifier_player_asprose:RemoveOnDeath() return false end

function modifier_player_asprose:GetTexture() return "player/asprose" end

function modifier_player_asprose:OnCreated()
	self.icd = 40
	self.icastrange = 400
	self.ikangxing = 40
	self.imovespeed = 200
	self.ipctmanaregen = 3
	self.iModelScale = -50
end

function modifier_player_asprose:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE,
		MODIFIER_PROPERTY_CAST_RANGE_BONUS,
		MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE,
		MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
		MODIFIER_PROPERTY_MODEL_SCALE,
	}
end

function modifier_player_asprose:GetModifierPercentageCooldown()
	return self.icd
end

function modifier_player_asprose:GetModifierCastRangeBonus()
	return self.icastrange
end

function modifier_player_asprose:GetModifierStatusResistanceStacking()
	return self.ikangxing
end

function modifier_player_asprose:GetModifierMoveSpeedBonus_Constant()
	return self.imovespeed
end

function modifier_player_asprose:GetModifierTotalPercentageManaRegen()
	return self.ipctmanaregen
end

function modifier_player_asprose:GetModifierMoveSpeed_Limit()
	return 5000
end

function modifier_player_asprose:GetModifierIgnoreMovespeedLimit()
	return 1
end

function modifier_player_asprose:GetModifierModelScale()
	return self.iModelScale
end
