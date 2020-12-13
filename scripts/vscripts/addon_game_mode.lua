function Precache( context )
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_alchemist.vsndevts", context )
	PrecacheResource("soundfile", "soundevents/game_sounds_custom.vsndevts", context )
end

if AIGameMode == nil then
	_G.AIGameMode = class({}) -- put in the global scope
end

require('timers')
require('settings')
require('events')
require('util')


function Activate()
	AIGameMode:InitGameMode()
end


function AIGameMode:InitGameMode()
	AIGameMode:InitGameOptions()
	AIGameMode:InitEvents()
	AIGameMode:LinkLuaModifiers()
	print("DOTA 2 AI Wars Loaded.")
end


function AIGameMode:InitGameOptions()
	GameRules:SetCustomGameSetupAutoLaunchDelay( AUTO_LAUNCH_DELAY )
	GameRules:LockCustomGameSetupTeamAssignment( LOCK_TEAM_SETUP )
	GameRules:EnableCustomGameSetupAutoLaunch( ENABLE_AUTO_LAUNCH )
	GameRules:SetHeroSelectionTime( HERO_SELECTION_TIME )
	GameRules:SetPreGameTime( PRE_GAME_TIME )
	GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, RADIANT_PLAYER_COUNT)
	GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, DIRE_PLAYER_COUNT)
	GameRules:SetStrategyTime(30)
	GameRules:SetShowcaseTime(0)
	GameRules:GetGameModeEntity():SetFreeCourierModeEnabled(true)
end


function AIGameMode:InitEvents()
	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(AIGameMode, "OnGameStateChanged"), self)
	ListenToGameEvent("dota_player_gained_level", Dynamic_Wrap(AIGameMode, "OnPlayerLevelUp"), self)
	ListenToGameEvent("npc_spawned", Dynamic_Wrap(AIGameMode, "OnNPCSpawned"), self)
	ListenToGameEvent("entity_killed", Dynamic_Wrap(AIGameMode, "OnEntityKilled"), self)
	--JS events
	CustomGameEventManager:RegisterListener("loading_set_options", function (eventSourceIndex, args) return AIGameMode:OnGetLoadingSetOptions(eventSourceIndex, args) end)
end


function AIGameMode:LinkLuaModifiers()
	LinkLuaModifier("modifier_courier_speed", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_melee_resistance", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_bot_attack_tower_pick_rune", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_tower_power", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_tower_endure", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_tower_heal", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_axe_thinker", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_sniper_assassinate_thinker", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_out_of_world", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
end


function AIGameMode:PreGameOptions()
	self.iDesiredRadiant = self.iDesiredRadiant or RADIANT_PLAYER_COUNT
	self.iDesiredDire = self.iDesiredDire or DIRE_PLAYER_COUNT
	self.fRadiantGoldMultiplier = self.fRadiantGoldMultiplier or RADIANT_GOLD_MULTIPLIER
	self.fRadiantXPMultiplier = self.fRadiantXPMultiplier or RADIANT_XP_MULTIPLIER
	self.fDireXPMultiplier = self.fDireXPMultiplier or DIRE_XP_MULTIPLIER
	self.fDireGoldMultiplier = self.fDireGoldMultiplier or DIRE_GOLD_MULTIPLIER
	self.iGoldPerTick = self.iGoldPerTick or GOLD_PER_TICK
	self.iGoldTickTime = self.iGoldTickTime or GOLD_TICK_TIME
	self.iRespawnTimePercentage = self.iRespawnTimePercentage or 1
	self.iMaxLevel = self.iMaxLevel or MAX_LEVEL
	self.iRadiantTowerPower = self.iRadiantTowerPower or 3
	self.iDireTowerPower = self.iDireTowerPower or 3
	self.iRadiantTowerEndure = self.iRadiantTowerEndure or 3
	self.iDireTowerEndure = self.iDireTowerEndure or 3
	self.iRadiantTowerHeal = self.iRadiantTowerHeal or 0
	self.iDireTowerHeal = self.iDireTowerHeal or 0
	self.bSameHeroSelection = self.bSameHeroSelection or 1
	self.bFastCourier = self.bFastCourier or 1
	self.fGameStartTime = 0
	GameRules:SetGoldPerTick(self.iGoldPerTick)
	GameRules:SetGoldTickTime(self.iGoldTickTime)
	GameRules:GetGameModeEntity():SetModifyGoldFilter( Dynamic_Wrap( AIGameMode, "FilterGold" ), self )
	GameRules:GetGameModeEntity():SetModifyExperienceFilter( Dynamic_Wrap( AIGameMode, "FilterXP" ), self )
	GameRules:GetGameModeEntity():SetRuneSpawnFilter( Dynamic_Wrap( AIGameMode, "FilterRune" ), self )
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled( true )
	GameRules:SetUseUniversalShopMode( true )
	if self.bSameHeroSelection == 1 then
		GameRules:SetSameHeroSelectionEnabled( true )
	end
	if self.iMaxLevel ~= 30 then
		local tLevelRequire = {
			0,
			230,
			600,
			1080,
			1660,
			2260,
			2980,
			3730,
			4510,
			5320,
			6160,
			7030,
			7930,
			9155,
			10405,
			11680,
			12980,
			14305,
			15805,
			17395,
			18995,
			20845,
			22945,
			25295,
			27895,
			31395,
			35895,
			41395,
			47895,
			55395,
		} -- value in 7.23
		local iRequireLevel = tLevelRequire[25]
		for i = 26, self.iMaxLevel do
			iRequireLevel = iRequireLevel+i*300
			table.insert(tLevelRequire, iRequireLevel)
		end
		GameRules:GetGameModeEntity():SetUseCustomHeroLevels( true )
		GameRules:SetUseCustomHeroXPValues( true )
		GameRules:GetGameModeEntity():SetCustomHeroMaxLevel(self.iMaxLevel)
		GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel(tLevelRequire)
	end
	self.PreGameOptionsSet = true
end


function AIGameMode:FilterGold(tGoldFilter)
	local iGold = tGoldFilter["gold"]
	local iPlayerID = tGoldFilter["player_id_const"]
	local iReason = tGoldFilter["reason_const"]
	local bReliable = tGoldFilter["reliable"] == 1

	if PlayerResource:GetTeam(iPlayerID) == DOTA_TEAM_GOODGUYS then
		tGoldFilter["gold"] = math.floor(iGold*self.fRadiantGoldMultiplier)
	else
		tGoldFilter["gold"] = math.floor(iGold*self.fDireGoldMultiplier)
		--print("Dire Gold", tGoldFilter["gold"], iGold)
	end
	return true
end


function AIGameMode:FilterXP(tXPFilter)
	local iXP = tXPFilter["experience"]
	local iPlayerID = tXPFilter["player_id_const"]
	local iReason = tXPFilter["reason_const"]

	if PlayerResource:GetTeam(iPlayerID) == DOTA_TEAM_GOODGUYS then
		tXPFilter["experience"] = math.floor(iXP*self.fRadiantXPMultiplier)
	else
		tXPFilter["experience"] = math.floor(iXP*self.fDireXPMultiplier)
		--print("Dire XP", tXPFilter["experience"], iXP)
	end
	return true
end


local bFirstRuneShouldSpawned = false
local bFirstRuneActuallySpawned = false
local tPossibleRunes = {
	DOTA_RUNE_ILLUSION,
	DOTA_RUNE_REGENERATION,
	DOTA_RUNE_HASTE,
	DOTA_RUNE_INVISIBILITY,
	DOTA_RUNE_DOUBLEDAMAGE,
	DOTA_RUNE_ARCANE
}

local tLastRunes = {}

function AIGameMode:FilterRune(tRuneFilter)
	if GameRules:GetGameTime() > 2395+self.fGameStartTime then
		tRuneFilter.rune_type = tPossibleRunes[RandomInt(1, 6)]
		while tRuneFilter.rune_type == tLastRunes[tRuneFilter.spawner_entindex_const] do
			tRuneFilter.rune_type = tPossibleRunes[RandomInt(1, 6)]
		end
		tLastRunes[tRuneFilter.spawner_entindex_const] = tRuneFilter.rune_type
		return true
	else
		if bFirstRuneShouldSpawned then
			if bFirstRuneActuallySpawned then
				tLastRunes[tRuneFilter.spawner_entindex_const] = nil
				bFirstRuneShouldSpawned = false
				return false
			else
				tRuneFilter.rune_type = tPossibleRunes[RandomInt(1, 6)]
				while tRuneFilter.rune_type == tLastRunes[tRuneFilter.spawner_entindex_const] do
					tRuneFilter.rune_type = tPossibleRunes[RandomInt(1, 6)]
				end
				tLastRunes[tRuneFilter.spawner_entindex_const] = tRuneFilter.rune_type
				bFirstRuneShouldSpawned = false
				return true
			end
		else
			if RandomInt(0,1) > 0 then
				bFirstRuneActuallySpawned = true
				bFirstRuneShouldSpawned = true
				tRuneFilter.rune_type = tPossibleRunes[RandomInt(1, 6)]
				while tRuneFilter.rune_type == tLastRunes[tRuneFilter.spawner_entindex_const] do
					tRuneFilter.rune_type = tPossibleRunes[RandomInt(1, 6)]
				end
				tLastRunes[tRuneFilter.spawner_entindex_const] = tRuneFilter.rune_type
				return true
			else
				bFirstRuneActuallySpawned = false
				bFirstRuneShouldSpawned = true
				tLastRunes[tRuneFilter.spawner_entindex_const] = nil
				return false
			end
		end
	end
end
