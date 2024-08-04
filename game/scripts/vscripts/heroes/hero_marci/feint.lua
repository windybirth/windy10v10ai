
marci_feint_custom = class({
    GetIntrinsicModifierName = function()
        return "modifier_marci_feint_custom"
    end,
    GetCastRange = function(self)
        return self:GetSpecialValueFor("max_range")
    end
})

function marci_feint_custom:SetIsProc(value)
    self._isProc = value
end

function marci_feint_custom:IsProc()
    return self._isProc or false
end

function marci_feint_custom:Precache(context)
    PrecacheResource("particle", "particles/custom/marci/feint/feint.vpcf", context)
end

modifier_marci_feint_custom = class({
    IsHidden = function() 
        return true 
    end,
    IsPurgable = function() 
        return false 
    end,
    IsPurgeException = function() 
        return false 
    end,
    RemoveOnDeath = function()
        return true
    end,
    IsDebuff = function() 
        return false 
    end,
    RegisterFunctions = function() 
        return 
        {
            MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
			MODIFIER_EVENT_ON_ATTACK_LANDED,
			MODIFIER_EVENT_ON_ATTACK_FAIL
        } 
    end,
	CheckState = function()
        return {
            [MODIFIER_STATE_SILENCED] = false,
            [MODIFIER_STATE_MUTED] = false,
			[MODIFIER_STATE_FEARED] = false,
			[MODIFIER_STATE_DISARMED] = false
        }
    end,
    GetModifierDamageOutgoing_Percentage = function(self)
        return self.bonusDamagePct
    end
})

function modifier_marci_feint_custom:OnCreated()
    self.parent = self:GetParent()
    self.ability = self:GetAbility()
    self:OnRefresh()
end

function modifier_marci_feint_custom:OnRefresh()
    self.ability = self:GetAbility() or self.ability
    if(not self.ability) then
        return
    end
    self.procChance = self.ability:GetSpecialValueFor("chance")
    self.attackDamagePctToDamage = self.ability:GetSpecialValueFor("attack_damage_pct_to_damage") - 100
	self.procChanceOnEvasion = self.ability:GetSpecialValueFor("evasion_chance_multiplier") * self.procChance
end

function modifier_marci_feint_custom:OnAttackLanded(kv)
    if(kv.target ~= self.parent) then
        return
    end
    if(self.parent:PassivesDisabled()) then
        return
    end
    if(self.ability:IsCooldownReady() == false or self.ability:IsActivated() == false) then
        return
    end
    if(RollPercentage(self.procChance) == false) then
        return
    end
    if(self:CanPerformCounterAttack(kv.attacker) == false) then
        return
    end
    self:PerformCounterAttack(kv.attacker)
    self.ability:UseResources(false, false, true)
end

function modifier_marci_feint_custom:OnAttackFail(kv)
    if(kv.target ~= self.parent) then
        return
    end
    if(self.parent:PassivesDisabled()) then
        return
    end
    if(self.ability:IsCooldownReady() == false or self.ability:IsActivated() == false) then
        return
    end
    if(RollPercentage(self.procChanceOnEvasion) == false) then
        return
    end
    if(self:CanPerformCounterAttack(kv.attacker) == false) then
        return
    end
    self:PerformCounterAttack(kv.attacker)
    self.ability:UseResources(false, false, true)
end

function modifier_marci_feint_custom:CanPerformCounterAttack(enemy)
    local procRange = self.ability:GetCastRange(nil, nil)
    procRange = procRange * procRange
    return CalculateDistanceSqr(self.parent, enemy) <= procRange
end

function modifier_marci_feint_custom:PerformCounterAttack(enemy)
    self:SetBonusDamagePercent(self.attackDamagePctToDamage)
    self.ability:SetIsProc(true)
    self.parent:PerformAttack(enemy, true, true, true, false, false, false, true)
    self.ability:SetIsProc(false)
    self:SetBonusDamagePercent(0)
    local particle = ParticleManager:CreateParticle(
        "particles/custom/units/heroes/marci/feint/feint.vpcf",
        PATTACH_ABSORIGIN_FOLLOW,
        self.parent
    )
    ParticleManager:SetParticleControlEnt(particle, 1, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", Vector(0, 0, 0), true)
    ParticleManager:SetParticleControlOrientation(
        particle, 
        1, 
        CalculateDirection(enemy, self.parent), 
        self.parent:GetRightVector(), 
        self.parent:GetUpVector()
    )
    ParticleManager:ReleaseParticleIndex(particle)
end

function modifier_marci_feint_custom:SetBonusDamagePercent(value)
    self.bonusDamagePct = value
end



LinkLuaModifier("modifier_marci_feint_custom", "abilities/heroes/hero_marci/feint", LUA_MODIFIER_MOTION_NONE, modifier_marci_feint_custom)
