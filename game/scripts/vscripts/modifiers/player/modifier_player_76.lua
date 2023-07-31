modifier_player_76 = class({})

function modifier_player_76:IsPurgable() return false end
function modifier_player_76:RemoveOnDeath() return false end
function modifier_player_76:GetTexture() return "player/76" end

function modifier_player_76:OnCreated()
	self.istrength = 200
end

function modifier_player_76:OnCreated()
	self.iagility = 120
end

function modifier_player_76:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
	}
end

function modifier_player_76:GetModifierBonusStats_Strength()
	return self.istrength
end

function modifier_player_76:GetModifierBonusStats_Agility()
	return self.iagility
end
