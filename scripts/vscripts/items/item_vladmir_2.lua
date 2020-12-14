--[[ ============================================================================================================
	Author: Rook, with help from Noya
	Date: January 26, 2015
	Called when the melee unit affected by the lifesteal aura lands an attack on a target.  Applies a brief lifesteal 
	modifier if not attacking a structure or mechanical unit (Lifesteal blocks in KV files will normally allow the 
	unit to heal when attacking these).
================================================================================================================= ]]
function modifier_item_vladmir_2_lifesteal_aura_on_attack_landed(keys)
	if keys.target.GetInvulnCount == nil and not keys.target:IsTower() and not keys.target:IsBuilding() then
		keys.ability:ApplyDataDrivenModifier(keys.attacker, keys.attacker, "modifier_item_vladmir_2_lifesteal_aura_lifesteal", {duration = 0.03})
	end
end