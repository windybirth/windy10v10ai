local StackToPercentage = function (iStackCount)
	if iStackCount == 1 then
		return 0.5
	elseif iStackCount == 2 then
		return 0.75
	elseif iStackCount == 3 then
		return 1.0
	elseif iStackCount == 4 then
		return 1.25
	elseif iStackCount == 5 then
		return 1.5
	elseif iStackCount == 6 then
		return 1.75
	elseif iStackCount == 7 then
		return 2.0
	elseif iStackCount == 8 then
		return 2.5
	elseif iStackCount == 9 then
		return 3.0
	elseif iStackCount == 10 then
		return 4.0
	elseif iStackCount == 11 then
		-- for test
		return 5.0
	else
		return 1.0
	end
end

--------------------------------------------------------------------------------
-- Tower modifier
--------------------------------------------------------------------------------
modifier_tower_heal = class({})

function modifier_tower_heal:IsPurgable() return false end
function modifier_tower_heal:IsHidden() return true end
function modifier_tower_heal:IsDebuff() return false end

function modifier_tower_heal:DeclareFunctions() return {MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT} end

function modifier_tower_heal:GetModifierConstantHealthRegen()
	return self:GetStackCount()
end


modifier_tower_endure = class({})

function modifier_tower_endure:IsPurgable() return false end
function modifier_tower_endure:IsDebuff() return false end
function modifier_tower_endure:GetTexture() return "tower_endure" end

function modifier_tower_endure:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_TOOLTIP
	}
end

function modifier_tower_endure:OnCreated()
	if IsClient() then return end
	local hParent = self:GetParent()
	local iHealth = hParent:GetMaxHealth()
	local newHealth = math.floor(StackToPercentage(AIGameMode.iTowerEndure)*iHealth)
	Timers:CreateTimer(0.1, function ()
		if hParent:IsNull() then return end
		hParent:SetMaxHealth( newHealth )
		hParent:SetBaseMaxHealth( newHealth )
		hParent:SetHealth( newHealth )
	end)
end

function modifier_tower_endure:OnTooltip()
	return 100*StackToPercentage(self:GetStackCount())
end


-------------------------------------------------
-- NPC Think
-------------------------------------------------
modifier_sniper_assassinate_thinker = class({})

function modifier_sniper_assassinate_thinker:IsHidden() return true end
function modifier_sniper_assassinate_thinker:IsPurgable() return false end
function modifier_sniper_assassinate_thinker:RemoveOnDeath() return false end

function modifier_sniper_assassinate_thinker:OnCreated()
	self:StartIntervalThink(0.1)
end

function modifier_sniper_assassinate_thinker:OnIntervalThink()
	if IsClient() then return end
	local hParent = self:GetParent()
	local hAssassinate = hParent:FindAbilityByName("sniper_assassinate")
	local hAssassinateUpgrade = hParent:FindAbilityByName("sniper_assassinate_upgrade")
	local iLevel = hAssassinate:GetLevel()
	local iUpgradeLevel = hAssassinateUpgrade:GetLevel()

	if hParent:HasScepter() then
		if hAssassinateUpgrade:IsHidden() then
			hAssassinateUpgrade:SetHidden(false)
		end

		if iUpgradeLevel < iLevel then
			hAssassinateUpgrade:SetLevel(iLevel)
		elseif iUpgradeLevel > iLevel then
			hAssassinate:SetLevel(iUpgradeLevel)
		end
	end

	if not hParent:HasScepter() and not hAssassinateUpgrade:IsHidden() then
		hAssassinateUpgrade:SetHidden(true)
	end
end


modifier_sniper_assassinate_target = class({})

function modifier_sniper_assassinate_target:IsPurgable() return false end
function modifier_sniper_assassinate_target:DeclareFunctions() return {MODIFIER_EVENT_ON_DEATH} end

function modifier_sniper_assassinate_target:OnDeath(keys)
	local hParent = self:GetParent()
	if keys.target ~= hParent then return end
	local hAbility = self.GetAbility()
	if hAbility.tTargets then
		for i, v in ipairs(hAbility.tTargets) do
			if v == hParent() then
				table.remove(hAbility.tTargets, i)
			end
		end
	end
end

function modifier_sniper_assassinate_target:CheckState() return {[MODIFIER_STATE_INVISIBLE] = false, [MODIFIER_STATE_PROVIDES_VISION] = true} end

function modifier_sniper_assassinate_target:OnCreated()
	self.iParticle = ParticleManager:CreateParticleForTeam("particles/econ/items/sniper/sniper_charlie/sniper_crosshair_charlie.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent(), self:GetCaster():GetTeamNumber())
end

function modifier_sniper_assassinate_target:OnDestroy()
	ParticleManager:DestroyParticle(self.iParticle, true)
	ParticleManager:ReleaseParticleIndex(self.iParticle)
end


modifier_assassinate_caster_crit = class({})

function modifier_assassinate_caster_crit:DeclareFunctions() return {MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE} end

function modifier_assassinate_caster_crit:GetModifierPreAttack_CriticalStrike() return self:GetAbility():GetSpecialValueFor("scepter_crit_bonus") end


modifier_out_of_world = class({})

function modifier_out_of_world:IsDebuff() return false end

function modifier_out_of_world:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
	}
end
