modifier_player_miao = class({})

function modifier_player_miao:IsPurgable() return false end
function modifier_player_miao:RemoveOnDeath() return false end
function modifier_player_miao:GetTexture() return "player/xingguang" end

function modifier_player_miao:OnCreated()
    self.icd = 40
    self.icastrange = 400
    self.ikangxing = 40
    self.imovespeed = 200
    self.ipctmanaregen = 3
end


function modifier_player_miao:DeclareFunctions()
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

function modifier_player_miao:GetModifierPercentageCooldown()
    return self.icd
end

function modifier_player_miao:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_miao:GetModifierStatusResistanceStacking()
    return self.ikangxing
end

function modifier_player_miao:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end

function modifier_player_miao:GetModifierTotalPercentageManaRegen()
    return self.ipctmanaregen
end

function modifier_player_miao:GetModifierMoveSpeed_Limit()
    return 5000
end

function modifier_player_miao:GetModifierIgnoreMovespeedLimit()
    return 1
end
