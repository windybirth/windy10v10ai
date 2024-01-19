modifier_player_dky190 = class({})

function modifier_player_dky190:IsPurgable() return false end
function modifier_player_dky190:RemoveOnDeath() return false end
function modifier_player_dky190:GetTexture() return "player/dky190_1" end

function modifier_player_dky190:OnCreated()
    self.icd = 40
    self.icastrange = 200
    self.ikangxing = 80
    self.imovespeed = 200
    self.ipctmanaregen = 3
end


function modifier_player_dky190:DeclareFunctions()
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

function modifier_player_dky190:GetModifierPercentageCooldown()
    return self.icd
end

function modifier_player_dky190:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_dky190:GetModifierStatusResistanceStacking()
    return self.ikangxing
end

function modifier_player_dky190:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end

function modifier_player_dky190:GetModifierTotalPercentageManaRegen()
    return self.ipctmanaregen
end

function modifier_player_dky190:GetModifierMoveSpeed_Limit()
    return 5000
end

function modifier_player_dky190:GetModifierIgnoreMovespeedLimit()
    return 1
end
