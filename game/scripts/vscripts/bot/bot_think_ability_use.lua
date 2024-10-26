--------------------
-- Initial
--------------------
if BotAbilityThink == nil then
	print("Bot Ability Think initialize!")
	_G.BotAbilityThink = class({}) -- put in the global scope
end

--------------------
-- Ability Common
--------------------
function BotAbilityThink:CastAbilityOnEnemyTarget(hHero, hAbility)
	if hAbility:IsFullyCastable() then
		local iRange = GetFullCastRange(hHero, hAbility)
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		if #tAllHeroes > 0 then
			hHero:CastAbilityOnTarget(tAllHeroes[1], hAbility, hHero:GetPlayerOwnerID())
			return true
		end
	end
	return false
end

function BotAbilityThink:CastAbilityOnEnemyPostion(hHero, hAbility)
	if hAbility:IsFullyCastable() then
		local iRange = GetFullCastRange(hHero, hAbility)
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		if #tAllHeroes > 0 then
			hHero:CastAbilityOnPosition(tAllHeroes[1]:GetOrigin(), hAbility, hHero:GetPlayerOwnerID())
			return true
		end
	end
	return false
end

function BotAbilityThink:CastAbilityOnFriendTarget(hHero, hAbility)
	if hAbility:IsFullyCastable() then
		local iRange = GetFullCastRange(hHero, hAbility)
		local tAllHeroes = BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
		if #tAllHeroes > 0 then
			hHero:CastAbilityOnTarget(tAllHeroes[1], hAbility, hHero:GetPlayerOwnerID())
			return true
		end
	end
	return false
end

function BotAbilityThink:CastAbilityOnFriendTargetWithLessHp(hHero, hAbility, hpPercent, modifierName)
	if hAbility:IsFullyCastable() then
		local iRange = GetFullCastRange(hHero, hAbility)
		local tAllHeroes = BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
		for i = 1, #tAllHeroes do
			if tAllHeroes[i]:GetHealthPercent() <= hpPercent then
				if modifierName ~= nil then
					if not tAllHeroes[i]:HasModifier(modifierName) then
						hHero:CastAbilityOnTarget(tAllHeroes[i], hAbility, hHero:GetPlayerOwnerID())
						return true
					end
				else
					hHero:CastAbilityOnTarget(tAllHeroes[i], hAbility, hHero:GetPlayerOwnerID())
					return true
				end
			end
		end
	end
	return false
end

function BotAbilityThink:CastAbilityOnEnemyTargetWithLessHp(hHero, hAbility, hpPercent)
	if hAbility:IsFullyCastable() then
		local iRange = GetFullCastRange(hHero, hAbility)
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		for i = 1, #tAllHeroes do
			if tAllHeroes[i]:GetHealthPercent() <= hpPercent then
				hHero:CastAbilityOnTarget(tAllHeroes[i], hAbility, hHero:GetPlayerOwnerID())
				return true
			end
		end
	end
	return false
end

--------------------
-- Ability Think
--------------------
function BotAbilityThink:ThinkUseAbility(hHero)
	if not hHero then
		return
	end

	-- Get hero name
	local sHeroName = hHero:GetName()

	if sHeroName == "npc_dota_hero_axe" then
		self:ThinkUseAbility_Axe(hHero)
	elseif sHeroName == "npc_dota_hero_earthshaker" then
		self:ThinkUseAbility_EarthShaker(hHero)
	elseif sHeroName == "npc_dota_hero_phantom_assassin" then
		self:ThinkUseAbility_PhantomAssassin(hHero)
	elseif sHeroName == "npc_dota_hero_zuus" then
		self:ThinkUseAbility_Zuus(hHero)
	elseif sHeroName == "npc_dota_hero_juggernaut" then
		self:ThinkUseAbility_Juggernaut(hHero)
	elseif sHeroName == "npc_dota_hero_kunkka" then
		self:ThinkUseAbility_Kunkka(hHero)
	elseif sHeroName == "npc_dota_hero_ogre_magi" then
		self:ThinkUseAbility_OgreMagi(hHero)
	elseif sHeroName == "npc_dota_hero_omniknight" then
		self:ThinkUseAbility_Omniknight(hHero)
	elseif sHeroName == "npc_dota_hero_shadow_shaman" then
		self:ThinkUseAbility_ShadowShaman(hHero)
	elseif sHeroName == "npc_dota_hero_abaddon" then
		self:ThinkUseAbility_Abaddon(hHero)
	elseif sHeroName == "npc_dota_hero_meepo" then
		self:ThinkUseAbility_Meepo(hHero)
	elseif sHeroName == "npc_dota_hero_chaos_knight" then
		self:ThinkUseAbility_ChaosKnight(hHero)
	elseif sHeroName == "npc_dota_hero_lina" then
		self:ThinkUseAbility_Lina(hHero)
	elseif sHeroName == "npc_dota_hero_spectre" then
		self:ThinkUseAbility_Spectre(hHero)
	elseif sHeroName == "npc_dota_hero_necrolyte" then
		self:ThinkUseAbility_Necrolyte(hHero)
	elseif sHeroName == "npc_dota_hero_riki" then
		self:ThinkUseAbility_Riki(hHero)
	elseif sHeroName == "npc_dota_hero_witch_doctor" then
		self:ThinkUseAbility_WitchDoctor(hHero)
	elseif sHeroName == "npc_dota_hero_tinker" then
		self:ThinkUseAbility_Tinker(hHero)
	end
end

function BotAbilityThink:ThinkUseAbility_Axe(hHero)
	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility2 = hHero:GetAbilityByIndex(1)
	local hAbility6 = hHero:GetAbilityByIndex(5)

	if hAbility6:IsFullyCastable() then
		local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, hAbility6:GetCastRange() + 150,
			DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO,
			DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE +
			DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_ANY_ORDER, false)
		local iThreshold = hAbility6:GetSpecialValueFor("damage")
		for i, v in ipairs(tAllHeroes) do
			if v:GetHealth() < iThreshold then
				hHero:CastAbilityOnTarget(v, hAbility6, hHero:GetPlayerOwnerID())
				return true
			end
		end
	end

	if hAbility1:IsFullyCastable() then
		local iRange = hAbility1:GetSpecialValueFor("radius") - 10
		local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange, DOTA_UNIT_TARGET_TEAM_ENEMY,
			DOTA_UNIT_TARGET_HERO,
			DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE +
			DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_ANY_ORDER, false)
		local iCount = #tAllHeroes
		for i = 1, iCount do
			if tAllHeroes[iCount + 1 - i]:IsStunned() or tAllHeroes[iCount + 1 - i]:IsHexed() or tAllHeroes[iCount + 1 - i]:IsInvisible() then
				table.remove(tAllHeroes, iCount + 1 - i)
			end
		end
		if #tAllHeroes > 0 then
			hHero:CastAbilityNoTarget(hAbility1, hHero:GetPlayerOwnerID())
			return true
		end
	end

	if BotAbilityThink:CastAbilityOnEnemyTarget(hHero, hAbility2) then
		return true
	end
end

function BotAbilityThink:ThinkUseAbility_EarthShaker(hHero)
	local hAbility2 = hHero:GetAbilityByIndex(1)

	if hAbility2:IsFullyCastable() then
		local iRange = hAbility2:GetSpecialValueFor("aftershock_range")
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		if #tAllHeroes > 0 then
			if hHero:HasModifier("modifier_item_ultimate_scepter") then
				hHero:CastAbilityOnTarget(hHero, hAbility2, hHero:GetPlayerOwnerID())
			else
				hHero:CastAbilityNoTarget(hAbility2, hHero:GetPlayerOwnerID())
			end
			return true
		end
	end
end

function BotAbilityThink:ThinkUseAbility_PhantomAssassin(hHero)
	local hAbility3 = hHero:GetAbilityByIndex(2)
	local hAbility4 = hHero:GetAbilityByIndex(3)

	if hHero:HasModifier("modifier_item_ultimate_scepter") then
		if hAbility3:IsFullyCastable() and (not hHero:HasModifier("modifier_phantom_assassin_blur_active")) then
			hHero:CastAbilityNoTarget(hAbility3, hHero:GetPlayerOwnerID())
			return true
		end

		if hAbility4:IsFullyCastable() then
			local iRange = hAbility4:GetSpecialValueFor("radius")
			local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
			if #tAllHeroes > 0 then
				hHero:CastAbilityNoTarget(hAbility4, hHero:GetPlayerOwnerID())
				return true
			end
		end
	end
end

function BotAbilityThink:ThinkUseAbility_Zuus(hHero)
	local hAbility2 = hHero:GetAbilityByIndex(1)
	local hAbility3 = hHero:GetAbilityByIndex(2)
	local hAbility4 = hHero:GetAbilityByIndex(3)

	if BotAbilityThink:CastAbilityOnEnemyPostion(hHero, hAbility2) then
		return true
	end
	if hAbility3:IsFullyCastable() then
		local iRange = hAbility3:GetSpecialValueFor("range")
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		if #tAllHeroes > 0 then
			hHero:CastAbilityNoTarget(hAbility3, hHero:GetPlayerOwnerID())
			return true
		end
	end
	if hHero:HasModifier("modifier_item_ultimate_scepter") then
		if hAbility4:IsFullyCastable() then
			local iRange = 3000
			local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange,
				DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO,
				DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_FARTHEST, false)
			if #tAllHeroes > 0 then
				hHero:CastAbilityOnPosition(tAllHeroes[1]:GetOrigin(), hAbility4, hHero:GetPlayerOwnerID())
				return true
			end
		end
	end
end

function BotAbilityThink:ThinkUseAbility_Juggernaut(hHero)
	local hAbility4 = hHero:GetAbilityByIndex(3)

	if hHero:HasModifier("modifier_item_ultimate_scepter") then
		if BotAbilityThink:CastAbilityOnEnemyTarget(hHero, hAbility4) then
			return true
		end
	end
end

function BotAbilityThink:ThinkUseAbility_Kunkka(hHero)
	local hAbility3 = hHero:GetAbilityByIndex(2)
	local hAbility4 = hHero:GetAbilityByIndex(3)
	local hAbility5 = hHero:GetAbilityByIndex(4)

	if BotAbilityThink:CastAbilityOnEnemyTarget(hHero, hAbility3) then
		return true
	end
	if BotAbilityThink:CastAbilityOnEnemyPostion(hHero, hAbility5) then
		return true
	end
end

function BotAbilityThink:ThinkUseAbility_OgreMagi(hHero)
	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility2 = hHero:GetAbilityByIndex(1)
	local hAbility3 = hHero:GetAbilityByIndex(2)
	local hAbility4 = hHero:GetAbilityByIndex(3)
	local hAbility5 = hHero:GetAbilityByIndex(4)
	if self:CastAbilityOnEnemyTarget(hHero, hAbility1) then return true end
	if self:CastAbilityOnEnemyTarget(hHero, hAbility2) then return true end
	-- set hAbility3 auto cast
	if hAbility3:IsFullyCastable() then
		if hAbility3:GetAutoCastState() == false then
			hAbility3:ToggleAutoCast()
		end
	end
	if self:CastAbilityOnEnemyTarget(hHero, hAbility4) then return true end

	-- cast on teammate
	if hAbility5:IsFullyCastable() then
		local iRange = GetFullCastRange(hHero, hAbility5)
		local tAllHeroes = BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
		local iCount = #tAllHeroes
		for i = 1, iCount do
			if tAllHeroes[iCount + 1 - i]:HasModifier("modifier_ogre_magi_smash_buff") then
				table.remove(tAllHeroes,
					iCount + 1 - i)
			end
		end
		if #tAllHeroes > 0 then
			hHero:CastAbilityOnPosition(tAllHeroes[1]:GetOrigin(), hAbility5, hHero:GetPlayerOwnerID())
			return true
		end
	end
end

function BotAbilityThink:ThinkUseAbility_ShadowShaman(hHero)
	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility2 = hHero:GetAbilityByIndex(1)
	local hAbility3 = hHero:GetAbilityByIndex(2)
	local hAbility4 = hHero:GetAbilityByIndex(3)
	local hAbility6 = hHero:GetAbilityByIndex(5)
	if self:CastAbilityOnEnemyTarget(hHero, hAbility2) then return true end
	if self:CastAbilityOnEnemyTarget(hHero, hAbility1) then return true end
	if self:CastAbilityOnEnemyPostion(hHero, hAbility6) then return true end

	if hAbility4:IsFullyCastable() then
		local iRange = GetFullCastRange(hHero, hAbility4)
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		if #tAllHeroes > 0 then
			hHero:CastAbilityOnPosition(tAllHeroes[1]:GetOrigin() - hHero:GetOrigin(), hAbility4,
				hHero:GetPlayerOwnerID())
			return true
		end
	end

	if self:CastAbilityOnEnemyTarget(hHero, hAbility3) then return true end
end

function BotAbilityThink:ThinkUseAbility_Abaddon(hHero)
	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility2 = hHero:GetAbilityByIndex(1)
	if BotAbilityThink:CastAbilityOnFriendTargetWithLessHp(hHero, hAbility1, 95) then
		return true
	end
	if self:CastAbilityOnEnemyTarget(hHero, hAbility1) then return true end

	if BotAbilityThink:CastAbilityOnFriendTargetWithLessHp(hHero, hAbility2, 95, "modifier_abaddon_aphotic_shield") then
		return true
	end
end

function BotAbilityThink:ThinkUseAbility_Meepo(hHero)
	if hHero:HasModifier("modifier_miku_dance") then return end
	if hHero:HasModifier("modifier_get_down") then return end

	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility3 = hHero:GetAbilityByIndex(2)
	local hAbility4 = hHero:GetAbilityByIndex(3)
	local hAbility5 = hHero:GetAbilityByIndex(4)
	local hAbility6 = hHero:GetAbilityByIndex(5)

	if BotAbilityThink:CastAbilityOnEnemyPostion(hHero, hAbility1) then
		return true
	end
	if BotAbilityThink:CastAbilityOnEnemyTarget(hHero, hAbility3) then
		return true
	end

	if hHero:HasModifier("modifier_chibi_monster") then
		if BotAbilityThink:CastAbilityOnEnemyTarget(hHero, hAbility6) then
			return true
		end
	else
		if hAbility6 and hAbility6:IsFullyCastable() then
			local iRange = 900
			local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
			if #tAllHeroes > 0 then
				hHero:CastAbilityNoTarget(hAbility6, hHero:GetPlayerOwnerID())
				return true
			end
		end
	end

	if hAbility4:IsFullyCastable() or hAbility5:IsFullyCastable() then
		local iRange = 600
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		-- 范围内有两人以上时跳舞
		if #tAllHeroes > 1 then
			if hAbility4:IsFullyCastable() then
				hHero:CastAbilityNoTarget(hAbility4, hHero:GetPlayerOwnerID())
				return true
			end
			if hAbility5:IsFullyCastable() then
				hHero:CastAbilityNoTarget(hAbility5, hHero:GetPlayerOwnerID())
				return true
			end
		end
	end
end

function BotAbilityThink:ThinkUseAbility_Omniknight(hHero)
	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility2 = hHero:GetAbilityByIndex(1)
	local hAbility3 = hHero:GetAbilityByIndex(2)
	local hAbility5 = hHero:GetAbilityByIndex(4)
	local hAbility6 = hHero:GetAbilityByIndex(5)
	if self:CastAbilityOnFriendTargetWithLessHp(hHero, hAbility2, 60) then return true end
	if self:CastAbilityOnFriendTargetWithLessHp(hHero, hAbility1, 80) then return true end
	if self:CastAbilityOnEnemyTarget(hHero, hAbility3) then return true end
	if self:CastAbilityOnFriendTargetWithLessHp(hHero, hAbility5, 85) then return true end
	if self:CastAbilityOnFriendTargetWithLessHp(hHero, hAbility6, 85) then return true end
end

function BotAbilityThink:ThinkUseAbility_ChaosKnight(hHero)
	local hAbility6 = hHero:GetAbilityByIndex(5)

	if hAbility6:IsFullyCastable() then
		local iRange = 600
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		-- 范围内有1人以上时施法
		if #tAllHeroes >= 1 then
			hHero:CastAbilityNoTarget(hAbility6, hHero:GetPlayerOwnerID())
			return true
		end
	end
end

function BotAbilityThink:ThinkUseAbility_Lina(hHero)
	local hAbility4 = hHero:GetAbilityByIndex(3)
	local hAbility6 = hHero:GetAbilityByIndex(5)

	if hAbility4:IsFullyCastable() then
		local iRange = 900
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		-- 范围内有1人以上时施法
		if #tAllHeroes >= 1 then
			hHero:CastAbilityNoTarget(hAbility4, hHero:GetPlayerOwnerID())
			return true
		end
	end
	if self:CastAbilityOnEnemyTargetWithLessHp(hHero, hAbility6, 80) then return true end
end

function BotAbilityThink:ThinkUseAbility_Spectre(hHero)
	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility2 = hHero:GetAbilityByIndex(1)

	if hAbility1:GetLevel() > 2 then
		if BotAbilityThink:CastAbilityOnEnemyTarget(hHero, hAbility1) then
			return true
		end
	end

	if hAbility2:IsFullyCastable() then
		local range = 1200
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, range)
		if #tAllHeroes >= 1 and hHero:GetHealthPercent() <= 40 then
			hHero:CastAbilityNoTarget(hAbility2, hHero:GetPlayerOwnerID())
			return true
		end
		if #tAllHeroes >= 2 and hHero:GetHealthPercent() <= 50 then
			hHero:CastAbilityNoTarget(hAbility2, hHero:GetPlayerOwnerID())
			return true
		end
		if #tAllHeroes >= 3 and hHero:GetHealthPercent() <= 60 then
			hHero:CastAbilityNoTarget(hAbility2, hHero:GetPlayerOwnerID())
			return true
		end
		if #tAllHeroes >= 4 and hHero:GetHealthPercent() <= 70 then
			hHero:CastAbilityNoTarget(hAbility2, hHero:GetPlayerOwnerID())
			return true
		end
		if #tAllHeroes >= 5 and hHero:GetHealthPercent() <= 95 then
			hHero:CastAbilityNoTarget(hAbility2, hHero:GetPlayerOwnerID())
			return true
		end
	end
end

function BotAbilityThink:ThinkUseAbility_Necrolyte(hHero)
	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility4 = hHero:GetAbilityByIndex(3)
	local hAbility6 = hHero:GetAbilityByIndex(5)

	if hAbility1:IsFullyCastable() then
		local iRange = 600
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		if #tAllHeroes > 0 then
			hHero:CastAbilityNoTarget(hAbility1, hHero:GetPlayerOwnerID())
			return true
		end
	end

	if self:CastAbilityOnEnemyTarget(hHero, hAbility4) then return true end

	if self:CastAbilityOnEnemyTargetWithLessHp(hHero, hAbility6, 50) then return true end
end

function BotAbilityThink:ThinkUseAbility_Riki(hHero)
	local hAbility3 = hHero:GetAbilityByIndex(2)

	if BotAbilityThink:CastAbilityOnEnemyPostion(hHero, hAbility3) then
		return true
	end
end

function BotAbilityThink:ThinkUseAbility_WitchDoctor(hHero)
	local hAbility4 = hHero:GetAbilityByIndex(3)

	if hAbility4:IsFullyCastable() then
		if hHero:GetHealthPercent() < 50 then
			local iRange = 600
			local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
			if #tAllHeroes > 0 then
				hHero:CastAbilityNoTarget(hAbility4, hHero:GetPlayerOwnerID())
				return true
			end
		end
	end
end

function BotAbilityThink:ThinkUseAbility_Tinker(hHero)
	local hAbility1 = hHero:GetAbilityByIndex(0)
	local hAbility2 = hHero:GetAbilityByIndex(1)
	local hAbility3 = hHero:GetAbilityByIndex(2)
	local hAbility4 = hHero:GetAbilityByIndex(3)
	local hAbility5 = hHero:GetAbilityByIndex(4)
	local hAbility6 = hHero:GetAbilityByIndex(5)


	if hAbility4:IsFullyCastable() then
		-- 折跃范围
		local iRange = 300
		local hTarget = BotThink:FindNearestEnemyHeroesInRangeAndVisible(hHero, iRange)
		if hTarget then
			hHero:CastAbilityOnTarget(hTarget, hAbility4, hHero:GetPlayerOwnerID())
			return true
		end
	end

	-- if hAbility6 is Channel
	if hAbility6:IsChanneling() then
		return false
	end

	-- item blink
	local hItemBlink = hHero:FindItemInInventory("item_blink")
	if hItemBlink == nil then
		hItemBlink = hHero:FindItemInInventory("item_arcane_blink")
	end
	if hItemBlink == nil then
		hItemBlink = hHero:FindItemInInventory("item_overwhelming_blink")
	end
	if hItemBlink == nil then
		hItemBlink = hHero:FindItemInInventory("item_swift_blink")
	end
	if hItemBlink == nil then
		hItemBlink = hHero:FindItemInInventory("item_arcane_blink_2")
	end
	if hItemBlink ~= nil and hItemBlink:IsFullyCastable() and hHero:GetManaPercent() > 20 and hHero:GetHealthPercent() > 50 then
		local iFindRange = 3500
		local distance = GetFullCastRange(hHero, hAbility1)
		local iTeamRange = distance + 300
		local hTarget = BotThink:FindNearestEnemyHeroesInRangeAndVisible(hHero, iFindRange)
		if hTarget then
			local vTarget = hTarget:GetOrigin()
			-- blink when has teammate
			local vTeammate = BotThink:FindNearestEnemyHeroesInRangeAndVisible(hTarget, iTeamRange)
			if vTeammate then
				local vBlink = vTarget - (vTarget - vTeammate:GetOrigin()):Normalized() * distance
				-- change 45 degree
				local iRandomDegree = RandomInt(-45, 45)
				vBlink = RotatePosition(vTarget, QAngle(0, iRandomDegree, 0), vBlink)

				hHero:CastAbilityOnPosition(vBlink, hItemBlink, hHero:GetPlayerOwnerID())
				return true
			end
		end
	end

	if BotAbilityThink:CastAbilityOnEnemyTarget(hHero, hAbility1) then
		return true
	end
	if hAbility2:IsFullyCastable() then
		local iRange = hAbility2:GetCastRange()
		local tAllHeroes = BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
		if #tAllHeroes > 0 then
			hHero:CastAbilityNoTarget(hAbility2, hHero:GetPlayerOwnerID())
			return true
		end
	end

	if BotAbilityThink:CastAbilityOnFriendTargetWithLessHp(hHero, hAbility3, 90, "modifier_tinker_defense_matrix") then
		return true
	end

	if hAbility5:IsFullyCastable() then
		-- if mp less than 10% go back to fountain
		if hHero:GetMana() < 300 or hHero:GetManaPercent() < 10 then
			-- get team
			local team = hHero:GetTeam()
			if team == 2 then
				hHero:CastAbilityOnPosition(Vector(-7170, -6725, 0), hAbility5, hHero:GetPlayerOwnerID())
				return true
			end
			if team == 3 then
				hHero:CastAbilityOnPosition(Vector(7100, 6300, 0), hAbility5, hHero:GetPlayerOwnerID())
				return true
			end
		end

		if hHero:GetLevel() > 17 and hHero:GetManaPercent() > 80 and hHero:GetHealthPercent() > 80 then
			-- if far away from teammate
			local iRange = 5000
			local tNearHeroes = BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
			if #tNearHeroes <= 1 then
				print("tinker tp think only self")
				-- if not teammate, find nearest teammate
				iRange = 20000
				local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange,
					DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE,
					FIND_CLOSEST, false)
				-- if team hero hp > 90% go to him
				if #tAllHeroes > 1 and tAllHeroes[2]:GetHealthPercent() > 90 then
					hHero:CastAbilityOnPosition(tAllHeroes[2]:GetOrigin(), hAbility5, hHero:GetPlayerOwnerID())
					return true
				end
			end
		end
	end

	if hAbility6:IsFullyCastable() then
		local refreshAbilityCoolDownTotal = 15
		local refreshItemCoolDownTotal = 30

		local iAbilityCoolDownTotal = 0
		local iItemCoolDownTotal = 0
		iAbilityCoolDownTotal = iAbilityCoolDownTotal + hAbility1:GetCooldownTimeRemaining()
		iAbilityCoolDownTotal = iAbilityCoolDownTotal + hAbility2:GetCooldownTimeRemaining()
		iAbilityCoolDownTotal = iAbilityCoolDownTotal + hAbility3:GetCooldownTimeRemaining()
		iAbilityCoolDownTotal = iAbilityCoolDownTotal + hAbility4:GetCooldownTimeRemaining()

		iItemCoolDownTotal = iItemCoolDownTotal + hAbility5:GetCooldownTimeRemaining()
		for i = 0, 5 do
			local hItem = hHero:GetItemInSlot(i)
			if hItem ~= nil then
				-- if item name is refresh_core
				if not hItem:GetName() == "item_refresh_core" then
					iItemCoolDownTotal = iItemCoolDownTotal + hItem:GetCooldownTimeRemaining()
				end
			end
		end

		if iAbilityCoolDownTotal > refreshAbilityCoolDownTotal
			or iAbilityCoolDownTotal + iItemCoolDownTotal > refreshItemCoolDownTotal then
			hHero:CastAbilityNoTarget(hAbility6, hHero:GetPlayerOwnerID())
			return true
		end
	end
end
