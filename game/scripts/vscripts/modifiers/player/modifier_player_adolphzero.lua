modifier_player_adolphzero = class({})

function modifier_player_adolphzero:IsPurgable() return false end
function modifier_player_adolphzero:RemoveOnDeath() return false end
function modifier_player_adolphzero:GetTexture() return "player/adolphzero" end

function modifier_player_adolphzero:OnCreated()
    self.icd = 40
    self.icastrange = 400
    self.ikangxing = 40
    self.imovespeed = 200
    self.ipctmanaregen = 3
end


function modifier_player_adolphzero:DeclareFunctions()
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

function modifier_player_adolphzero:GetModifierPercentageCooldown()
    return self.icd
end

function modifier_player_adolphzero:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_adolphzero:GetModifierStatusResistanceStacking()
    return self.ikangxing
end

function modifier_player_adolphzero:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end

function modifier_player_adolphzero:GetModifierTotalPercentageManaRegen()
    return self.ipctmanaregen
end

function modifier_player_adolphzero:GetModifierMoveSpeed_Limit()
    return 5000
end

function modifier_player_adolphzero:GetModifierIgnoreMovespeedLimit()
    return 1
end
