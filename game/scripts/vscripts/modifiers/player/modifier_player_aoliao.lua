modifier_player_aoliao = class({})

function modifier_player_aoliao:IsPurgable() return false end
function modifier_player_aoliao:RemoveOnDeath() return false end
function modifier_player_aoliao:GetTexture() return "player/plusIcon" end

function modifier_player_aoliao:OnCreated()
    self.icd = 40
    self.icastrange = 400
    self.ikangxing = 40
    self.imovespeed = 200
    self.ipctmanaregen = 300
end


function modifier_player_aoliao:DeclareFunctions()
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

function modifier_player_aoliao:GetModifierPercentageCooldown()
    return self.icd
end

function modifier_player_aoliao:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_aoliao:GetModifierStatusResistanceStacking()
    return self.ikangxing
end

function modifier_player_aoliao:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end

function modifier_player_aoliao:GetModifierTotalPercentageManaRegen()
    return self.ipctmanaregen
end

function modifier_player_aoliao:GetModifierMoveSpeed_Limit()
    return 5000
end

function modifier_player_aoliao:GetModifierIgnoreMovespeedLimit()
    return 1
end
