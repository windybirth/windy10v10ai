require('bot_item_data')

if BotThink == nil then

  print("Bot Think initialize!")
	_G.BotThink = class({}) -- put in the global scope
  BotThink.itemPrice = LoadKeyValues("scripts/kv/item_price.kv")
end

function BotThink:ThinkPurchase(hero)
  local iHeroName = hero:GetName()
  local iPlayerId = hero:GetPlayerID()
  local iPurchaseTable = tBotItemData.purchaseItemList[iHeroName]
  if not iPurchaseTable then
    -- hero not has purchase table
    return
  end

  local item_purchase_name = iPurchaseTable[1]
  if not item_purchase_name then
    -- no items to buy
    return
  end
  local iCost = GetItemCost(item_purchase_name)

  if(hero:GetGold() >= iCost) then
    print("Think purchase "..hero:GetName().." try to buy "..item_purchase_name.."cost "..iCost)
    hero:AddItemByName(item_purchase_name)
    PlayerResource:SpendGold(iPlayerId, iCost, DOTA_ModifyGold_PurchaseItem)
    table.remove(iPurchaseTable,1)
  end
end

function BotThink:ThinkSell(hero)
  local iHeroName = hero:GetName()
  local iPlayerId = hero:GetPlayerID()
  local iItemCount = hero:GetNumItemsInInventory()
  if iItemCount <= 8 then
    return
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
        end
      end
  end
end
