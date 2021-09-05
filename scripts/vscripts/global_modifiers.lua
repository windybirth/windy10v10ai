local StackToPercentage = function (iStackCount)
	if iStackCount == 1 then
		return 0.5
	elseif iStackCount == 2 then
		return 0.75
	elseif iStackCount == 4 then
		return 1.25
	elseif iStackCount == 5 then
		return 1.5
	elseif iStackCount == 6 then
		return 1.75
	elseif iStackCount == 7 then
		return 2.0
	elseif iStackCount == 8 then
		return 3.0
	elseif iStackCount == 9 then
		return 4.0
	elseif iStackCount == 10 then
		return 5.0
	else
		return 1.0
	end
end


modifier_courier_speed = class({})

function modifier_courier_speed:IsPurgable() return false end
function modifier_courier_speed:IsHidden() return true end
function modifier_courier_speed:RemoveOnDeath() return false end

function modifier_courier_speed:CheckState() return {[MODIFIER_STATE_INVULNERABLE] = true} end

function modifier_courier_speed:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_MAX,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
		MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE
	}
end

function modifier_courier_speed:GetModifierMoveSpeed_Max()
	return 3000
end

function modifier_courier_speed:GetModifierMoveSpeed_Limit()
	return 3000
end

function modifier_courier_speed:GetModifierMoveSpeed_Absolute()
	return 3000
end


modifier_melee_resistance = class({})

function modifier_melee_resistance:IsPurgable() return false end
function modifier_melee_resistance:RemoveOnDeath() return false end
function modifier_melee_resistance:GetTexture() return "bulldozer" end

function modifier_melee_resistance:OnCreated()
	self.iStatusResist = 20
	if self:GetParent():GetName() == "npc_dota_hero_troll_warlord" or self:GetParent():GetName() == "npc_dota_hero_lone_druid" or self:GetParent():GetName() == "npc_dota_hero_dragon_knight" or self:GetParent():GetName() == "npc_dota_hero_terrorblade" then
		self:StartIntervalThink(0.1)
	end
end

function modifier_melee_resistance:OnIntervalThink()
	if self:GetParent():IsRangedAttacker() then
		self.iStatusResist = 0
	else
		self.iStatusResist = 20
	end
end

function modifier_melee_resistance:DeclareFunctions() return {MODIFIER_PROPERTY_STATUS_RESISTANCE} end

function modifier_melee_resistance:GetModifierStatusResistance()
	return self.iStatusResist
end


modifier_bot_attack_tower_pick_rune = class({})

function modifier_bot_attack_tower_pick_rune:IsPurgable() return false end
function modifier_bot_attack_tower_pick_rune:IsHidden() return true end
function modifier_bot_attack_tower_pick_rune:RemoveOnDeath() return false end

function modifier_bot_attack_tower_pick_rune:OnCreated()
	if IsClient() then return end
	self:StartIntervalThink(0.5)
end

-- bot strategy
-- 机器人策略
function modifier_bot_attack_tower_pick_rune:OnIntervalThink()
	if IsClient() then return end

	local GameTime = GameRules:GetDOTATime(false, false)	-- LATEGAME
	if (GameTime >= (30 * 60)) then
		GameRules:GetGameModeEntity():SetBotsInLateGame(true)
		GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(false)
		GameRules:GetGameModeEntity():SetBotsMaxPushTier(-1)
	elseif (GameTime >= (25 * 60)) then						-- LATEGAME
		GameRules:GetGameModeEntity():SetBotsInLateGame(true)
		GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(false)
		GameRules:GetGameModeEntity():SetBotsMaxPushTier(6)
	elseif (GameTime >= (20 * 60)) then						-- MIDGAME
		GameRules:GetGameModeEntity():SetBotsInLateGame(true)
		GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(false)
		GameRules:GetGameModeEntity():SetBotsMaxPushTier(5)
	elseif (GameTime >= (15 * 60)) then						-- MIDGAME
		GameRules:GetGameModeEntity():SetBotsInLateGame(true)
		GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
		GameRules:GetGameModeEntity():SetBotsMaxPushTier(4)
	elseif (GameTime >= (10 * 60)) then						-- MIDGAME
		GameRules:GetGameModeEntity():SetBotsInLateGame(true)
		GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
		GameRules:GetGameModeEntity():SetBotsMaxPushTier(2)
	else													-- EARLYGAME
		GameRules:GetGameModeEntity():SetBotsInLateGame(false)
		GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
		GameRules:GetGameModeEntity():SetBotsMaxPushTier(1)
	end

	local hParent = self:GetParent()
	local hRune = Entities:FindByClassnameWithin(nil, "dota_item_rune", hParent:GetOrigin(), 1000)
	if hParent:GetHealth()/hParent:GetMaxHealth() > 0.5 and hRune then
		local tOrder = {
			UnitIndex = hParent:entindex(),
			OrderType = DOTA_UNIT_ORDER_PICKUP_RUNE,
			TargetIndex = hRune:entindex()
		}
		ExecuteOrderFromTable(tOrder)
	end

	BotThink:ThinkPurchase(hParent)
end


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
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_TOOLTIP
	}
end

function modifier_tower_endure:OnCreated()
	if IsClient() then return end
	local hParent = self:GetParent()
	local iHealth = hParent:GetMaxHealth()
	local newHealth
	if hParent:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
		newHealth = math.floor(StackToPercentage(AIGameMode.iRadiantTowerEndure)*iHealth)
	elseif hParent:GetTeamNumber() == DOTA_TEAM_BADGUYS then
		newHealth = math.floor(StackToPercentage(AIGameMode.iDireTowerEndure)*iHealth)
	end
	Timers:CreateTimer(0.04, function ()
		hParent:SetMaxHealth( newHealth )
		hParent:SetBaseMaxHealth( newHealth )
		hParent:SetHealth( newHealth )
	end)
end

function modifier_tower_endure:GetModifierPhysicalArmorBonus()
	local sName = self:GetParent():GetName()
	local fPercent = StackToPercentage(self:GetStackCount())

	if string.match(sName, "healer") then
		return math.floor(10*(fPercent-1))
	end
	if string.match(sName, "fort") then
		return math.floor(7*(fPercent-1))
	end
	if string.match(sName, "range") then
		return math.floor(5*(fPercent-1))
	end
	if string.match(sName, "melee") then
		return math.floor(7*(fPercent-1))
	end
	if string.match(sName, "1") then
		return math.floor(7*(fPercent-1))
	end
	if string.match(sName, "[2-3]") then
		return math.floor(8*(fPercent-1))
	end
	if string.match(sName, "4") then
		return math.floor(12*(fPercent-1))
	end
end

function modifier_tower_endure:OnTooltip()
	return 100*StackToPercentage(self:GetStackCount())
end


modifier_tower_power = class({})

function modifier_tower_power:IsPurgable() return false end
function modifier_tower_power:IsDebuff() return false end
function modifier_tower_power:GetTexture() return "tower_power" end

function modifier_tower_power:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_PROPERTY_TOOLTIP
	}
end

function modifier_tower_power:OnAttackLanded(keys)
	if keys.attacker ~= self:GetParent() then return end
	local fPower = StackToPercentage(self:GetStackCount())
	if fPower <= 1.0 then return end
	local tTargets = FindUnitsInRadius(keys.attacker:GetTeamNumber(), keys.target:GetOrigin(), nil, self:OnTooltip(), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC+DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_ANY_ORDER, false)

	for i, v in ipairs(tTargets) do
		if v ~= keys.target then
			ApplyDamage({
				attacker = keys.attacker,
				victim = v,
				damage = keys.damage,
				damage_type = DAMAGE_TYPE_PHYSICAL,
				damage_flag = DOTA_DAMAGE_FLAG_NONE
			})
		end
	end
end

function modifier_tower_power:GetModifierAttackSpeedBonus_Constant()
	local fPower = StackToPercentage(self:GetStackCount())
	if fPower <= 1.0 then return 0 end
	return math.floor(500/9*(fPower-1))
end

function modifier_tower_power:GetModifierBaseDamageOutgoing_Percentage()
	return 100*StackToPercentage(self:GetStackCount())-100
end

function modifier_tower_power:OnTooltip()
	local fPower = StackToPercentage(self:GetStackCount())
	if fPower <= 1.0 then return 0 end
	return math.floor((fPower-1)*50+24)
end


modifier_axe_thinker = class({})

function modifier_axe_thinker:IsPurgable() return false end
function modifier_axe_thinker:IsHidden() return true end
function modifier_axe_thinker:RemoveOnDeath() return false end
function modifier_axe_thinker:OnCreated()
	if IsClient() then return end
	self:StartIntervalThink(0.04)
end

function modifier_axe_thinker:DeclareFunctions() return {MODIFIER_EVENT_ON_ABILITY_EXECUTED} end

local function ThinkForAxeAbilities(hAxe)
	local hAbility1 = hAxe:GetAbilityByIndex(0)
	local hAbility2 = hAxe:GetAbilityByIndex(1)
	local hAbility6 = hAxe:GetAbilityByIndex(5)
	if hAxe:IsSilenced() or hAxe:IsStunned() or hAbility1:IsInAbilityPhase() or hAbility2:IsInAbilityPhase() or hAbility6:IsInAbilityPhase() then return end
	local iRange2 = hAbility2:GetCastRange()
	local iThreshold = hAbility6:GetSpecialValueFor("kill_threshold")
	if hAbility6:IsFullyCastable() then
		local tAllHeroes = FindUnitsInRadius(hAxe:GetTeam(), hAxe:GetOrigin(), nil, hAbility6:GetCastRange()+150, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_ANY_ORDER, false)

		for i, v in ipairs(tAllHeroes) do
			if v:GetHealth() < iThreshold then
				hAxe:CastAbilityOnTarget(v, hAbility6, hAxe:GetPlayerOwnerID())
				hAxe.IsCasting = true
				return
			end
		end
	end
	if hAbility1:IsFullyCastable() then

		local tAllHeroes = FindUnitsInRadius(hAxe:GetTeam(), hAxe:GetOrigin(), nil, hAbility1:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_ANY_ORDER, false)
		local iCount = #tAllHeroes
		for i = 1, iCount do
			if tAllHeroes[iCount+1-i]:IsStunned() or tAllHeroes[iCount+1-i]:IsHexed() or tAllHeroes[iCount+1-i]:IsInvisible() then table.remove(tAllHeroes, iCount+1-i) end
		end

		if #tAllHeroes > 0 then
			hAxe:CastAbilityNoTarget(hAbility1, hAxe:GetPlayerOwnerID())
			return
		end
	end
	if hAbility2:IsFullyCastable() then
		local tAllHeroes = FindUnitsInRadius(hAxe:GetTeam(), hAxe:GetOrigin(), nil, hAbility2:GetCastRange(), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_ANY_ORDER, false)
		for i, v in ipairs(tAllHeroes) do
			hAxe:CastAbilityOnTarget(v, hAbility2, hAxe:GetPlayerOwnerID())
			return
		end
	end
end

function modifier_axe_thinker:OnIntervalThink()
	if IsClient() then return end
	ThinkForAxeAbilities(self:GetParent())
end


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

	if hParent:HasScepter() and hParent:HasAbility("sniper_assassinate") then
		local iLevel = hParent:FindAbilityByName("sniper_assassinate"):GetLevel()
		hParent:RemoveAbility("sniper_assassinate")
		hParent:AddAbility("sniper_assassinate_upgrade"):SetLevel(iLevel)
	end

	if not hParent:HasScepter() and hParent:HasAbility("sniper_assassinate_upgrade") then
		local iLevel = hParent:FindAbilityByName("sniper_assassinate_upgrade"):GetLevel()
		hParent:RemoveAbility("sniper_assassinate_upgrade")
		hParent:AddAbility("sniper_assassinate"):SetLevel(iLevel)
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
