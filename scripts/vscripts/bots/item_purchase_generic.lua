----------------------------------------------------------------------------------------------------
--- The Creation Come From: BOT EXPERIMENT Credit:FURIOUSPUPPY
--- BOT EXPERIMENT Author: Arizona Fauzie
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=837040016
--- Refactor: 决明子 Email: dota2jmz@163.com 微博@Dota2_决明子
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1573671599
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1627071163
----------------------------------------------------------------------------------------------------
local Item = require( GetScriptDirectory()..'/FunLib/aba_item' )
local Role = require( GetScriptDirectory()..'/FunLib/aba_role' )

local bot = GetBot()

if bot:IsInvulnerable()
	or not bot:IsHero()
	or bot:IsIllusion()
	or bot:GetUnitName() == "npc_dota_hero_techies"
then
	return
end

local BotBuild = require( GetScriptDirectory() .. "/BotLib/" .. string.gsub( bot:GetUnitName(), "npc_dota_", "" ) )

if BotBuild == nil then return end

bot.itemToBuy = {}
bot.currentItemToBuy = nil
bot.currentComponentToBuy = nil
bot.currListItemToBuy = {}
bot.SecretShop = false


local sPurchaseList = BotBuild['sBuyList']
local sItemSellList = BotBuild['sSellList']

--颠倒购物顺序
for i = 1, #sPurchaseList
do
	bot.itemToBuy[i] = sPurchaseList[#sPurchaseList - i + 1]
end


local sell_time = -90
local check_time = -90


local lastItemToBuy = nil
local bPurchaseFromSecret = false
local itemCost = 0
local courier = nil
local t3AlreadyDamaged = false
local t3Check = -90


local function GeneralPurchase()

	--当前购买物品与上一个物品不相符时
	if lastItemToBuy ~= bot.currentComponentToBuy
	then
		lastItemToBuy = bot.currentComponentToBuy
		bot:SetNextItemPurchaseValue( GetItemCost( bot.currentComponentToBuy ) )
		bPurchaseFromSecret = IsItemPurchasedFromSecretShop( bot.currentComponentToBuy )
		itemCost = GetItemCost( bot.currentComponentToBuy )
	end

	if bot.currentComponentToBuy == "item_infused_raindrop"
		or bot.currentComponentToBuy == "item_tome_of_knowledge"
		or bot.currentComponentToBuy == "item_ward_observer"
		or bot.currentComponentToBuy == "item_ward_sentry"
	then
		if GetItemStockCount( bot.currentComponentToBuy ) <= 0
		then
			return
		end
	end

	local cost = itemCost

	--使得飞鞋一次购买完成
	if lastItemToBuy == 'item_boots'
		and bot.currentItemToBuy == 'item_travel_boots'
		and Item.HasBootsInMainSolt( bot )
	then
		cost = GetItemCost( 'item_travel_boots' )
	end
	
	--使得最后的散件和卷轴一次购买完成
	
	

	--留买活
	if bot:GetLevel() >= 18
		and t3AlreadyDamaged == false
		and DotaTime() > t3Check + 1.0
	then

		--高地塔被破坏开始留买
		for i = 2, 8, 3
		do
			local tower = GetTower( GetTeam(), i )
			if tower == nil or tower:GetHealth() / tower:GetMaxHealth() < 0.3
			then
				t3AlreadyDamaged = true
				break
			end
		end

		--但是二塔还在则暂时不留
		for i = 1, 7, 3
		do
			local tower = GetTower( GetTeam(), i )
			if tower ~= nil
				and tower:IsAlive()
			then
				t3AlreadyDamaged = false
				break
			end
		end

		--如果基地塔被破坏则留买
		for i = 9, 10, 1
		do
			local tower = GetTower( GetTeam(), i )
			if tower == nil
				or tower:GetHealth() / tower:GetMaxHealth() < 0.9
			then
				t3AlreadyDamaged = true
				break
			end
		end

		--超过了这个时间点留买
		if DotaTime() >= 54 * 60 then t3AlreadyDamaged = true end

		t3Check = DotaTime()

	elseif t3AlreadyDamaged == true
			and bot:GetBuybackCooldown() <= 10
	then
		cost = itemCost + bot:GetBuybackCost() + bot:GetNetWorth() / 40 - 300
	end

	--如果只剩下一个小配件则不留
	if #bot.currListItemToBuy == 1
		or Role.IsPvNMode()
	then
		cost = itemCost
	end

	--达到金钱需要时购物
	if bot:GetGold() >= cost
		and bot:GetItemInSlot( 14 ) == nil
	then

		if courier == nil
		then
			courier = bot.theCourier
		end

		--当信使购买神秘商店物品后
		if bot.SecretShop
			and courier ~= nil
			and GetCourierState( courier ) == COURIER_STATE_IDLE
			and courier:DistanceFromSecretShop() == 0
		then
			if courier:ActionImmediate_PurchaseItem( bot.currentComponentToBuy ) == PURCHASE_ITEM_SUCCESS
			then
				bot.currentComponentToBuy = nil
				bot.currListItemToBuy[#bot.currListItemToBuy] = nil
				bot.SecretShop = false
				return
			end
		end

		--决定是否在神秘购物
		if bPurchaseFromSecret
			and bot:DistanceFromSecretShop() > 0
		then
			bot.SecretShop = true
		else
			if bot:ActionImmediate_PurchaseItem( bot.currentComponentToBuy ) == PURCHASE_ITEM_SUCCESS
			then
				bot.currentComponentToBuy = nil
				bot.currListItemToBuy[#bot.currListItemToBuy] = nil
				bot.SecretShop = false
				return
			else
				print( bot:GetUnitName().." 未能购买物品 "..bot.currentComponentToBuy.." : "..tostring( bot:ActionImmediate_PurchaseItem( bot.currentComponentToBuy ) ) )
			end
		end
	else
		bot.SecretShop = false
	end
end


--加速模式购物逻辑
local function TurboModeGeneralPurchase()

	if lastItemToBuy ~= bot.currentComponentToBuy
	then
		lastItemToBuy = bot.currentComponentToBuy
		bot:SetNextItemPurchaseValue( GetItemCost( bot.currentComponentToBuy ) )
		itemCost = GetItemCost( bot.currentComponentToBuy )
		lastItemToBuy = bot.currentComponentToBuy
	end

	if bot.currentComponentToBuy == "item_infused_raindrop"
		or bot.currentComponentToBuy == "item_tome_of_knowledge"
		or bot.currentComponentToBuy == "item_ward_observer"
		or bot.currentComponentToBuy == "item_ward_sentry"
	then
		if GetItemStockCount( bot.currentComponentToBuy ) <= 0
		then
			return
		end
	end

	local cost = itemCost

	--使得飞鞋一次购买完成
	if lastItemToBuy == 'item_boots'
		and bot.currentItemToBuy == 'item_travel_boots'
		and Item.HasBootsInMainSolt( bot )
	then
		cost = GetItemCost( 'item_travel_boots' )
	end

	--加速模式一旦钱够了就买
	if bot:GetGold() >= cost
		and bot:GetItemInSlot( 14 ) == nil
	then
		if bot:ActionImmediate_PurchaseItem( bot.currentComponentToBuy ) == PURCHASE_ITEM_SUCCESS
		then
			bot.currentComponentToBuy = nil
			bot.currListItemToBuy[#bot.currListItemToBuy] = nil
			return
		else
			print( bot:GetUnitName().." 未能购买物品 "..bot.currentComponentToBuy.." : "..tostring( bot:ActionImmediate_PurchaseItem( bot.currentComponentToBuy ) ) )
		end
	end
end


local lastInvCheck = -90
local fullInvCheck = -90
local lastBootsCheck = -90
local buyBootsStatus = false
local buyRD = false
local buyTP = false

local buyAnotherTango = false
local buyAncientJanggoRecipe = false
local switchTime = 0
local buyWardTime = -999

local buyTPtime = 0
local buyBookTime = 0


function ItemPurchaseThink()

	if ( GetGameState() ~= GAME_STATE_PRE_GAME and GetGameState() ~= GAME_STATE_GAME_IN_PROGRESS )
	then return	end

	if bot:HasModifier( 'modifier_arc_warden_tempest_double' )
	then
		bot.itemToBuy = {}
		return
	end

	--------*******----------------*******----------------*******--------
	local currentTime = DotaTime()
	local botName = bot:GetUnitName()
	local botLevel = bot:GetLevel()
	local botGold = bot:GetGold()
	local botWorth = bot:GetNetWorth()
	local botMode = bot:GetActiveMode()
	local botHP	= bot:GetHealth() / bot:GetMaxHealth()
	--------*******----------------*******----------------*******--------

	--为中单买一个假眼
	if currentTime < 0
		and Item.GetEmptyInventoryAmount( bot ) <= 8
		and Role["bBuyMidWardDone"] == false
		and bot:GetAssignedLane() == LANE_MID
		and not Item.HasItem( bot, "item_ward_observer" )
		and GetItemStockCount( "item_ward_observer" ) >= 1
		and not Role.IsPvNMode()
	then
		Role["bBuyMidWardDone"] = true
		bot:ActionImmediate_PurchaseItem( "item_ward_observer" )
		return
	end

	--吃树用完了为中单额外买一个吃树
	if currentTime > 60
		and currentTime < 4 * 60
		and bot.theRole == "midlaner"
		and buyAnotherTango == false
		and not Item.HasItem( bot, "item_tango_single" )
		and not Item.HasItem( bot, "item_tango" )
		and botGold > GetItemCost( "item_tango" )
		and Item.GetEmptyInventoryAmount( bot ) >= 5
		and bot:GetCourierValue() == 0
	then
		bot:ActionImmediate_PurchaseItem( "item_tango" )
		buyAnotherTango = true
		return
	end 

	--更新队伍里是否有辅助的定位
	if Role['supportExist'] == nil then Role.UpdateSupportStatus( bot ) end

	--更新敌方是否有隐身英雄或道具的状态
	if Role['invisEnemyExist'] == false then Role.UpdateInvisEnemyStatus( bot ) end

	--更新是否出鞋的状态
	if buyBootsStatus == false
		and currentTime > lastBootsCheck + 2.0
	then
		buyBootsStatus = Item.HasBuyBoots( bot )
		lastBootsCheck = currentTime
	end

	--辅助定位英雄购买辅助物品
	if bot.theRole == 'support'
	then
		if currentTime < 0
			and botGold >= GetItemCost( "item_clarity" )
			and Item.HasItem( bot, "item_clarity" ) == false
			and not Role.IsPvNMode()
		then
			bot:ActionImmediate_PurchaseItem( "item_clarity" )
			return
		elseif botLevel >= 5
			and Role['invisEnemyExist'] == true
			and buyBootsStatus == true
			and botGold >= GetItemCost( "item_dust" )
			and Item.GetEmptyInventoryAmount( bot ) >= 2
			and Item.GetItemCharges( bot, "item_dust" ) <= 0
			and bot:GetCourierValue() == 0
		then
			bot:ActionImmediate_PurchaseItem( "item_dust" )
			return
		elseif GetItemStockCount( "item_ward_observer" ) >= 2
			and buyBootsStatus == true
			and Item.GetEmptyInventoryAmount( bot ) >= 2
			and Item.GetItemCharges( bot, "item_ward_observer" ) <= 0
			and Item.GetItemCharges( bot, "item_ward_dispenser" ) <= 0
			and bot:GetCourierValue() == 0
			and currentTime > 6 * 60
			and buyWardTime < currentTime - 3 * 60
			and not Role.IsPvNMode()
		then
			buyWardTime = currentTime
			bot:ActionImmediate_PurchaseItem( "item_ward_observer" )
			return
		end
	end


	--为辅助购买魂泪
	if buyRD == false
		and currentTime >= 3 * 60
		and currentTime <= 20 * 60
		and buyBootsStatus == true
		and GetItemStockCount( "item_infused_raindrop" ) >= 1
		and Item.GetItemCharges( bot, 'item_infused_raindrop' ) <= 0
		and botGold >= GetItemCost( "item_infused_raindrop" )
		and Item.HasItem( bot, 'item_boots' )
	then
		bot:ActionImmediate_PurchaseItem( "item_infused_raindrop" )
		buyRD = true
		return
	end


	--防止非辅助购买魂泪
	if buyRD == false
		and currentTime < 0
		and bot.theRole ~= 'support'
	then
		buyRD = true
	end


	--死前如果会损失金钱则购买额外TP
	if botGold >= GetItemCost( "item_tpscroll" )
		and bot:IsAlive()
		and botGold < ( GetItemCost( "item_tpscroll" ) + botWorth / 40 )
		and botHP < 0.08
		and GetGameMode() ~= 23
		and bot:GetHealth() >= 1
		and bot:WasRecentlyDamagedByAnyHero( 3.1 )
		and not Item.HasItem( bot, 'item_travel_boots' )
		and not Item.HasItem( bot, 'item_travel_boots_2' )
		and Item.GetItemCharges( bot, 'item_tpscroll' ) <= 2
	then
		bot:ActionImmediate_PurchaseItem( "item_tpscroll" )
		return
	end


	--辅助死前如果会损失金钱则购买粉
	if botGold >= GetItemCost( "item_dust" )
		and bot:IsAlive()
		and GetGameMode() ~= 23
		and botLevel > 6
		and bot.theRole == 'support'
		and botGold < ( GetItemCost( "item_dust" )  + botWorth / 40 )
		and botHP < 0.06
		and bot:WasRecentlyDamagedByAnyHero( 3.1 )
		and Item.GetItemCharges( bot, 'item_dust' ) <= 1
	then
		bot:ActionImmediate_PurchaseItem( "item_dust" )
		return
	end


	--死前如果会损失金钱则购买知识书
	if currentTime > 10 * 60
		and bot:IsAlive()
		and botGold >= GetItemCost( "item_tome_of_knowledge" )
		and botGold < ( GetItemCost( "item_tome_of_knowledge" ) + botWorth / 40 )
		and botHP < 0.08
		and botLevel <= 28
		and GetGameMode() ~= 23
		and bot:WasRecentlyDamagedByAnyHero( 3.1 )
		and GetItemStockCount( "item_tome_of_knowledge" ) >= 1
		and Item.GetItemCharges( bot, 'item_tome_of_knowledge' ) <= 0
		and buyBookTime < currentTime - 200.0
	then
		bot:ActionImmediate_PurchaseItem( "item_tome_of_knowledge" )
		buyBookTime = currentTime
		return
	end


	--交换魂泪的位置避免过早被破坏
	if currentTime > 180
		and currentTime < 1800
		and switchTime < currentTime - 5.6
	then
		local raindrop = bot:FindItemSlot( "item_infused_raindrop" )
		local raindropCharge = Item.GetItemCharges( bot, "item_infused_raindrop" )
		local nEnemyHeroes = bot:GetNearbyHeroes( 1600, true, BOT_MODE_NONE )
		if ( raindrop >= 0 and raindrop <= 5 )
			and ( nEnemyHeroes[1] ~= nil
				or botMode == BOT_MODE_ROSHAN
				or bot:WasRecentlyDamagedByAnyHero( 3.1 ) )
			and ( raindropCharge == 1 or raindropCharge >= 7 )
		then
			switchTime = currentTime
			bot:ActionImmediate_SwapItems( raindrop, 6 )
			return
		end
	end

	--交换眼,吃树,中立物品的位置
	if currentTime > 0
		and botMode ~= BOT_MODE_WARD
		and check_time < currentTime - 3.0
	then
		check_time = currentTime

		--眼
		local wardSlot = Item.GetItemWardSolt( bot )
		if wardSlot >=0 and wardSlot <= 5
			and bot.lastSwapWardTime < currentTime - 11
			and currentTime > 3 * 60
		then
			local mostCostItem = Item.GetTheItemSolt( bot, 6, 8, true )
			if mostCostItem ~= -1
			then
				bot:ActionImmediate_SwapItems( wardSlot, mostCostItem )
				return
			end
		end

		--吃树
		local tango_single = bot:FindItemSlot( 'item_tango_single' )
		if tango_single >= 0 and tango_single <= 5
			and Item.GetItemCountInSolt( bot, "item_tango_single", 0, 5 ) >= 2
		then
			local mostCostItem = Item.GetTheItemSolt( bot, 6, 8, true )
			if mostCostItem ~= -1
			then
				bot:ActionImmediate_SwapItems( tango_single, mostCostItem )
				return
			end
		end

		--获取副背包中最高级中立物品格子与等级
		--如果中立的等级小于副的等级就交换
		local nNeutralBackpackSolt = -1
		local nNeutralBackpackLevel = -1
		for i = 6, 8
		do
			local inSoltItem = bot:GetItemInSlot( i )
			if inSoltItem ~= nil
			then
				local inSoltItemName = inSoltItem:GetName()
				if Item.IsNeutralItem( inSoltItemName )
					and Item.GetNeutralItemLevel( inSoltItemName ) > nNeutralBackpackLevel
				then
					nNeutralBackpackSolt = i
					nNeutralBackpackLevel = Item.GetNeutralItemLevel( inSoltItemName )
				end
			end
		end

		if nNeutralBackpackSolt > 5
		then
			local nNeutralMainSolt = 16
			local nNeutralMainLevel = 999
			local inSoltItem = bot:GetItemInSlot( 16 )
			if inSoltItem == nil
			then
				nNeutralMainLevel = 0
			else
				local inSoltItemName = inSoltItem:GetName()
				nNeutralMainLevel = Item.GetNeutralItemLevel( inSoltItemName )
			end

			if nNeutralBackpackLevel > nNeutralMainLevel
			then
				bot:ActionImmediate_SwapItems( nNeutralBackpackSolt, nNeutralMainSolt )
				return
			end

		end

	end


	--卖掉一些早期的低端物品用来腾格子
	if ( GetGameMode() ~= 23 and botLevel > 6 and currentTime > fullInvCheck + 1.0
		and ( bot:DistanceFromFountain() <= 100 or bot:DistanceFromSecretShop() <= 100 ) )
		or ( GetGameMode() == 23 and botLevel > 9 and currentTime > fullInvCheck + 1.0 )
	then
		local emptySlot = Item.GetEmptyInventoryAmount( bot )
		local slotToSell = nil

		local preEmpty = 2
		if botLevel <= 17 then preEmpty = 1 end
		if emptySlot <= preEmpty - 1
		then
			for i = 1, #Item['tEarlyItem']
			do
				local itemName = Item['tEarlyItem'][i]
				local itemSlot = bot:FindItemSlot( itemName )
				if itemSlot >= 0 and itemSlot <= 8
				then
					slotToSell = itemSlot
					break
				end
			end
		end

		--避免过早卖掉大魔棒
		if botWorth > 9999
		then
			local wand = bot:FindItemSlot( "item_magic_wand" )
			local assitItem = bot:FindItemSlot( "item_infused_raindrop" )
			if assitItem < 0 then assitItem = bot:FindItemSlot( "item_bracer" ) end
			if assitItem < 0 then assitItem = bot:FindItemSlot( "item_null_talisman" ) end
			if assitItem < 0 then assitItem = bot:FindItemSlot( "item_wraith_band" ) end
			if assitItem >= 0
				and wand >= 6
				and wand <= 8
			then
				slotToSell = assitItem
			end
		end
		
		--销毁掉中立物品
		if bot:GetActiveMode() ~= BOT_MODE_RUNE
			and Item.GetNeutralItemCount( bot ) >= 2
		then
			local nMinLevelItemSolt = nil
			local nMinItemLevel = 99
			local nSlotList = {6, 7, 8, 16}
			for _, i in pairs( nSlotList )
			do
				local inSoltItem = bot:GetItemInSlot( i )
				if inSoltItem ~= nil
				then
					local inSoltItemName = inSoltItem:GetName()
					if Item.IsNeutralItem( inSoltItemName )
						and Item.GetNeutralItemLevel( inSoltItemName ) < nMinItemLevel
					then
						nMinLevelItemSolt = i
						nMinItemLevel = Item.GetNeutralItemLevel( inSoltItemName )
					end
				end
			end
			
			if nMinLevelItemSolt ~= nil
				and ( Item.GetNeutralItemCount( bot ) >= 3 
						or nMinItemLevel <= Item.GetMinTeamNeutralItemLevel() )
			then
				slotToSell = nMinLevelItemSolt
			end
		end

		if slotToSell ~= nil
		then
			bot:ActionImmediate_SellItem( bot:GetItemInSlot( slotToSell ) )
			return
		end

		fullInvCheck = currentTime
	end

	--出售过度装备
	if currentTime > sell_time + 0.5
		and ( bot:GetItemInSlot( 6 ) ~= nil or bot:GetItemInSlot( 7 ) ~= nil or bot:GetItemInSlot( 8 ) ~= nil )
		and ( bot:DistanceFromFountain() <= 100 or bot:DistanceFromSecretShop() <= 100 )
	then
		sell_time = currentTime

		for i = 2 , #sItemSellList, 2
		do
			local nNewSlot = bot:FindItemSlot( sItemSellList[i - 1] )
			local nOldSlot = bot:FindItemSlot( sItemSellList[i] )
			if nNewSlot >= 0 and nOldSlot >= 0
			then
				bot:ActionImmediate_SellItem( bot:GetItemInSlot( nOldSlot ) )
				return
			end
		end


		--当有飞鞋时卖掉其他早期鞋子
		if currentTime > 28 * 60
			and ( Item.HasItem( bot, "item_travel_boots" ) or Item.HasItem( bot, "item_travel_boots_2" ) )
		then
			for i = 1, #Item['tEarlyBoots']
			do
				local bootsSlot = bot:FindItemSlot( Item['tEarlyBoots'][i] )
				if bootsSlot >= 0
				then
					bot:ActionImmediate_SellItem( bot:GetItemInSlot( bootsSlot ) )
					return
				end
			end
		end

	end


	--TP用完了就把TP加入购物列表,每隔一段时间才加一次
	if currentTime > 4 * 60
		and buyTP == false
		and bot:GetCourierValue() == 0
		and botGold >= GetItemCost( "item_tpscroll" )
		and not Item.HasItem( bot, 'item_travel_boots' )
		and not Item.HasItem( bot, 'item_travel_boots_2' )
	then
		local tCharges = Item.GetItemCharges( bot, 'item_tpscroll' )		
		if bot:HasModifier("modifier_teleporting") then tCharges = tCharges - 1 end
		
		if tCharges <= 0
			or ( botLevel >= 18 and tCharges <= 1 )
		then

			if botLevel < 18 or ( botLevel >= 18 and tCharges == 1 )
			then
				buyTP = true
				buyTPtime = currentTime
				bot.currentComponentToBuy = nil
				bot.currListItemToBuy[#bot.currListItemToBuy+1] = 'item_tpscroll'
				if #bot.itemToBuy == 0
				then
					bot.itemToBuy = { 'item_tpscroll' }
					if bot.currentItemToBuy == nil
					then
						bot.currentItemToBuy = 'item_tpscroll'
					end
				end
				return
			end

			if botLevel >= 18 and tCharges == 0 and botGold >= GetItemCost( "item_tpscroll" ) * 2
			then
				buyTP = true
				buyTPtime = currentTime
				bot.currentComponentToBuy = nil
				bot.currListItemToBuy[#bot.currListItemToBuy+1] = 'item_tpscroll'
				bot.currListItemToBuy[#bot.currListItemToBuy+1] = 'item_tpscroll'
				if #bot.itemToBuy == 0
				then
					bot.itemToBuy = { 'item_tpscroll' }
					if bot.currentItemToBuy == nil
					then
						bot.currentItemToBuy = 'item_tpscroll'
					end
				end
				return
			end
			
		end
	end

	--记录购买TP的状态
	if buyTP == true and buyTPtime < currentTime - 70
	then
		buyTP = false
		return
	end
	
	--战鼓点数耗尽则购买一次卷轴
	if not buyAncientJanggoRecipe
		and botWorth <= 19999
		and Item.HasItem( bot, "item_ancient_janggo" )
		and Item.GetItemCharges( bot, "item_ancient_janggo" ) == 0
		and botGold >= GetItemCost( "item_recipe_ancient_janggo" )
	then
		bot:ActionImmediate_PurchaseItem( "item_recipe_ancient_janggo" )
		buyAncientJanggoRecipe = true
		return
	end
	
	--记录战鼓的状态
	if buyAncientJanggoRecipe == true 
		and Item.GetItemCharges( bot, "item_ancient_janggo" ) >= 1
	then
		buyAncientJanggoRecipe = false
		return
	end
	

	--没有购物需要了
	if #bot.itemToBuy == 0 then bot:SetNextItemPurchaseValue( 0 ) return end

	--计算购物清单
	if bot.currentItemToBuy == nil
		and #bot.currListItemToBuy == 0
	then
		bot.currentItemToBuy = bot.itemToBuy[#bot.itemToBuy]
		local tempTable = Item.GetBasicItems( { bot.currentItemToBuy } )
		for i = 1, math.ceil( #tempTable / 2 )
		do
			bot.currListItemToBuy[i] = tempTable[#tempTable-i+1]
			bot.currListItemToBuy[#tempTable-i+1] = tempTable[i]
		end

	end

	--检测购物情况
	if #bot.currListItemToBuy == 0 and currentTime > lastInvCheck + 1.0
	then
		if Item.IsItemInHero( bot.currentItemToBuy )
		then
			bot.currentItemToBuy = nil
			bot.itemToBuy[#bot.itemToBuy] = nil
		else
			lastInvCheck = currentTime
		end
	--购买物品配件
	elseif #bot.currListItemToBuy > 0
	then
		if bot.currentComponentToBuy == nil
		then
			bot.currentComponentToBuy = bot.currListItemToBuy[#bot.currListItemToBuy]
		else
			if GetGameMode() == 23
			then
				TurboModeGeneralPurchase()
			else
				GeneralPurchase()
			end
		end
	end

end
-- dota2jmz@163.com QQ:2462331592