modifier_player_lumao = class({})

function modifier_player_lumao:IsPurgable() return false end
function modifier_player_lumao:RemoveOnDeath() return false end
function modifier_player_lumao:GetTexture() return "player/lumao" end

function modifier_player_lumao:OnCreated()
    self.icd = 40
    self.icastrange = 400
    self.ikangxing = 40
    self.imovespeed = 200
    self.ipctmanaregen = 3
end


function modifier_player_lumao:DeclareFunctions()
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

function modifier_player_lumao:GetModifierPercentageCooldown()
    return self.icd
end

function modifier_player_lumao:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_lumao:GetModifierStatusResistanceStacking()
    return self.ikangxing
end

function modifier_player_lumao:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end

function modifier_player_lumao:GetModifierTotalPercentageManaRegen()
    return self.ipctmanaregen
end

function modifier_player_lumao:GetModifierMoveSpeed_Limit()
    return 5000
end

function modifier_player_lumao:GetModifierIgnoreMovespeedLimit()
    return 1
end
