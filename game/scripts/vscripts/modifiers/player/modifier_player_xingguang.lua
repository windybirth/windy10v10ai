modifier_player_xingguang = class({})

function modifier_player_xingguang:IsPurgable() return false end
function modifier_player_xingguang:RemoveOnDeath() return false end
function modifier_player_xingguang:GetTexture() return "player/xingguang" end

function modifier_player_xingguang:OnCreated()
    self.imanaregenpct = 1.2
end


function modifier_player_xingguang:DeclareFunctions()
	return
	{
        MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE,
	}
end

function modifier_player_xingguang:GetModifierTotalPercentageManaRegen()
	return self.imanaregenpct
end
