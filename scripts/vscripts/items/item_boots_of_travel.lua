-- Credit: Nocturne of Shadows

slot_color = {}

slot_color[0] = Vector( 0, 0, 1 )
slot_color[1] = Vector( 0, 1, 1 )
slot_color[2] = Vector( 1, 0, 1 )
slot_color[3] = Vector( 1, 1, 0 )
slot_color[4] = Vector( 1, 0, 0 )

-- ok valve i did it (i guess)

if item_boots_of_travel == nil then item_boots_of_travel = class({}) end
LinkLuaModifier( "modifier_item_boots_of_travel_passive", "items/item_boots_of_travel.lua", LUA_MODIFIER_MOTION_NONE )

function item_boots_of_travel:GetIntrinsicModifierName()
	return "modifier_item_boots_of_travel_passive"
end

function item_boots_of_travel:GetAbilityTextureName()
	return "item_travel_boots"
end

function item_boots_of_travel:OnSpellStart()
	local caster = self:GetCaster()
	self.position = self:GetCursorPosition()
	local duration = self:GetChannelTime()
	if caster == nil then
        return
    end
    local particle_cast = "particles/items2_fx/teleport_start.vpcf"
    local particle_cast_2 = "particles/items2_fx/teleport_end.vpcf"

    caster:StartGesture(ACT_DOTA_TELEPORT)

    self.effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN, self:GetCaster() )
    if caster:GetName() == "npc_dota_lone_druid_bear" then
		ParticleManager:SetParticleControl(self.effect_cast, 2, slot_color[0])
	else
		ParticleManager:SetParticleControl(self.effect_cast, 2, slot_color[caster:GetPlayerID()])
	end

    self.dummy = CreateUnitByName("npc_dota_treant_eyes", self.position + Vector(0,0,0), false, caster, caster, caster:GetTeamNumber())
    self.effect_cast_2 = ParticleManager:CreateParticle(particle_cast_2, PATTACH_CUSTOMORIGIN, caster)
	ParticleManager:SetParticleControl(self.effect_cast_2, 0, self.dummy:GetAbsOrigin())
	ParticleManager:SetParticleControl(self.effect_cast_2, 1, self.dummy:GetAbsOrigin())
	if caster:GetName() == "npc_dota_lone_druid_bear" then
		ParticleManager:SetParticleControl(self.effect_cast_2, 2, slot_color[0])
	else
		ParticleManager:SetParticleControl(self.effect_cast_2, 2, slot_color[caster:GetPlayerID()])
	end
	ParticleManager:SetParticleControlEnt(self.effect_cast_2, 3, caster, PATTACH_CUSTOMORIGIN, "attach_hitloc", self.dummy:GetAbsOrigin(), true)
	ParticleManager:SetParticleControl(self.effect_cast_2, 4, Vector(1,0,0))
	ParticleManager:SetParticleControl(self.effect_cast_2, 5, self.dummy:GetAbsOrigin())

    self.dummy:AddNewModifier(caster, self, "modifier_out_of_world", {duration = self.duration})
    self.dummy:SetDayTimeVisionRange(self:GetSpecialValueFor("vision_radius"))
    self.dummy:SetNightTimeVisionRange(self:GetSpecialValueFor("vision_radius"))

    local sound_leaving = "Portal.Loop_Disappear"
    local sound_arrival = "Portal.Loop_Appear"
	EmitSoundOn( sound_leaving, caster )
	EmitSoundOn( sound_arrival, self.dummy )
end

function item_boots_of_travel:OnChannelFinish( bInterrupted )
	local sound_leaving = "Portal.Loop_Disappear"
	local sound_arrival = "Portal.Loop_Appear"
	local sound_left = "Portal.Hero_Disappear"
	local sound_arrived = "Portal.Hero_Appear"
	local caster = self:GetCaster()
	EmitSoundOnLocationWithCaster( caster:GetAbsOrigin(), sound_left, caster )
	StopSoundOn(sound_leaving, caster)
	StopSoundOn(sound_arrival, self.dummy)
	ParticleManager:DestroyParticle(self.effect_cast, false)
	ParticleManager:ReleaseParticleIndex(self.effect_cast)
	ParticleManager:DestroyParticle(self.effect_cast_2, false)
	ParticleManager:ReleaseParticleIndex(self.effect_cast_2)
	self.dummy:ForceKill(false)
	caster:RemoveGesture(ACT_DOTA_TELEPORT)
	caster:StartGesture(ACT_DOTA_TELEPORT_END)
	if not bInterrupted then
		FindClearSpaceForUnit(caster, self.position, true)
		EmitSoundOnLocationWithCaster( caster:GetAbsOrigin(), sound_arrived, caster )
	end
	if bInterrupted then
		self:EndCooldown()
		self:StartCooldown((self:GetCooldown(self:GetLevel()) / 2) * caster:GetCooldownReduction())
	end
end


modifier_item_boots_of_travel_passive = class({})

function modifier_item_boots_of_travel_passive:IsDebuff() return false end
function modifier_item_boots_of_travel_passive:IsHidden() return true end
function modifier_item_boots_of_travel_passive:IsPurgable() return false end
function modifier_item_boots_of_travel_passive:RemoveOnDeath() return false end

function modifier_item_boots_of_travel_passive:DeclareFunctions() return {MODIFIER_PROPERTY_MOVESPEED_BONUS_UNIQUE} end

function modifier_item_boots_of_travel_passive:GetModifierMoveSpeedBonus_Special_Boots()
	return self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
end