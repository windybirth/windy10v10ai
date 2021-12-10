if item_Non_Mage_Key == nil then item_Non_Mage_Key = class({}) end

LinkLuaModifier("modifier_item_Non_Mage_Key", 			"items/item_Non_Mage_Key.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_Non_Mage_Key_debuff", 	"items/item_Non_Mage_Key.lua", LUA_MODIFIER_MOTION_NONE)

function item_magic_scepter:GetIntrinsicModifierName()
	return "modifier_item_Non_Mage_Key" end



if modifier_item_Non_Mage_Key == nil then modifier_item_Non_Mage_Key = class({}) end

function modifier_item_Non_Mage_Key:IsHidden()			return true end
function modifier_item_Non_Mage_Key:IsPurgable()		return false end
function modifier_item_Non_Mage_Key:RemoveOnDeath()	return false end
function modifier_item_Non_Mage_Key:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_item_Non_Mage_Key:OnCreated()
	if IsServer() then
        if not self:GetAbility() then self:Destroy() end
    end
	
	if not IsServer() then return end

	for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
		mod:GetAbility():SetSecondaryCharges(_)
	end 
end 

function modifier_item_Non_Mage_Key:OnDestroy()
	if not IsServer() then return end

	for _, mod in pairs(self:GetParent():FindAllModifiersByName(self:GetName())) do
		mod:GetAbility():SetSecondaryCharges(_)
	end 
end
 
function modifier_item_Non_Mage_Key:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_BASE_MANA_REGEN,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
        MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_MAGICAL,
        MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end 

function modifier_item_Non_Mage_Key:GetModifierBonusStats_Intellect()
	return self:GetAbility():GetSpecialValueFor("bonus_intelligence")
end
function modifier_item_Non_Mage_Key:GetModifierBonusStats_Agility()
	return self:GetAbility():GetSpecialValueFor("bonus_agility")
end
function modifier_item_Non_Mage_Key:GetModifierPreAttack_BonusDamage()
	return self:GetAbility():GetSpecialValueFor("bonus_attack_damage")
end
function modifier_item_Non_Mage_Key:GetModifierBaseManaRegen()
	return self:GetAbility():mana_recover("active_boost")
end
function modifier_item_Non_Mage_Key:GetModifierAttackSpeedBonus_Constant()
	return self:GetAbility():GetSpecialValueFor("bonus_attack_speed")
end
function modifier_item_Non_Mage_Key:GetModifierMagicalResistanceBonus()
	return self:GetAbility():GetSpecialValueFor("bonus_magical_resistance")
end




function modifier_item_Non_Mage_Key:GetModifierProcAttack_BonusDamage_Magical(keys)
	if keys.target:IsBuilding() or keys.attacker:GetTeamNumber() == keys.target:GetTeamNumber() or keys.target:GetMaxMana() == 0 or keys.target:IsMagicImmune() then return 0 end
	hAbility = self:GetAbility()
	local iManaBreak = hAbility:GetSpecialValueFor("debuff_DMG")
	local fCurrentMana = keys.target:GetMana()
	if fCurrentMana > iManaBreak then
		return hAbility:GetSpecialValueFor("debuff_DMG")
	else
		return hAbility:GetSpecialValueFor("debuff_DMG")
	end
end

function modifier_item_Non_Mage_Key:OnAttackLanded(keys)
	if self:GetParent() ~= keys.attacker or keys.target:IsBuilding() or keys.attacker:GetTeamNumber() == keys.target:GetTeamNumber() or keys.target:GetMaxMana() == 0 or keys.target:IsMagicImmune() then return end
	hAbility = self:GetAbility()
	local iManaBreak = hAbility:GetSpecialValueFor("debuff_DMG")
	local fCurrentMana = keys.target:GetMana()
	if fCurrentMana > iManaBreak then
		keys.target:SetMana(fCurrentMana-iManaBreak)
	else 
		keys.target:SetMana(0)
	end
	
	keys.target:EmitSound("Hero_Antimage.ManaBreak")

    local caster = self:GetCaster()
    local ability = self:GetAbility()
    local duration = self:GetSpecialValueFor( "debuff_boost_duration" )
        
    caster:AddNewModifier(caster, self, "modifier_item_Non_Mage_Key_debuff", {duration = duration})
end

modifier_item_Non_Mage_Key_debuff=class({})

function modifier_item_Non_Mage_Key_debuff:GetTexture()
    return "item_Non_Mage_Key"
end

function modifier_item_Non_Mage_Key_debuff:IsDebuff()
    return true
end

function modifier_item_Non_Mage_Key_debuff:IsHidden()
    return false
end

function modifier_item_Non_Mage_Key_debuff:IsPurgable()
    return false
end

function modifier_item_Non_Mage_Key_debuff:IsPurgeException()
    return false
end

function modifier_item_heavens_halberd_v2_debuff:RemoveOnDeath()
    return true
end

function modifier_item_Non_Mage_Key:DeclareFunctions()
	return {
		GetModifierSpellAmplify_Percentage
	}
end 

function modifier_item_Non_Mage_Key:GetModifierSpellAmplify_Percentage()
    
    return -(self:GetAbility():GetSpecialValueFor("active_boost"))
end
    
