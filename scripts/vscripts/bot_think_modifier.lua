require('bot_item_data')

--------------------
-- Initial
--------------------
if BotThink == nil then
  print("Bot Think initialize!")
	_G.BotThink = class({}) -- put in the global scope
  BotThink.itemPrice = LoadKeyValues("scripts/kv/item_price.kv")
end

--------------------
-- local function
--------------------
local function FindItemByNameNotIncludeBackpack(hHero, sName)
	for i = 0, 5 do
		if hHero:GetItemInSlot(i) and hHero:GetItemInSlot(i):GetName() == sName then return hHero:GetItemInSlot(i) end
	end
	return nil
end

local function FindItemByName(hHero, sName)
	for i = 0, 8 do
		if hHero:GetItemInSlot(i) and hHero:GetItemInSlot(i):GetName() == sName then return hHero:GetItemInSlot(i) end
	end
	return nil
end

local function FindItemByNameIncludeStash(hHero, sName)
	for i = 0, 15 do
		if hHero:GetItemInSlot(i) and hHero:GetItemInSlot(i):GetName() == sName then return hHero:GetItemInSlot(i) end
	end
	return nil
end

local function BuyItemIfGoldEnough(hHero, iItemName, iPurchaseTable)
  local iCost = GetItemCost(iItemName)
  
  if(hHero:GetGold() >= iCost) then
    if hHero:GetNumItemsInInventory() > 8 then
      -- TODO print
      print("Warn! Think purchase "..hHero:GetName().." add "..iItemName.." fail with item count "..hHero:GetNumItemsInInventory())
    else
      print("Think purchase "..hHero:GetName().." try to buy "..iItemName.." cost "..iCost)
      hHero:AddItemByName(iItemName)
      PlayerResource:SpendGold(hHero:GetPlayerID(), iCost, DOTA_ModifyGold_PurchaseItem)
      table.remove(iPurchaseTable,1)
    end
  end
end

--------------------
-- Item Think
--------------------
function BotThink:ThinkPurchase(hHero)
  local iHeroName = hHero:GetName()
  
  local iPurchaseTable = tBotItemData.purchaseItemList[iHeroName]
  if not iPurchaseTable then
    -- hero not has purchase table
    return
  end

  local iItemName = iPurchaseTable[1]
  if not iItemName then
    -- no items to buy
    return
  end

  BuyItemIfGoldEnough(hHero, iItemName, iPurchaseTable)
end

function BotThink:ThinkSell(hero)
  local iHeroName = hero:GetName()
  local iPlayerId = hero:GetPlayerID()
  local iItemCount = hero:GetNumItemsInInventory()
  if iItemCount <= 8 then
    return
  end

  local itemConsumableList = tBotItemData.itemConsumableList
  for x,vName in ipairs(itemConsumableList) do
    if hero:HasItemInInventory(vName) then
      for i = 0, 14 do
          local iItem = hero:GetItemInSlot(i)
          if iItem then
            local iItem_name = iItem:GetName()
            if vName == iItem_name then
              print("Think sell "..hero:GetName().." try to remove "..vName)
              hero:RemoveItem(iItem)
              return
            end
          end
      end
    end
  end

  local iSellTable = tBotItemData.sellItemList[iHeroName]
  if not iSellTable then
    -- hero not has purchase table
    return
  end

  local item_sell_name = iSellTable[1]
  if not item_sell_name then
    -- no items to buy
    return
  end
  local iCost = math.floor(GetItemCost(item_sell_name)/2)

  for i = 0, 14 do
      local iItem = hero:GetItemInSlot(i)
      if iItem then
        local iItem_name = iItem:GetName()
        if item_sell_name == iItem_name then
          print("Think sell "..hero:GetName().." try to sell "..item_sell_name.."cost "..iCost)
          hero:RemoveItem(iItem)
          PlayerResource:ModifyGold(iPlayerId, iCost, true, DOTA_ModifyGold_SellItem)
          table.remove(iSellTable,1)
          return
        end
      end
  end
end


function BotThink:ThinkConsumeItem(hHero)
  local hHeroName = hHero:GetName()
  local hPlayerId = hHero:GetPlayerID()

  local itemConsumeList = tBotItemData.itemConsumeList
  for i,vItemUseName in ipairs(itemConsumeList) do
    local hItem = FindItemByNameNotIncludeBackpack(hHero, vItemUseName)
    if hItem then
        print("Think use "..hHeroName.." try to use item "..vItemUseName)
				hHero:CastAbilityOnTarget(hHero, hItem, hHero:GetPlayerOwnerID())
		end
  end
end
