ability_yukari_01 = {}

function ability_yukari_01:GetCastRange()
	return self:GetSpecialValueFor("cast_range")
end

function ability_yukari_01:OnSpellStart()
	if not IsServer() then return end
	self.caster     = self:GetCaster()
	self.damage     = self:GetSpecialValueFor("damage")
	self.speed      = self:GetSpecialValueFor("speed")
	self.radius     = self:GetSpecialValueFor("radius")
	self.range      = self:GetSpecialValueFor("range")
	self.num        = self:GetSpecialValueFor("num")
	self.factor     = self:GetSpecialValueFor("factor")
	self.damage_add = self:GetSpecialValueFor("damage_add")

	self.caster:EmitSound("ability_yukari_01")

	local angle           = -15.5

	self.low_speed        = 500
	self.projectile_table = {}
	local caster          = self.caster
	caster.yukari_01      = false
	local start_position  = caster:GetOrigin()
	local qangle          = QAngle(-20, 32, -20)
	local end_position    = self.caster:GetOrigin() +
		(self:GetCursorPosition() - self.caster:GetOrigin()):Normalized() *
		(self.range + self.caster:GetCastRangeBonus())
	end_position          = RotatePosition(caster:GetAbsOrigin(), qangle, end_position)
	yukari_01CreateProjectile(caster, self, start_position, end_position, self.low_speed, 1)
	for i = 2, self.num do
		qangle       = QAngle(0, angle, 0)
		end_position = RotatePosition(caster:GetAbsOrigin(), qangle, end_position)
		yukari_01CreateProjectile(caster, self, start_position, end_position, self.low_speed, i)
	end
end

function yukari_01CreateProjectile(caster, ability, start_position, end_position, speed, i)
	local caster      = caster
	local ability     = ability
	-- local distance 			= ability:GetSpecialValueFor("cast_range")
	local distance    = (end_position - start_position):Length2D()
	local DeleteOnHit = ture
	-- local particle    = "particles/econ/items/puck/puck_merry_wanderer/puck_illusory_orb_merry_wanderer.vpcf"
	local particle    = "particles/units/heroes/hero_mirana/mirana_spell_arrow.vpcf"
	if speed == ability.low_speed then
		distance = 0
	end
	local barrage = ProjectileManager:CreateLinearProjectile({
		Source = caster,
		Ability = ability,
		vSpawnOrigin = start_position,
		bDeleteOnHit = DeleteOnHit,
		EffectName = particle,
		fDistance = distance,
		fStartRadius = ability.radius,
		fEndRadius = ability.radius,

		vVelocity = ((end_position - start_position) * Vector(1, 1, 0)):Normalized() * speed,
		bReplaceExisting = false,
		bProvidesVision = true,
		iVisionRadius = 650,
		iVisionTeamNumber = caster:GetTeamNumber(),
		bHasFrontalCone = false,
		iUnitTargetTeam = ability:GetAbilityTargetTeam(),
		iUnitTargetType = ability:GetAbilityTargetType(),
	})
	local projectile = { barrage = barrage, end_position = end_position }
	ability.projectile_table[i] = projectile
end

function ability_yukari_01:OnProjectileHitHandle(hTarget, vLocation, iProjectileHandle)
	if not IsServer() then return end
	local caster = self.caster
	local target = hTarget
	local ability = self
	local damage = self.damage + caster:GetIntellect(false) * self.damage_add

	if target == nil and caster.yukari_01 == false then
		for i = 1, #self.projectile_table do
			if self.projectile_table[i].barrage == iProjectileHandle then
				yukari_01CreateProjectile(caster, self, vLocation, self.projectile_table[i].end_position, ability.speed,
					i)
			end
		end

		caster:SetContextThink("yukari_01",
			function()
				caster.yukari_01 = true
			end,
			0)
	end
	if target ~= nil and caster.yukari_01 == true then
		target:AddNewModifier(caster, self, "modifier_yukari_01_hitcount", { duration = 1 })
		local count = target:GetModifierStackCount("modifier_yukari_01_hitcount", nil)
		target:SetModifierStackCount("modifier_yukari_01_hitcount", self, count + 1)

		target:EmitSound("ability_yukari_01")
		if count > 0 then
			damage = damage * self.factor
		end
		local damageTable = {
			victim = target,
			damage = damage,
			damage_type = ability:GetAbilityDamageType(),
			attacker = caster,
			ability = ability
		}
		damage_dealt = UnitDamageTarget(damageTable)
		if count < 1 then
			target:AddNewModifier(caster, self, "modifier_stunned",
				{ Duration = self:GetSpecialValueFor("stun_duration") })
		end
	end
end

modifier_yukari_01_hitcount = {}
LinkLuaModifier("modifier_yukari_01_hitcount", "scripts/vscripts/heroes/hero_yukari/yukari01.lua",
	LUA_MODIFIER_MOTION_NONE)
function modifier_yukari_01_hitcount:IsHidden() return true end

function modifier_yukari_01_hitcount:IsPurgable() return false end

function modifier_yukari_01_hitcount:RemoveOnDeath() return true end

function modifier_yukari_01_hitcount:IsDebuff() return true end
