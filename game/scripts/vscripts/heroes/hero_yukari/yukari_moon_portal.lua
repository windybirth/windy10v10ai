LinkLuaModifier("modifier_yukari_moon_portal", "heroes/hero_yukari/yukari_moon_portal", LUA_MODIFIER_MOTION_BOTH)
LinkLuaModifier("modifier_yukari_tp", "modifiers/hero_yukari/modifier_yukari_tp", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_yukari_tp_3", "modifiers/hero_yukari/modifier_yukari_tp_3", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_yukari_moon_portal_root", "heroes/hero_yukari/yukari_moon_portal", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_yukari_moon_portal_caster", "heroes/hero_yukari/yukari_moon_portal", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_yukari_leashed", "heroes/hero_yukari/yukari_moon_portal", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_yukari_muted", "heroes/hero_yukari/yukari_moon_portal", LUA_MODIFIER_MOTION_NONE)
yukari_moon_portal = class({})
function yukari_moon_portal:IsHiddenWhenStolen()
    return false
end
function yukari_moon_portal:IsRefreshable()
    return true
end
function yukari_moon_portal:IsStealable()
    return true
end
function yukari_moon_portal:IsNetherWardStealable()
    return true
end
-------------------------------------------

function yukari_moon_portal:CastFilterResultTarget(target)
    if target == self:GetCaster() and self:GetCaster():IsRooted() then
        return UF_FAIL_CUSTOM
    else
        return UnitFilter(target, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, self:GetCaster():GetTeamNumber())
    end
end

--function yukari_moon_portal:GetCustomCastErrorTarget(target)
--if target == self:GetCaster() and self:GetCaster():IsRooted() then
--return "dota_hud_error_ability_disabled_by_root"
--end
--end

function yukari_moon_portal:OnSpellStart(params)
    local caster = self:GetCaster()
    -- Handler on lifted targets
    if caster:HasModifier("modifier_yukari_moon_portal_caster") then
        local teleportLoc = self:GetCursorPosition()
        -- for caster self
        local toSelfBuff = self.target:FindModifierByNameAndCaster("modifier_yukari_tp_3", caster)
        if toSelfBuff ~= nil then
            toSelfBuff.teleportLoc = teleportLoc
        end
        -- for others
        local toOthersBuff = self.target:FindModifierByNameAndCaster("modifier_yukari_tp", caster)
        if toOthersBuff ~= nil then
            toOthersBuff.teleportLoc = teleportLoc
        end
    else
        self.target = self:GetCursorTarget()
        -- disable help
        if PlayerResource:IsDisableHelpSetForPlayerID(self.target:GetPlayerOwnerID(), caster:GetPlayerOwnerID()) then
            self:EndCooldown()
            self:RefundManaCost()
            return false
        end
        local targetLoc = self.target:GetOrigin()
        local duration = self:GetSpecialValueFor("lift_duration")
        -- Create modifier and check Linken
        if self.target:GetTeam() ~= caster:GetTeam() then
            if self.target:TriggerSpellAbsorb(self) then
                return nil
            end
            self.target:AddNewModifier(caster, self, "modifier_yukari_muted", { duration = duration + 0.5 })
            self.target:AddNewModifier(caster, self, "modifier_yukari_tp", { duration = duration })
            self.target:FindModifierByNameAndCaster("modifier_yukari_tp", caster).teleportLoc = targetLoc
            --EmitSoundOn( "yukari.car", caster )
        else
            if self.target == self:GetCaster() then
                self.target:AddNewModifier(caster, self, "modifier_yukari_tp_3", { duration = duration })
                self.target:FindModifierByNameAndCaster("modifier_yukari_tp_3", caster).teleportLoc = targetLoc
                --EmitSoundOn( "yukari.car2", caster )
            else
                self.target:AddNewModifier(caster, self, "modifier_yukari_tp", { duration = duration })
                self.target:FindModifierByNameAndCaster("modifier_yukari_tp", caster).teleportLoc = targetLoc
                --EmitSoundOn( "yukari.slash", caster )
            end
        end
        -- Add the particle & sounds
        caster:EmitSound("yukari.portal")
        -- Add caster handler
        caster:AddNewModifier(caster, self, "modifier_yukari_moon_portal_caster", { duration = duration })
        caster:AddNewModifier(caster, self, "modifier_yukari_leashed", { duration = duration + FrameTime() })
        self:EndCooldown()
    end
end

function yukari_moon_portal:GetAbilityTextureName()
    if self:GetCaster():HasModifier("modifier_yukari_moon_portal_caster") then
        return "yukari_1_1"
    end
    return "yukari_1"
end

function yukari_moon_portal:GetBehavior()
    if self:GetCaster():HasModifier("modifier_yukari_moon_portal_caster") then
        return DOTA_ABILITY_BEHAVIOR_POINT
    end
    return DOTA_ABILITY_BEHAVIOR_UNIT_TARGET
end

function yukari_moon_portal:GetManaCost(target)
    if self:GetCaster():HasModifier("modifier_yukari_moon_portal_caster") then
        return 0
    else
        return self.BaseClass.GetManaCost(self, target)
    end
end

function yukari_moon_portal:GetCastRange(location, target)
    if self:GetCaster():HasModifier("modifier_yukari_moon_portal_caster") then
        if self.target == self:GetCaster() then
            return 99999
        end
    end
    return self:GetSpecialValueFor("cast_range")
end

modifier_yukari_moon_portal_caster = class({})
function modifier_yukari_moon_portal_caster:IsDebuff()
    return false
end
function modifier_yukari_moon_portal_caster:IsHidden()
    return true
end
function modifier_yukari_moon_portal_caster:IsPurgable()
    return false
end
function modifier_yukari_moon_portal_caster:IsPurgeException()
    return false
end
function modifier_yukari_moon_portal_caster:IsStunDebuff()
    return false
end
function modifier_yukari_moon_portal_caster:RemoveOnDeath()
    return true
end

function modifier_yukari_moon_portal_caster:OnDestroy()
    if not IsServer() then
        return
    end

    self.ability = self:GetAbility()
    self.parent = self:GetParent()

    local cooldown = self.ability:GetCooldown(-1) * self.parent:GetCooldownReduction() - self.ability:GetSpecialValueFor("lift_duration")

    self.ability:EndCooldown()
    self.ability:StartCooldown(cooldown)

end

modifier_yukari_leashed = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_yukari_leashed:IsHidden()
    return true
end

function modifier_yukari_leashed:IsDebuff()
    return false
end

function modifier_yukari_leashed:IsStunDebuff()
    return false
end

function modifier_yukari_leashed:IsPurgable()
    if not IsServer() then
        return
    end
    return false
end

function modifier_yukari_leashed:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_yukari_leashed:OnCreated(kv)
    if not IsServer() then
        return
    end
    self.parent = self:GetParent()
    --[[
    kv data (default):
        center_x/y (origin)
        radius (300)
        rooted (true)
        purgable (true)
    ]]
    -- load types
    self.rooted = true
    self.purgable = true
    if kv.rooted then
        self.rooted = kv.rooted == 1
    end
    if kv.purgable then
        self.purgable = kv.purgable == 1
    end
    if self.rooted then
        self:SetStackCount(1)
    end

    -- load values
    self.radius = kv.radius or 500
    if kv.center_x and kv.center_y then
        self.center = Vector(kv.center_x, kv.center_y, 0)
    else
        self.center = self:GetParent():GetOrigin()
    end

    -- consts
    self.max_speed = 550
    self.min_speed = 0.1
    self.max_min = self.max_speed - self.min_speed
    self.half_width = 50
end

function modifier_yukari_leashed:OnRefresh(kv)

end

function modifier_yukari_leashed:OnRemoved()
end

function modifier_yukari_leashed:OnDestroy()
    if not IsServer() then
        return
    end
    if self.endCallback then
        self.endCallback()
    end
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_yukari_leashed:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_LIMIT,
    }

    return funcs
end

function modifier_yukari_leashed:GetModifierMoveSpeed_Limit(params)
    if not IsServer() then
        return
    end

    -- get data
    local parent_vector = self.parent:GetOrigin() - self.center
    local parent_direction = parent_vector:Normalized()
    local actual_distance = parent_vector:Length2D()
    local wall_distance = self.radius - actual_distance

    -- if outside of leash, destroy
    if wall_distance < (-self.half_width) then
        self:Destroy()
        return 0
    end

    -- calculate facing angle
    local parent_angle = VectorToAngles(parent_direction).y
    local unit_angle = self:GetParent():GetAnglesAsVector().y
    local wall_angle = math.abs(AngleDiff(parent_angle, unit_angle))

    -- calculate movespeed limit
    local limit = 0
    if wall_angle <= 90 then
        -- facing outside
        if wall_distance < 0 then
            -- at max radius
            limit = self.min_speed
            -- self:RemoveMotions()
        else
            -- about to max radius, interpolate
            limit = (wall_distance / self.half_width) * self.max_min + self.min_speed
        end
    end

    return limit
end

--------------------------------------------------------------------------------
-- Status Effects
function modifier_yukari_leashed:CheckState()
    local state = {
        [MODIFIER_STATE_TETHERED] = self:GetStackCount() == 1,
    }

    return state
end

--------------------------------------------------------------------------------
-- Helper
function modifier_yukari_leashed:SetEndCallback(func)
    self.endCallback = func
end
modifier_yukari_muted = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_yukari_muted:IsDebuff()
    return true
end

function modifier_yukari_muted:IsStunDebuff()
    return false
end

function modifier_yukari_muted:IsPurgable()
    return true
end

--------------------------------------------------------------------------------
-- Modifier State
function modifier_yukari_muted:CheckState()
    local state = {
        [MODIFIER_STATE_SILENCED] = true,
        [MODIFIER_STATE_MUTED] = true
    }

    return state
end

--------------------------------------------------------------------------------
-- Graphics and animations
function modifier_yukari_muted:GetEffectName()
    return "particles/generic_gameplay/generic_silenced.vpcf"
end

function modifier_yukari_muted:GetEffectAttachType()
    return PATTACH_OVERHEAD_FOLLOW
end
