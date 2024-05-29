modifier_player_lumao = class({})

function modifier_player_lumao:IsPurgable() return false end

function modifier_player_lumao:RemoveOnDeath() return false end

function modifier_player_lumao:GetTexture() return "player/lumao" end

function modifier_player_lumao:OnCreated()
    self.ikangxing = 30
end

function modifier_player_lumao:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
    }
end

function modifier_player_lumao:GetModifierStatusResistanceStacking()
    return self.ikangxing
end
