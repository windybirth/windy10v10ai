modifier_player_bulangya = class({})

function modifier_player_bulangya:IsPurgable() return false end
function modifier_player_bulangya:RemoveOnDeath() return false end
function modifier_player_bulangya:GetTexture() return "player/bulangya" end

function modifier_player_bulangya:OnCreated()
    self.icd = 40
    self.icastrange = 600
    self.ikangxing = 40
    self.imovespeed = 300
    self.ipctmanaregen = 3
end


function modifier_player_bulangya:DeclareFunctions()
	return {
        MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE,
        MODIFIER_PROPERTY_CAST_RANGE_BONUS,
        MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE,
        MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
	}
end

function modifier_player_bulangya:GetModifierPercentageCooldown()
    return self.icd
end

function modifier_player_bulangya:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_bulangya:GetModifierStatusResistanceStacking()
    return self.ikangxing
end

function modifier_player_bulangya:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end

function modifier_player_bulangya:GetModifierTotalPercentageManaRegen()
    return self.ipctmanaregen
end

function modifier_player_bulangya:GetModifierMoveSpeed_Limit()
    return 5000
end

function modifier_player_bulangya:GetModifierIgnoreMovespeedLimit()
    return 1
end
