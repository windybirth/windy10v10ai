require('bot_item_data')

if BotThink == nil then

  print("Bot think initialize!")
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
  local iCost = BotThink.itemPrice[item_purchase_name]

  if not iCost then
    print("ThinkPurchase WARN! item ["..item_purchase_name.."] cost not set in item_price.kv")
    return
  end

  if(hero:GetGold() >= iCost) then
    print("Bot think purchase "..hero:GetName().." try to buy "..item_purchase_name.."cost "..iCost)
    hero:AddItemByName(item_purchase_name)
    PlayerResource:SpendGold(iPlayerId, iCost, DOTA_ModifyGold_PurchaseItem)
    table.remove(iPurchaseTable,1)
  end
end
