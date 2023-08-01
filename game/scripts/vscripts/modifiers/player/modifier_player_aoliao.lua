modifier_player_aoliao = class({})

function modifier_player_aoliao:IsPurgable() return false end
function modifier_player_aoliao:RemoveOnDeath() return false end
function modifier_player_aoliao:GetTexture() return "player/plusIcon" end



function modifier_player_aoliao:OnCreated()
    self.imanaregenpct = 20
end


function modifier_player_aoliao:DeclareFunctions()
	return
	{
        MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE,
	}
end

function modifier_player_aoliao:GetModifierTotalPercentageManaRegen()
	return self.imanaregenpct
end
