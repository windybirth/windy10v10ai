
monkey_king_boundless_strike_custom = class({})

function monkey_king_boundless_strike_custom:GetCastRange()
    return self:GetSpecialValueFor("strike_range")
end

function monkey_king_boundless_strike_custom:OnAbilityPhaseStart()
    local caster = self:GetCaster()

    EmitSoundOn("Hero_MonkeyKing.Strike.Cast", caster)

    local nfx = ParticleManager:CreateParticle("particles/yukari_true_moon.vpcf", PATTACH_POINT_FOLLOW, caster)
                ParticleManager:SetParticleControl(nfx, 0, caster:GetAbsOrigin())
                ParticleManager:SetParticleControlEnt(nfx, 1, caster, PATTACH_POINT_FOLLOW, "attach_weapon_bot", caster:GetAbsOrigin(), true)
                ParticleManager:SetParticleControlEnt(nfx, 2, caster, PATTACH_POINT_FOLLOW, "attach_weapon_top", caster:GetAbsOrigin(), true)
                ParticleManager:ReleaseParticleIndex(nfx, 2.5)

    return true
end

function monkey_king_boundless_strike_custom:OnSpellStart()
    if(not IsServer()) then
        return
    end
    local caster = self:GetCaster()
    local point = self:GetCursorPosition()
    local casterPos = caster:GetAbsOrigin()

    local duration = self:GetSpecialValueFor("stun_duration")
    local width = self:GetSpecialValueFor("strike_radius")
    local range = self:GetSpecialValueFor("strike_range") - 75 --blame Valve

    local direction = CalculateDirection(point, casterPos)

    local startPos = caster:GetAbsOrigin() + direction * 75 --blame Valve
    local endPos = startPos + direction * range

    EmitSoundOnLocationWithCaster(startPos, "Hero_MonkeyKing.Strike.Impact", caster)
    EmitSoundOnLocationWithCaster(endPos, "Hero_MonkeyKing.Strike.Impact.EndPos", caster)

    local nfx = ParticleManager:CreateParticle("particles/yukari_true_moon.vpcf", PATTACH_POINT, caster)
                ParticleManager:SetParticleControlForward(nfx, 0, direction)
                ParticleManager:SetParticleControl(nfx, 1, endPos)
                ParticleManager:ReleaseParticleIndex(nfx, 2.5)

    caster:AddNewModifier(caster, self, "modifier_monkey_king_boundless_strike_custom", {Duration = 0.1})
    local enemies = FindUnitsInLine(
        caster:GetTeamNumber(),
        startPos,
        endPos,
        nil,
        width,
        self:GetAbilityTargetTeam(),
        self:GetAbilityTargetType(),
        self:GetAbilityTargetFlags()
    )
    local stunDuration = self:GetSpecialValueFor("stun_duration")
    for _, enemy in pairs(enemies) do
        enemy:AddNewModifier(caster, self, "modifier_stunned", {duration = stunDuration})
        caster:PerformAttack(enemy, true, true, true, true, false, false, true)
    end
    caster:RemoveModifierByName("modifier_monkey_king_boundless_strike_custom")
    caster:RemoveModifierByName("modifier_monkey_king_jingu_mastery_custom_buff")
end

modifier_monkey_king_boundless_strike_custom = class({
	IsHidden 				= function(self) return true end,
	IsPurgable 				= function(self) return false end,
	IsDebuff 				= function(self) return false end,
	IsBuff                  = function(self) return true end,
	RemoveOnDeath 			= function(self) return false end
})


function modifier_monkey_king_boundless_strike_custom:GetModifierPreAttack_CriticalStrike()
    return self:GetAbility():GetSpecialValueFor("crit_multiplier")
end

function modifier_monkey_king_boundless_strike_custom:GetCritDamage()
    return self:GetAbility():GetSpecialValueFor("crit_multiplier") / 100
end

function modifier_monkey_king_boundless_strike_custom:GetSuppressCleave()
    return 1
end

monkey_king_warrior_attack = class(monkey_king_boundless_strike_custom)


LinkLuaModifier("modifier_monkey_king_boundless_strike_custom", "heroes/hero_monkey_king/boundless_strike_custom", LUA_MODIFIER_MOTION_NONE, modifier_monkey_king_boundless_strike_custom)
