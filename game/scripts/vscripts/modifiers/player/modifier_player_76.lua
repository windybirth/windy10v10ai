modifier_player_76 = class({})

function modifier_player_76:IsPurgable() return false end
function modifier_player_76:RemoveOnDeath() return false end
function modifier_player_76:GetTexture() return "player/76" end

function modifier_player_76:OnCreated()
	self.iIncomingDamage = -40
    self.icd = 50
    self.istrength = 200
    self.iagility = 200
    self.iintelligence = 200
    self.icastrange = 800
end


function modifier_player_76:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
        MODIFIER_PROPERTY_COOLDOWN_REDUCTION_CONSTANT,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_CAST_RANGE_BONUS,
	}
end

function modifier_player_76:GetModifierIncomingDamage_Percentage()
	return self.iIncomingDamage
end

function modifier_player_76:GetModifierPercentageCooldown()
    return self.icd
end


function modifier_player_76:GetModifierBonusStats_Strength()
    return self.istrength
end


function modifier_player_76:GetModifierBonusStats_Agility()
    return self.iagility
end


function modifier_player_76:GetModifierBonusStats_Intellect()
    return self.iintelligence
end

function modifier_player_76:GetModifierCastRangeBonus()
    return self.icastrange
end
