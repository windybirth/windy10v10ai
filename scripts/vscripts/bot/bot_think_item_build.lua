--[[ ============================================================================================================
	Author: Windy
	Date: September 14, 2021
================================================================================================================= ]]
require('bot/bot_item_data')
require('bot/bot_think_item_use')


local function addTome(k, v)
  local amount = 5
  if AIGameMode.fBotGoldXpMultiplier > 10 then
    amount = 10
  elseif AIGameMode.fBotGoldXpMultiplier > 8 then
    amount = 8
  elseif AIGameMode.fBotGoldXpMultiplier > 6 then
    amount = 6
  end
  for i = 1, amount do
    table.insert(v,"item_tome_of_agility")
    table.insert(v,"item_tome_of_strength")
    table.insert(v,"item_tome_of_intelligence")
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
  for k,v in pairs(allPurchaseTable) do
    addTome(k,v)
  end
end

local function BuyItemIfGoldEnough(hHero, iPurchaseTable)
  if not iPurchaseTable then
    -- hero not has purchase table
    return false
  end
  if ( #iPurchaseTable == 0 ) then
      -- no items to buy
      return false
  end
  local iItemName = iPurchaseTable[1]
  if not iItemName then
    -- no items to buy
    return false
  end
  local iCost = GetItemCost(iItemName)

  if(hHero:GetGold() > iCost) then
    if hHero:GetNumItemsInInventory() > 8 then
      -- TODO print
      print("Warn! Think purchase "..hHero:GetName().." add "..iItemName.." stop with item count "..hHero:GetNumItemsInInventory())
    else
      local addedItem = hHero:AddItemByName(iItemName)
      if addedItem then
        PlayerResource:SpendGold(hHero:GetPlayerID(), iCost, DOTA_ModifyGold_PurchaseItem)
        table.remove(iPurchaseTable,1)
        return true
      else
        print("Warn! Think purchase "..hHero:GetName().." add "..iItemName.." fail with item count "..hHero:GetNumItemsInInventory())
        return false
      end
    end
  end
end

-- return true if sell
local function SellItemFromTable(hHero, iPurchaseTable)
  for k,vName in ipairs(iPurchaseTable) do
    local iCost = math.floor(GetItemCost(vName)/2)
    local sellItem = FindItemByNameIncludeStash(hHero, vName)
    if sellItem then
      hHero:RemoveItem(sellItem)
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

  -- TP
	if hHero:HasModifier("modifier_teleporting") then return true end

  return false
end

function BotThink:ThinkPurchase(hHero)
  local iHeroName = hHero:GetName()

  local iPurchaseTable = tBotItemData.purchaseItemList[iHeroName]
  BuyItemIfGoldEnough(hHero, iPurchaseTable)
end

function BotThink:ThinkPurchaseNeutral(hHero, GameTime)
  local iHeroName = hHero:GetName()

  local multiIndex = "x"..AIGameMode.fBotGoldXpMultiplier
  multiIndex = multiIndex:gsub("%.", "%_")
  local addNeutralItemTime = tBotItemData.addNeutralItemMultiTimeMap[multiIndex] or tBotItemData.addNeutralItemMultiTimeMap["x1"]

  if (GameTime > addNeutralItemTime[1]) then
    local iPurchaseTable = tBotItemData.addNeutralItemList[iHeroName]
    BuyItemIfGoldEnough(hHero, iPurchaseTable)
    return true
  end
end

function BotThink:ThinkSell(hero)
  local iHeroName = hero:GetName()
  local iItemCount = hero:GetNumItemsInInventory()
  if iItemCount <= 7 then
    return
  end

  local sellItemCommonList = tBotItemData.sellItemCommonList
  if SellItemFromTable(hero, sellItemCommonList) then
    return
  end

  local iSellTable = tBotItemData.sellItemList[iHeroName]
  if not iSellTable then
    -- hero not has purchase table
    return
  end

  if SellItemFromTable(hero, iSellTable) then
    return
  end
end


function BotThink:ThinkConsumeItem(hHero)
  local itemConsumeList = tBotItemData.itemConsumeList
  for i,vItemUseName in ipairs(itemConsumeList) do
    UseItemOnTarget(hHero, vItemUseName, hHero)
  end

  local itemConsumeNoTargetList = tBotItemData.itemConsumeNoTargetList
  for i,vItemUseName in ipairs(itemConsumeNoTargetList) do
    UseItem(hHero, vItemUseName)
  end
end

function BotThink:AddMoney(hHero)
  local iAddBase = 5
  if AIGameMode.DebugMode then
    iAddBase = 50
  end
  local GameTime = GameRules:GetDOTATime(false, false)
  local totalGold = PlayerResource:GetTotalEarnedGold(hHero:GetPlayerID())
  if totalGold > 99999 then
    return false
  end
  local goldPerSec = totalGold/GameTime

  local multiplier = AIGameMode.fBotGoldXpMultiplier
  if AIGameMode.bRadiantBotSameMulti and hHero:GetTeam() == DOTA_TEAM_GOODGUYS then
    multiplier = AIGameMode.fPlayerGoldXpMultiplier
  end

  if goldPerSec > (10 + multiplier*iAddBase) then
    return false
  end

	local iAddMoney = math.floor(10 + multiplier*iAddBase)

  if iAddMoney > 0 then
    hHero:ModifyGold(iAddMoney, true, DOTA_ModifyGold_GameTick)
    return true
  end
	return false
end
