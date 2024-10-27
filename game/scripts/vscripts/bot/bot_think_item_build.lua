--[[ ============================================================================================================
	Author: Windy
	Date: September 14, 2021
================================================================================================================= ]]


--------------------
-- 初始化 修正出装列表
--------------------

local function replaceItem(v, oldItemName, newItemName)
  for i, vItem in ipairs(v) do
    if vItem == oldItemName then
      -- remove excalibur
      table.remove(v, i)
      table.insert(v, newItemName)
      print("replaceItem " .. oldItemName .. " to " .. newItemName)
    end
  end
end

local function addTome(k, v)
  -- N6替换
  if AIGameMode.iGameDifficulty and AIGameMode.iGameDifficulty >= 6 then
    -- 光暗·秘术铠甲
    replaceItem(v, "item_blade_mail_2", "item_force_field_ai")

    -- 诅咒圣剑
    replaceItem(v, "item_excalibur", "item_rapier_ultra_bot_1")
  end

  -- 一组属性书
  table.insert(v, "item_tome_of_strength")
  table.insert(v, "item_tome_of_agility")
  table.insert(v, "item_tome_of_intelligence")
  -- 洛书
  table.insert(v, "item_tome_of_luoshu")

  local amount = 0
  if AIGameMode.iGameDifficulty and AIGameMode.iGameDifficulty >= 6 then
    amount = 10
  elseif AIGameMode.fBotGoldXpMultiplier >= 5 then
    amount = 8
  elseif AIGameMode.fBotGoldXpMultiplier >= 4 then
    amount = 6
  elseif AIGameMode.fBotGoldXpMultiplier >= 3 then
    amount = 4
  elseif AIGameMode.fBotGoldXpMultiplier >= 2 then
    amount = 2
  end
  for i = 1, amount do
    table.insert(v, "item_tome_of_strength")
    table.insert(v, "item_tome_of_agility")
    -- 最大吃N本智力书，防止魔抗溢出
    if i < 4 then
      table.insert(v, "item_tome_of_intelligence")
    end
  end
end
--------------------
-- Initial
--------------------
if BotThink == nil then
  print("Bot Think initialize!")
  _G.BotThink = class({}) -- put in the global scope
end

function BotThink:SetTome()
  local allPurchaseTable = tBotItemData.purchaseItemList
  for k, v in pairs(allPurchaseTable) do
    addTome(k, v)
  end
end

--------------------
-- common function
--------------------

-- find item
function BotThink:FindItemByNameNotIncludeBackpack(hHero, sName)
  for i = 0, 5 do
    if hHero:GetItemInSlot(i) and hHero:GetItemInSlot(i):GetName() == sName then return hHero:GetItemInSlot(i) end
  end
  return nil
end

function BotThink:FindItemByName(hHero, sName)
  for i = 0, 8 do
    if hHero:GetItemInSlot(i) and hHero:GetItemInSlot(i):GetName() == sName then return hHero:GetItemInSlot(i) end
  end
  return nil
end

function BotThink:FindItemByNameIncludeStash(hHero, sName)
  for i = 0, 15 do
    if hHero:GetItemInSlot(i) and hHero:GetItemInSlot(i):GetName() == sName then return hHero:GetItemInSlot(i) end
  end
  return nil
end

function BotThink:IsItemCanUse(hHero, sName)
  if hHero:HasItemInInventory(sName) then
    local item = BotThink:FindItemByNameNotIncludeBackpack(hHero, sName)
    if item and item:IsCooldownReady() then
      return true
    end
  end
  return false
end

-- find enemy
-- find many
function BotThink:FindEnemyHeroesInRangeAndVisible(hHero, iRange)
  local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange, DOTA_UNIT_TARGET_TEAM_ENEMY,
    DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_ANY_ORDER, false)
  AIGameMode:ArrayShuffle(tAllHeroes)
  return tAllHeroes
end

-- find one
function BotThink:FindNearestEnemyHeroesInRangeAndVisible(hHero, iRange)
  local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange, DOTA_UNIT_TARGET_TEAM_ENEMY,
    DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)
  if #tAllHeroes > 0 then
    return tAllHeroes[1]
  end
  return nil
end

-- find team
function BotThink:FindFriendHeroesInRangeAndVisible(hHero, iRange)
  local tAllHeroes = FindUnitsInRadius(hHero:GetTeam(), hHero:GetOrigin(), nil, iRange, DOTA_UNIT_TARGET_TEAM_FRIENDLY,
    DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, FIND_ANY_ORDER, false)
  AIGameMode:ArrayShuffle(tAllHeroes)
  return tAllHeroes
end

-- use item
function BotThink:UseItemOnTarget(hHero, sItemName, hTarget)
  if not hHero:HasItemInInventory(sItemName) then
    return false
  end
  local hItem = BotThink:FindItemByNameNotIncludeBackpack(hHero, sItemName)
  if hItem then
    if hItem:IsCooldownReady() then
      hHero:CastAbilityOnTarget(hTarget, hItem, hHero:GetPlayerOwnerID())
      return true
    end
  end
  return false
end

function BotThink:UseItemOnPostion(hHero, sItemName, hTarget)
  if not hHero:HasItemInInventory(sItemName) then
    return false
  end
  local hItem = BotThink:FindItemByNameNotIncludeBackpack(hHero, sItemName)
  if hItem then
    if hItem:IsCooldownReady() then
      hHero:CastAbilityOnPosition(hTarget:GetOrigin(), hItem, hHero:GetPlayerOwnerID())
      return true
    end
  end
  return false
end

function BotThink:UseItem(hHero, sItemName)
  if not hHero:HasItemInInventory(sItemName) then
    return false
  end
  local hItem = BotThink:FindItemByNameNotIncludeBackpack(hHero, sItemName)
  if hItem then
    if hItem:IsCooldownReady() then
      hHero:CastAbilityNoTarget(hItem, hHero:GetPlayerOwnerID())
      return true
    end
  end
  return false
end

function BotThink:GetCooldownTotal(hHero)
  local iCooldownTotal = 0
  for i = 0, 5 do
    local hAbility = hHero:GetAbilityByIndex(i)
    if hAbility then
      iCooldownTotal = iCooldownTotal + hAbility:GetCooldownTimeRemaining()
    end
  end
  -- item 0 to 8
  for i = 0, 8 do
    local hItem = hHero:GetItemInSlot(i)
    if hItem then
      iCooldownTotal = iCooldownTotal + hItem:GetCooldownTimeRemaining()
    end
  end
  local itemNeutral = hHero:GetItemInSlot(DOTA_ITEM_NEUTRAL_SLOT)
  if itemNeutral then
    iCooldownTotal = iCooldownTotal + itemNeutral:GetCooldownTimeRemaining()
  end
  return iCooldownTotal
end

--------------------
-- 是否在防御塔附近
--------------------
function BotThink:IsBesideFriendTower(hHero, radius)
  local vHeroPos = hHero:GetAbsOrigin()
  local towers = Entities:FindAllByClassnameWithin("npc_dota_tower", vHeroPos, radius)
  for i, vTower in ipairs(towers) do
    if vTower:GetTeamNumber() == hHero:GetTeamNumber() then
      return true
    end
  end
  return false
end

function BotThink:IsBesideEnemyTower(hHero, radius)
  local vHeroPos = hHero:GetAbsOrigin()
  local towers = Entities:FindAllByClassnameWithin("npc_dota_tower", vHeroPos, radius)
  for i, vTower in ipairs(towers) do
    if vTower:GetTeamNumber() ~= hHero:GetTeamNumber() then
      return true
    end
  end
  return false
end

--------------------
-- common function
--------------------
local function BuyItemIfGoldEnough(hHero, iPurchaseTable)
  if not iPurchaseTable then
    -- hero not has purchase table
    return false
  end
  if (#iPurchaseTable == 0) then
    -- no items to buy
    return false
  end
  local iItemName = iPurchaseTable[1]
  if not iItemName then
    -- no items to buy
    return false
  end
  local iCost = GetItemCost(iItemName)

  if (hHero:GetGold() > iCost) then
    if hHero:GetNumItemsInInventory() > 8 then
      -- print("Warn! Think purchase "..hHero:GetName().." add "..iItemName.." stop with item count "..hHero:GetNumItemsInInventory())
    else
      local addedItem = hHero:AddItemByName(iItemName)
      if addedItem then
        PlayerResource:SpendGold(hHero:GetPlayerID(), iCost, DOTA_ModifyGold_PurchaseItem)
        table.remove(iPurchaseTable, 1)
        return true
      else
        print("Warn! Think purchase " ..
          hHero:GetName() .. " add " .. iItemName .. " fail with item count " .. hHero:GetNumItemsInInventory())
        return false
      end
    end
  end
end

-- return true if sell
local function SellItemFromTable(hHero, iPurchaseTable)
  for k, vName in ipairs(iPurchaseTable) do
    local iCost = math.floor(GetItemCost(vName) / 2)
    local sellItem = BotThink:FindItemByNameIncludeStash(hHero, vName)
    if sellItem then
      -- hHero:RemoveItem(sellItem)
      UTIL_RemoveImmediate(sellItem)
      PlayerResource:ModifyGold(hHero:GetPlayerID(), iCost, true, DOTA_ModifyGold_SellItem)
      return true
    end
  end
  return false
end

--------------------
-- Item Think
--------------------
function BotThink:IsControllable(hHero)
  if hHero:IsNull() then return true end
  -- if hero is dead, do nothing
  if hHero:IsAlive() == false then return true end
  -- 眩晕
  if hHero:IsStunned() then return true end
  -- 变羊
  if hHero:IsHexed() then return true end
  -- 噩梦
  if hHero:IsNightmared() then return true end
  -- 虚空大
  if hHero:IsFrozen() then return true end
  -- 禁用物品
  if hHero:IsMuted() then return true end


  -- 战吼，决斗，冰龙大
  if hHero:HasModifier("modifier_axe_berserkers_call") or hHero:HasModifier("modifier_legion_commander_duel") or hHero:HasModifier("modifier_winter_wyvern_winters_curse") then return true end

  -- 哈斯卡 A杖大
  if hHero:HasModifier("modifier_huskar_life_break_taunt") then return true end

  -- TP
  if hHero:HasModifier("modifier_teleporting") then return true end

  return false
end

-- 物品购买
function BotThink:ThinkPurchase(hHero)
  local iHeroName = hHero:GetName()

  local iPurchaseTable = tBotItemData.purchaseItemList[iHeroName]
  BuyItemIfGoldEnough(hHero, iPurchaseTable)
end

function BotThink:ThinkPurchaseNeutral(hHero, GameTime)
  -- if hHero has neutral token
  local itemNeutral = hHero:GetItemInSlot(DOTA_ITEM_NEUTRAL_SLOT)
  if itemNeutral then
    if string.find(itemNeutral:GetName(), "item_tier") then
      -- remove item
      -- hHero:RemoveItem(itemNeutral)
      UTIL_RemoveImmediate(itemNeutral)
      return
    end
    -- if owner not self, remove
    if itemNeutral:GetPurchaser() ~= hHero then
      -- hHero:RemoveItem(itemNeutral)
      UTIL_RemoveImmediate(itemNeutral)
      return
    end
  end

  local iHeroName = hHero:GetName()

  local multiIndex = "x1"
  if AIGameMode.fBotGoldXpMultiplier < 4 then
    multiIndex = "x1"
  elseif AIGameMode.fBotGoldXpMultiplier <= 4 then
    multiIndex = "x4"
  elseif AIGameMode.fBotGoldXpMultiplier <= 6 then
    multiIndex = "x6"
  elseif AIGameMode.fBotGoldXpMultiplier <= 8 then
    multiIndex = "x8"
  elseif AIGameMode.fBotGoldXpMultiplier <= 10 then
    multiIndex = "x10"
  else
    multiIndex = "x20"
  end

  local addNeutralItemTime = tBotItemData.addNeutralItemMultiTimeMap[multiIndex] or
      tBotItemData.addNeutralItemMultiTimeMap["x1"]

  if (GameTime > addNeutralItemTime[1]) then
    local iPurchaseTable = tBotItemData.addNeutralItemList[iHeroName]
    BuyItemIfGoldEnough(hHero, iPurchaseTable)
    return true
  end
end

-- 物品出售
function BotThink:ThinkSell(hHero)
  local iHeroName = hHero:GetName()
  local iItemCount = hHero:GetNumItemsInInventory()
  if iItemCount <= 7 then
    return
  end

  local sellItemCommonList = tBotItemData.sellItemCommonList
  if SellItemFromTable(hHero, sellItemCommonList) then
    return
  end

  local iSellTable = tBotItemData.sellItemList[iHeroName]
  if not iSellTable then
    -- hero not has purchase table
    return
  end

  if SellItemFromTable(hHero, iSellTable) then
    return
  end
end

-- 物品消耗
function BotThink:ThinkConsumeItem(hHero)
  local itemConsumeList = tBotItemData.itemConsumeList
  for i, vItemUseName in ipairs(itemConsumeList) do
    BotThink:UseItemOnTarget(hHero, vItemUseName, hHero)
  end

  local itemConsumeNoTargetList = tBotItemData.itemConsumeNoTargetList
  for i, vItemUseName in ipairs(itemConsumeNoTargetList) do
    BotThink:UseItem(hHero, vItemUseName)
  end
end

-- 插眼
local wardItemTable = {
  "item_ward_observer",
  "item_ward_observer",
  "item_ward_observer",
  "item_ward_observer",
  "item_ward_sentry",
  "item_ward_sentry",
  "item_ward_sentry",
  "item_ward_sentry",
  "item_ward_sentry",
  "item_ward_sentry",
}
function BotThink:AddWardItem(hHero)
  local iItemCount = hHero:GetNumItemsInInventory()
  if iItemCount >= 8 then
    return
  end

  if BotThink:FindItemByNameIncludeStash(hHero, "item_ward_observer") then
    return
  end
  if BotThink:FindItemByNameIncludeStash(hHero, "item_ward_sentry") then
    return
  end
  if BotThink:FindItemByNameIncludeStash(hHero, "item_dust") then
    return
  end
  if BotThink:FindItemByNameIncludeStash(hHero, "item_gem") then
    return
  end

  local itemIndex = RandomInt(1, #wardItemTable)
  local sItemName = wardItemTable[itemIndex]
  local addedItem = hHero:AddItemByName(sItemName)
end

function BotThink:PutWardObserver(hHero)
  local wardPostionList = tBotItemData.wardObserverPostionList
  local sWardItemName = "item_ward_observer"
  local sUnitClassName = "npc_dota_ward_base"

  if BotThink:IsBesideFriendTower(hHero, 1600) then
    return
  end
  if BotThink:IsBesideEnemyTower(hHero, 900) then
    return
  end

  -- 随机在附近插假眼
  if RandomInt(1, 5) == 1 then
    wardPostionList = {}
    table.insert(wardPostionList, hHero:GetAbsOrigin())
  end

  if BotThink:IsItemCanUse(hHero, sWardItemName) then
    BotThink:PutWardItem(hHero, wardPostionList, sWardItemName, sUnitClassName)
  end
end

function BotThink:PutWardSentry(hHero)
  if BotThink:IsBesideFriendTower(hHero, 1000) then
    return
  end

  local wardPostionList = tBotItemData.wardSentryPostionList
  local sWardItemName = "item_ward_sentry"
  local sUnitClassName = "npc_dota_ward_base_truesight"

  -- 受伤时做真眼
  if hHero:GetHealthPercent() < 80 then
    wardPostionList = {}
    table.insert(wardPostionList, hHero:GetAbsOrigin())
  end

  if BotThink:IsItemCanUse(hHero, sWardItemName) then
    BotThink:PutWardItem(hHero, wardPostionList, sWardItemName, sUnitClassName)
  end
end

function BotThink:PutWardItem(hHero, wardPostionList, sWardItemName, sUnitClassName)
  -- if in range of wardPostionList, put ward
  local iCastRange = 500
  local iFindRange = 1200
  if sWardItemName == "item_ward_observer" then
    iFindRange = 1600
  end
  local wardItem = BotThink:FindItemByNameIncludeStash(hHero, sWardItemName)
  local vHeroPos = hHero:GetAbsOrigin()
  for _, vWardPos in ipairs(wardPostionList) do
    if wardItem then
      local wardPosVector = vWardPos + Vector(RandomInt(-50, 50), RandomInt(-50, 50), 0)
      local wardPosDistance = (wardPosVector - vHeroPos):Length()
      if wardPosDistance < iCastRange then
        -- find wards in wardPosVector
        local wards = Entities:FindAllByClassnameWithin(sUnitClassName, wardPosVector, iFindRange)
        -- for each wards, if not same team remove from list
        for i = #wards, 1, -1 do
          if wards[i]:GetTeamNumber() ~= hHero:GetTeamNumber() then
            table.remove(wards, i)
          end
        end
        -- if no wards, put ward
        if #wards == 0 then
          print("Think put ward " ..
            hHero:GetName() .. " try to put " .. sWardItemName .. " at [" .. vWardPos[1] .. "," .. vWardPos[2] .. "]")
          hHero:CastAbilityOnPosition(wardPosVector, wardItem, hHero:GetPlayerOwnerID())
        else
          -- print("Think put ward "..hHero:GetName().." !Stop to put ward at "..vWardPos[1]..","..vWardPos[2])
        end
        return
      end
    end
  end
end

-- 加钱
function BotThink:AddMoney(hHero)
  local iAddBase = AIGameMode.playerNumber * 2
  local GameTime = GameRules:GetDOTATime(false, false)
  local totalGold = PlayerResource:GetTotalEarnedGold(hHero:GetPlayerID())

  local goldPerSec = totalGold / GameTime

  local multiplier = AIGameMode.fBotGoldXpMultiplier
  if AIGameMode.bRadiantBotSameMulti and hHero:GetTeam() == DOTA_TEAM_GOODGUYS then
    multiplier = AIGameMode.fPlayerGoldXpMultiplier
  end

  local iAddMoney = math.floor(multiplier * iAddBase)

  if goldPerSec > iAddMoney then
    return false
  end

  if iAddMoney > 0 then
    hHero:ModifyGold(iAddMoney, true, DOTA_ModifyGold_GameTick)
    return true
  end
  return false
end
