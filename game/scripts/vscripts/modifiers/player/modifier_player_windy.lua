modifier_player_windy = class({})

function modifier_player_windy:IsPurgable() return false end
function modifier_player_windy:RemoveOnDeath() return false end
function modifier_player_windy:GetTexture() return "player/windy" end

function modifier_player_windy:OnCreated()
    self.icd = 60
    self.icastrange = 400
    self.ikangxing = 40
    self.imovespeed = 200
    self.ipctmanaregen = 3
end


function modifier_player_windy:DeclareFunctions()
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

function modifier_player_windy:GetModifierPercentageCooldown()
    return self.icd
end

function modifier_player_windy:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_windy:GetModifierStatusResistanceStacking()
    return self.ikangxing
end

function modifier_player_windy:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end

function modifier_player_windy:GetModifierTotalPercentageManaRegen()
    return self.ipctmanaregen
end

function modifier_player_windy:GetModifierMoveSpeed_Limit()
    return 5000
end

function modifier_player_windy:GetModifierIgnoreMovespeedLimit()
    return 1
end
