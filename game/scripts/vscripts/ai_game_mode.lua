function Precache(context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_alchemist.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_custom.vsndevts", context)
end

if AIGameMode == nil then
    _G.AIGameMode = class({}) -- put in the global scope
end

require('timers')
require('util')
require('settings')
require('bot/bot_item_data')
require('events')
require('lottery/items')
require('bot/bot_think_item_build')
require('bot/bot_think_item_use')
require('bot/bot_think_ability_use')
require('bot/bot_think_modifier')
require('ts_loader')
require('damage')
require('voicePlayer/PlayFuncs')

function Activate()
    AIGameMode:InitGameMode()
end

function Precache(context)
    PrecacheResource("soundfile", "soundevents/hero_artoria.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_abyss_sword.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/voscripts/game_sounds_vo_abyss_sword.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_goku.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_saber.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/yukari_yakumo.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/hero_themes.vsndevts", context)
    PrecacheResource("soundfile", "soundevents/voscripts/game_sounds_vo_jack.vsndevts", context)
end

function AIGameMode:InitGameMode()
    AIGameMode:InitGameOptions()
    AIGameMode:InitEvents()
    AIGameMode:LinkLuaModifiers()
    AIGameMode:InitGlobalVariables()
    if IsInToolsMode() then
        print("========Enter Debug Mode========")
        self.DebugMode = true
    end
    print("DOTA 2 AI Wars Loaded.")
end

function AIGameMode:InitGlobalVariables()
    -- AI连续死亡记录表
    AIGameMode.BotRecordSuccessiveDeathTable = {}
    self.iGameDifficulty = 0
end

function AIGameMode:InitGameOptions()
    -- 游戏选择项目初始化
    GameRules.GameOption = LoadKeyValues("scripts/kv/game_option.kv")
end

function AIGameMode:InitEvents()
    ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(AIGameMode, "OnGameStateChanged"), self)
    ListenToGameEvent("dota_player_gained_level", Dynamic_Wrap(AIGameMode, "OnPlayerLevelUp"), self)
    ListenToGameEvent("npc_spawned", Dynamic_Wrap(AIGameMode, "OnNPCSpawned"), self)
    ListenToGameEvent("dota_player_pick_hero", Dynamic_Wrap(AIGameMode, "OnPickHeroSpawn"), self)
    ListenToGameEvent("entity_killed", Dynamic_Wrap(AIGameMode, "OnEntityKilled"), self)
    ListenToGameEvent("dota_item_picked_up", Dynamic_Wrap(AIGameMode, "OnItemPickedUp"), self)
    ListenToGameEvent("player_chat", Dynamic_Wrap(AIGameMode, "OnPlayerChat"), self)
    ListenToGameEvent("player_reconnected", Dynamic_Wrap(AIGameMode, 'OnPlayerReconnect'), self)
    ListenToGameEvent("dota_buyback", Dynamic_Wrap(AIGameMode, 'OnBuyback'), self)
    ListenToGameEvent("last_hit", Dynamic_Wrap(AIGameMode, 'OnLastHit'), self)

    -- 游戏选项事件
    CustomGameEventManager:RegisterListener("loading_set_options", function(eventSourceIndex, args)
        return AIGameMode:OnGetLoadingSetOptions(eventSourceIndex, args)
    end)
    CustomGameEventManager:RegisterListener("game_options_change", function(_, keys)
        return AIGameMode:OnGameOptionChange(keys)
    end)
    CustomGameEventManager:RegisterListener("choose_difficulty", function(_, keys)
        return AIGameMode:OnChooseDifficulty(keys)
    end)
    CustomGameEventManager:RegisterListener("vote_end", function(_, keys)
        return AIGameMode:CalculateDifficulty(true)
    end)
    -- 共享单位，禁用帮助
    CustomGameEventManager:RegisterListener("set_unit_share_mask", function(_, keys)
        return AIGameMode:SetUnitShareMask(keys)
    end)
    -- 选择道具
    CustomGameEventManager:RegisterListener("item_choice_made", Dynamic_Wrap(AIGameMode, "FinishItemPick"))
    CustomGameEventManager:RegisterListener("item_choice_shuffle", Dynamic_Wrap(AIGameMode, "ItemChoiceShuffle"))
end

function AIGameMode:LinkLuaModifiers()
    LinkLuaModifier("modifier_out_of_world", "global_modifiers.lua", LUA_MODIFIER_MOTION_NONE)

    LinkLuaModifier("modifier_bot_think_strategy", "bot/bot_think_modifier.lua", LUA_MODIFIER_MOTION_NONE)
    LinkLuaModifier("modifier_bot_think_item_use", "bot/bot_think_modifier.lua", LUA_MODIFIER_MOTION_NONE)
    LinkLuaModifier("modifier_bot_think_ward", "bot/bot_think_modifier.lua", LUA_MODIFIER_MOTION_NONE)
end

function AIGameMode:PreGameOptions()
    self.iDesiredRadiant = self.iDesiredRadiant or RADIANT_PLAYER_COUNT
    self.iDesiredDire = self.iDesiredDire or DIRE_PLAYER_COUNT

    self.fPlayerGoldXpMultiplier = self.fPlayerGoldXpMultiplier or PLAYER_GOLD_XP_MULTIPLIER
    self.fBotGoldXpMultiplier = self.fBotGoldXpMultiplier or BOT_GOLD_XP_MULTIPLIER

    self.iRespawnTimePercentage = self.iRespawnTimePercentage or 1
    self.iMaxLevel = self.iMaxLevel or MAX_LEVEL

    self.iTowerPower = self.iTowerPower or 3

    self.iStartingGoldPlayer = self.iStartingGoldPlayer or 600
    self.iStartingGoldBot = self.iStartingGoldBot or 600
    self.bSameHeroSelection = self.bSameHeroSelection or 1
    self.fGameStartTime = 0

    GameRules:SetGoldPerTick(GOLD_PER_TICK)
    GameRules:SetGoldTickTime(GOLD_TICK_TIME)
    GameRules:SetUseUniversalShopMode(true)
    GameRules:SetFilterMoreGold(true)

    local gameMode = GameRules:GetGameModeEntity()
    gameMode:SetModifyGoldFilter(Dynamic_Wrap(AIGameMode, "FilterGold"), self)
    gameMode:SetModifyExperienceFilter(Dynamic_Wrap(AIGameMode, "FilterXP"), self)

    GameRules:SetTimeOfDay(0.25)

    -- 神符
    gameMode:SetUseDefaultDOTARuneSpawnLogic(true)

    gameMode:SetTowerBackdoorProtectionEnabled(true)
    gameMode:SetMaximumAttackSpeed(MAXIMUM_ATTACK_SPEED)
    gameMode:SetMinimumAttackSpeed(MINIMUM_ATTACK_SPEED)

    -- 死亡不扣钱
    -- gameMode:SetLoseGoldOnDeath(LOSE_GOLD_ON_DEATH)

    -- 启用自定义买活
    -- gameMode:SetCustomBuybackCostEnabled(true)

    -- 每点敏捷提供护甲
    gameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ARMOR, 0.133)

    if self.bSameHeroSelection == 1 then
        GameRules:SetSameHeroSelectionEnabled(true)
    end

    if self.iMaxLevel ~= 30 then
        local tLevelRequire = { 0, 180, 510, 990, 1620, 2400, 3240, 4140, 5100, 6120, 7200, 8350, 9650, 11100, 12700,
            14450, 16350, 18350, 20450, 22650, 25050, 27650, 30450, 33450, 36950, 40950, 45450,
            50450, 55950, 61950 } -- value fixed
        local iRequireLevel = tLevelRequire[30]
        for i = 31, self.iMaxLevel do
            iRequireLevel = iRequireLevel + i * 200
            table.insert(tLevelRequire, iRequireLevel)
        end
        GameRules:SetUseCustomHeroXPValues(true)
        gameMode:SetUseCustomHeroLevels(true)
        gameMode:SetCustomHeroMaxLevel(self.iMaxLevel)
        gameMode:SetCustomXPRequiredToReachNextLevel(tLevelRequire)
    end

    self.sumTowerPower = AIGameMode.iTowerPower
    self.creepBuffLevel = 0
    self.creepBuffLevelGood = 0
    self.creepBuffLevelBad = 0
    self.creepBuffLevelMegaGood = 0
    self.creepBuffLevelMegaBad = 0
    if self.sumTowerPower <= 5 then
        -- 150%
        self.creepBuffLevel = 0
    elseif self.sumTowerPower <= 7 then
        -- 200%
        self.creepBuffLevel = 1
    elseif self.sumTowerPower <= 8 then
        -- 250%
        self.creepBuffLevel = 2
    elseif self.sumTowerPower <= 9 then
        -- 300%
        self.creepBuffLevel = 3
    else
        -- 500%
        self.creepBuffLevel = 4
    end

    -- 初始化
    self.barrackPushedBad = 0
    self.barrackPushedGood = 0

    self.tower1PushedBad = 0
    self.tower1PushedGood = 0
    self.tower2PushedBad = 0
    self.tower2PushedGood = 0
    self.tower3PushedBad = 0
    self.tower3PushedGood = 0
    self.tower4PushedBad = 0
    self.tower4PushedGood = 0

    self.playerNumber = 1

    if self.fBotGoldXpMultiplier <= 3 then
        self.botPushMin = RandomInt(16, 20)
    elseif self.fBotGoldXpMultiplier <= 5 then
        self.botPushMin = RandomInt(13, 16)
    elseif self.fBotGoldXpMultiplier <= 8 then
        self.botPushMin = RandomInt(11, 13)
    elseif self.fBotGoldXpMultiplier <= 10 then
        self.botPushMin = RandomInt(8, 10)
    else
        self.botPushMin = RandomInt(5, 7)
    end

    print("botPushMin: " .. self.botPushMin)

    BotThink:SetTome()

    self.PreGameOptionsSet = true

    -- 肉山奖励勇士积分 初始化
    self.playerBonusSeasonPoint = {}
    for i = 0, 23 do
        self.playerBonusSeasonPoint[i] = 0
    end
end

------------------------------------------------------------------
--                        Gold/XP Filter                        --
------------------------------------------------------------------
GOLD_REASON_FILTER = Set {
    DOTA_ModifyGold_Unspecified,
    DOTA_ModifyGold_Death,
    DOTA_ModifyGold_Buyback,
    DOTA_ModifyGold_PurchaseConsumable,
    DOTA_ModifyGold_PurchaseItem,
    DOTA_ModifyGold_AbandonedRedistribute,
    DOTA_ModifyGold_SellItem,
    DOTA_ModifyGold_AbilityCost,
    DOTA_ModifyGold_CheatCommand,
    DOTA_ModifyGold_SelectionPenalty,
    DOTA_ModifyGold_GameTick,
    -- DOTA_ModifyGold_Building,
    -- DOTA_ModifyGold_HeroKill,
    -- DOTA_ModifyGold_CreepKill,
    -- DOTA_ModifyGold_NeutralKill,
    -- DOTA_ModifyGold_RoshanKill,
    -- DOTA_ModifyGold_CourierKill,
    -- DOTA_ModifyGold_BountyRune,
    -- DOTA_ModifyGold_SharedGold,
    -- DOTA_ModifyGold_AbilityGold,
    -- DOTA_ModifyGold_WardKill,
    -- DOTA_ModifyGold_CourierKilledByThisPlayer,
}

function AIGameMode:FilterGold(tGoldFilter)
    local iGold = tGoldFilter["gold"]
    local iPlayerID = tGoldFilter["player_id_const"]
    local iReason = tGoldFilter["reason_const"]

    -- 过滤一些不走Filter的reason
    if GOLD_REASON_FILTER[iReason] then
        return true
    end

    -- 通用击杀金钱调整
    if iReason == DOTA_ModifyGold_HeroKill then
        if iGold > 2000 then
            iGold = iGold / 8 + 650
        elseif iGold > 1200 then
            iGold = iGold / 4 + 400
        elseif iGold > 200 then
            iGold = iGold / 2 + 100
        else
            iGold = iGold * 1
        end

        iGold = iGold * AIGameMode:RewardFilterByKill(iPlayerID)
    end

    -- 通用金钱系数
    tGoldFilter["gold"] = math.floor(iGold * self:GetPlayerGoldXpMultiplier(iPlayerID))

    return true
end

function AIGameMode:FilterXP(tXPFilter)
    local iXP = tXPFilter["experience"]
    local iPlayerID = tXPFilter["player_id_const"]
    local iReason = tXPFilter["reason_const"]

    tXPFilter["experience"] = math.floor(iXP * self:GetPlayerGoldXpMultiplier(iPlayerID))

    return true
end

function AIGameMode:RewardFilterByKill(iPlayerID)
    local playerKill = PlayerResource:GetKills(iPlayerID)
    local teamKill = PlayerResource:GetTeamKills(PlayerResource:GetTeam(iPlayerID))
    local teamCount = PlayerResource:GetPlayerCountForTeam(PlayerResource:GetTeam(iPlayerID))

    local rewardMulti = 1
    if teamKill < 10 then
        return rewardMulti
    end
    rewardMulti = 1 + (1 / teamCount - playerKill / teamKill) / 2
    return rewardMulti
end

-- 根据playerid获取金钱经验倍率
function AIGameMode:GetPlayerGoldXpMultiplier(iPlayerID)
    local mul = 1

    if IsHumanPlayer(iPlayerID) then
        mul = self.fPlayerGoldXpMultiplier
    elseif self.bRadiantBotSameMulti and IsGoodTeamPlayer(iPlayerID) then
        mul = self.fPlayerGoldXpMultiplier
    else
        mul = self.fBotGoldXpMultiplier
    end

    return mul
end
