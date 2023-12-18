modifier_player_xin = class({})

function modifier_player_xin:IsPurgable() return false end
function modifier_player_xin:RemoveOnDeath() return false end
function modifier_player_xin:GetTexture() return "player/xin" end

function modifier_player_xin:OnCreated()
    self.icd = 40
    self.icastrange = 400
    self.ikangxing = 40
    self.imovespeed = 200
    self.ipctmanaregen = 3
end


function modifier_player_xin:DeclareFunctions()
	return {
        MODIFIER_PROPERTY_COOLDOWN_REDUCTION_CONSTANT,
        MODIFIER_PROPERTY_CAST_RANGE_BONUS,
        MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE,
        MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
	}
end

function modifier_player_xin:GetModifierPercentageCooldown()
    return self.icd
end

function modifier_player_xin:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_xin:GetModifierStatusResistanceStacking()
    return self.ikangxing
end

function modifier_player_xin:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end

function modifier_player_xin:GetModifierTotalPercentageManaRegen()
    return self.ipctmanaregen
end

function modifier_player_xin:GetModifierMoveSpeed_Limit()
    return 5000
end

function modifier_player_xin:GetModifierIgnoreMovespeedLimit()
    return 1
end
