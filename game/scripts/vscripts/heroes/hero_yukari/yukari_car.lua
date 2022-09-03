yukari_car = class({})
LinkLuaModifier( "modifier_generic_stunned_lua", "modifiers/modifier_generic_stunned_lua", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Ability Start
function yukari_car:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()
	local origin = caster:GetOrigin()
	local point = self:GetCursorPosition() + (caster:GetForwardVector() * 1)

	-- load data
	local projectile_name = "particles/yukari_car.vpcf"
	local projectile_speed = self:GetSpecialValueFor("arrow_speed")
	local projectile_distance = self:GetSpecialValueFor("arrow_range")
	local projectile_start_radius = self:GetSpecialValueFor("arrow_width")
	local projectile_end_radius = self:GetSpecialValueFor("arrow_width")
	local projectile_vision = self:GetSpecialValueFor("arrow_vision")

	local min_damage = self:GetAbilityDamage()
	local bonus_damage = self:GetSpecialValueFor( "arrow_bonus_damage" )
	local min_stun = self:GetSpecialValueFor( "arrow_min_stun" )
	local max_stun = self:GetSpecialValueFor( "arrow_max_stun" )
	local max_distance = self:GetSpecialValueFor( "arrow_max_stunrange" )

	local projectile_direction = (Vector( point.x-origin.x, point.y-origin.y, 0 )):Normalized()

	-- logic
	local info = {
		Source = caster,
		Ability = self,
		vSpawnOrigin = caster:GetOrigin(),
		
	    bDeleteOnHit = true,
	    
	    iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
	    iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
	    iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	    
	    EffectName = projectile_name,
	    fDistance = projectile_distance,
	    fStartRadius = projectile_start_radius,
	    fEndRadius =projectile_end_radius,
		vVelocity = projectile_direction * projectile_speed,
	
		bHasFrontalCone = false,
		bReplaceExisting = false,
		fExpireTime = GameRules:GetGameTime() + 10.0,
		
		bProvidesVision = true,
		iVisionRadius = projectile_vision,
		iVisionTeamNumber = caster:GetTeamNumber(),

		ExtraData = {
			originX = origin.x,
			originY = origin.y,
			originZ = origin.z,

			max_distance = max_distance,
			min_stun = min_stun,
			max_stun = max_stun,

			min_damage = min_damage,
			bonus_damage = bonus_damage,
		}
	}
	ProjectileManager:CreateLinearProjectile(info)

	-- Effects
	if self:GetCaster():HasModifier( "modifier_item_ultimate_scepter" ) then
	EmitSoundOn( "yukari.car2", caster )
	else
	EmitSoundOn( "yukari.car", caster )
end
end

--------------------------------------------------------------------------------
-- Projectile
function yukari_car:OnProjectileHit_ExtraData( hTarget, vLocation, extraData )
	if hTarget==nil then return end

	-- calculate distance percentage
	local origin = Vector( extraData.originX, extraData.originY, extraData.originZ )
	local distance = (vLocation-origin):Length2D()
	local bonus_pct = math.min(1,distance/extraData.max_distance)

	-- damage
	if (not hTarget:IsConsideredHero()) and (not hTarget:IsAncient()) and (not hTarget:IsMagicImmune()) then
		local damageTable = {
			victim = hTarget,
			attacker = self:GetCaster(),
			damage = hTarget:GetHealth() + 1,
			damage_type = DAMAGE_TYPE_PURE,
			ability = self, --Optional.
			damage_flags = DOTA_DAMAGE_FLAG_HPLOSS, --Optional.
		}
		ApplyDamage(damageTable)
		return true
	end

	local damageTable = {
		victim = hTarget,
		attacker = self:GetCaster(),
		damage = self:GetAbilityDamage(),
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self, --Optional.
	}
	ApplyDamage(damageTable)

	-- stun
	hTarget:AddNewModifier(
		self:GetCaster(), -- player source
		self, -- ability source
		"modifier_generic_stunned_lua", -- modifier name
		{ duration = self:GetSpecialValueFor( "arrow_max_stun" )  } -- kv
	)

	AddFOWViewer( self:GetCaster():GetTeamNumber(), vLocation, 500, 3, false )

	-- effects
	local sound_cast = "yukari.explosion"
	EmitSoundOn( sound_cast, hTarget )

	return true
end