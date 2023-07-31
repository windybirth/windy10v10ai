modifier_player_76 = class({})

function modifier_player_76:IsPurgable() return false end
function modifier_player_76:RemoveOnDeath() return false end
function modifier_player_76:GetTexture() return "player/76" end

function modifier_player_76:OnCreated()
	self.istrength = 200
	self.iagility = 200
	self.iintellect = 200
	self.imovementspeed = 200
end


function modifier_player_76:DeclareFunctions()
	return
	{
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS;
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS;
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS;
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
	}
end

function modifier_player_76:GetModifierBonusStats_Strength()
	return self.istrength
end

function modifier_player_76:GetModifierBonusStats_Agility()
	return self.iagility
end

function modifier_player_76:GetModifierBonusStats_Intellect()
	return self.iintellect
end

function modifier_player_76:GetModifierMoveSpeedBonus_Constant()
	return self.imovementspeed
end
