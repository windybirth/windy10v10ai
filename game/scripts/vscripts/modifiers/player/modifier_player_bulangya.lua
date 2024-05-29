modifier_player_bulangya = class({})

function modifier_player_bulangya:IsPurgable() return false end

function modifier_player_bulangya:RemoveOnDeath() return false end

function modifier_player_bulangya:GetTexture() return "player/bulangya" end

function modifier_player_bulangya:OnCreated()
    self.icastrange = 200
    self.imovespeed = 100
end

function modifier_player_bulangya:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_CAST_RANGE_BONUS,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
    }
end

function modifier_player_bulangya:GetModifierCastRangeBonus()
    return self.icastrange
end

function modifier_player_bulangya:GetModifierMoveSpeedBonus_Constant()
    return self.imovespeed
end
