modifier_yukari_tp = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_yukari_tp:IsHidden()
	return false
end

function modifier_yukari_tp:IsDebuff()
	return self:GetCaster():GetTeamNumber()~=self:GetParent():GetTeamNumber()
end

function modifier_yukari_tp:IsStunDebuff()
	return true
end

function modifier_yukari_tp:IsPurgable()
	return true
end

function modifier_yukari_tp:RemoveOnDeath()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_yukari_tp:OnCreated( kv )
	-- references
	local damage = self:GetAbility():GetSpecialValueFor( "damage" )
	self.radius = self:GetAbility():GetSpecialValueFor( "radius" )
	

	if not IsServer() then return end
	-- precache damage
	self.damageTable = {
		-- victim = target,
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = self:GetAbility():GetAbilityDamageType(),
		ability = self:GetAbility(), --Optional.
	}
	-- ApplyDamage(damageTable)

	-- play effects
	self:GetParent():AddNoDraw()
	self:PlayEffects()
	
end


function modifier_yukari_tp:OnRefresh( kv )
	-- references
	local damage = self:GetAbility():GetSpecialValueFor( "damage" )
	self.radius = self:GetAbility():GetSpecialValueFor( "radius" )

	if not IsServer() then return end
	-- update damage
	self.damageTable.damage = damage
end

function modifier_yukari_tp:OnRemoved()
end

function modifier_yukari_tp:OnDestroy()
	if not IsServer() then return end
	-- find enemies
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	for _,enemy in pairs(enemies) do
		-- apply damage
		self.damageTable.victim = enemy
		ApplyDamage( self.damageTable )

		-- play overhead event
		SendOverheadEventMessage(
			nil,
			OVERHEAD_ALERT_BONUS_SPELL_DAMAGE,
			self:GetParent(),
			self.damageTable.damage,
			nil
		)
	end
	

	-- play effects
	self:GetParent():RemoveNoDraw()
	local sound_loop = "ability_yukari_op"
	StopSoundOn( sound_loop, self:GetCaster() )

	local sound_cast = "ability_yukari_op"
	EmitSoundOnLocationWithCaster( self:GetParent():GetOrigin(), sound_cast, self:GetCaster() )
	local caster = self:GetCaster()
	local knockback = { should_stun = 1,
                        knockback_duration = 0.5,
                        duration = 0.5,
                        knockback_distance = 0,
                        knockback_height = 300,
                        center_x = caster:GetAbsOrigin().x,
                        center_y = caster:GetAbsOrigin().y,
                        center_z = caster:GetAbsOrigin().z }

    self:GetParent():AddNewModifier(caster, self, "modifier_knockback", knockback)
	self:PlayEffects2()
end

--------------------------------------------------------------------------------
-- Status Effects
function modifier_yukari_tp:CheckState()
	local state = {
		[MODIFIER_STATE_OUT_OF_GAME] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_STUNNED] = true,
	}

	return state
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_yukari_tp:PlayEffects()
	-- Get Resources
	local particle_cast1 = "particles/yukari_portal.vpcf"
	local particle_cast2 = ""
	local sound_loop = "ability_yukari_op"

	-- Create Particle
	local effect_cast1 = ParticleManager:CreateParticle( particle_cast1, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast1, 0, self:GetParent():GetOrigin() )

	local effect_cast2 = ParticleManager:CreateParticleForTeam( particle_cast2, PATTACH_WORLDORIGIN, nil, self:GetCaster():GetTeamNumber() )
	ParticleManager:SetParticleControl( effect_cast2, 0, self:GetParent():GetOrigin() )

	-- buff particle
	self:AddParticle(
		effect_cast1,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	self:AddParticle(
		effect_cast2,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	-- Create Sound
	EmitSoundOnLocationWithCaster( self:GetParent():GetOrigin(), sound_loop, self:GetCaster() )
end
function modifier_yukari_tp:PlayEffects2()
	-- Get Resources
	local particle_cast1 = "particles/yukari_portal_out.vpcf"
	local particle_cast2 = ""
	local sound_loop = "yukari.portal_out"

	-- Create Particle
	local effect_cast1 = ParticleManager:CreateParticle( particle_cast1, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast1, 0, self:GetParent():GetOrigin() )

	local effect_cast2 = ParticleManager:CreateParticleForTeam( particle_cast2, PATTACH_WORLDORIGIN, nil, self:GetCaster():GetTeamNumber() )
	ParticleManager:SetParticleControl( effect_cast2, 0, self:GetParent():GetOrigin() )

	-- buff particle
	self:AddParticle(
		effect_cast1,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	self:AddParticle(
		effect_cast2,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	-- Create Sound
	EmitSoundOnLocationWithCaster( self:GetParent():GetOrigin(), sound_loop, self:GetCaster() )
end