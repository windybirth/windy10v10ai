----------------------------------------------------------------------------------------------------
--- The Creation Come From: BOT EXPERIMENT Credit:FURIOUSPUPPY
--- BOT EXPERIMENT Author: Arizona Fauzie 2018.11.21
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=837040016
--- Refactor: 决明子 Email: dota2jmz@163.com 微博@Dota2_决明子
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1573671599
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1627071163
----------------------------------------------------------------------------------------------------

if GetBot():IsInvulnerable() or not GetBot():IsHero() or not string.find(GetBot():GetUnitName(), "hero") or  GetBot():IsIllusion() then
	return;
end

local Site = require( GetScriptDirectory()..'/FunLib/aba_site')
local bot = GetBot();
local X = {}
local AvailableSpots = {};
local nWardCastRange = 500;
local itemWard = nil;
local targetLoc = nil;
local wardCastTime = -90;


bot.lastSwapWardTime = -90;
bot.ward = false;


local vNonStuck = Vector(-2610.000000, 538.000000, 0.000000);


local walkMode = false;
local walkLocation = Vector(0,0);

local nStartTime = RandomInt(1,10);

function GetDesire()
	
	if bot:GetUnitName() == "npc_dota_hero_necrolyte" 
	   and bot:GetLevel() > 10
	   and bot:IsAlive()
	   and not bot:IsChanneling()
	   and not bot:IsCastingAbility()
	   and bot:NumQueuedActions() <= 0
	then
		local cAbilty = bot:GetAbilityByName( "necrolyte_death_pulse" );
		local nEnemys = bot:GetNearbyHeroes(1600,true,BOT_MODE_NONE); 
		if cAbilty ~= nil and #nEnemys == 0
		   and ( cAbilty:IsFullyCastable() or (cAbilty:GetCooldownTimeRemaining() < 3 and bot:GetMana() > 180) )
		then
			local nAoe = bot:FindAoELocation( true, false, bot:GetLocation(),700, 475, 0.5, 0);
			local nLaneCreeps = bot:GetNearbyLaneCreeps(1000,true);
			if nAoe.count >= 3 
				and #nLaneCreeps >= 3
			then
				walkMode = true;
				walkLocation = nAoe.targetloc;
				return BOT_MODE_DESIRE_VERYHIGH;
			end
		end
	end
	
	itemWard = Site.GetItemWard(bot);

	if bot:IsChanneling() 
	   or bot:IsIllusion() 
	   or bot:IsInvulnerable() 
	   or not X.IsSuitableToWard()
	   or not bot:IsAlive()
	then
		return BOT_MODE_DESIRE_NONE;
	end
	
	if DotaTime() < 15 + nStartTime
	then
		return BOT_MODE_DESIRE_NONE;
	end	
	
	if itemWard ~= nil  then
		
		AvailableSpots = Site.GetAvailableSpot(bot);
		targetLoc, targetDist = Site.GetClosestSpot(bot, AvailableSpots);
		if targetLoc ~= nil 
			and targetDist < 7200
			and DotaTime() > wardCastTime + 1.0 
		then
			bot.ward = true;
			return math.floor((RemapValClamped(targetDist, 6000, 0, BOT_MODE_DESIRE_MODERATE, BOT_MODE_DESIRE_VERYHIGH))*20)/20;
		end
	end
	
	return BOT_MODE_DESIRE_NONE;
end

function OnStart()
	if itemWard ~= nil and not walkMode then
		local wardSlot = X.GetItemWardSolt()
		if bot:GetItemSlotType(wardSlot) == ITEM_SLOT_TYPE_BACKPACK 
		then
			local leastCostItem = X.FindLeastItemSlot();
			if leastCostItem ~= -1 then
				bot.lastSwapWardTime = DotaTime();
				bot:ActionImmediate_SwapItems( wardSlot, leastCostItem );
				return
			end
			--local active = bot:GetItemInSlot(leastCostItem);
			--print(active:GetName()..'IsCastable:'..tostring(active:IsFullyCastable()));
		end
	end
end

function OnEnd()
	AvailableSpots = {};
	itemWard = nil;
	walkMode = false;
end

function Think()

	if GetGameState()~=GAME_STATE_PRE_GAME and GetGameState()~= GAME_STATE_GAME_IN_PROGRESS then
		return;
	end
	

	if walkMode then
		local nCreep = bot:GetNearbyLaneCreeps(1000,true);
		if GetUnitToLocationDistance(bot,walkLocation) <= 20
		then
			if nCreep[1] ~= nil and nCreep[1]:IsAlive()
			then
				bot:Action_AttackUnit(nCreep[1], true);
			end
			if #nCreep == 0 then walkMode = false; end
			return;
		else
			bot:Action_MoveToLocation(walkLocation);
			if #nCreep == 0 then walkMode = false; end
			return;
		end
	end

	
	if bot.ward then
		if targetDist <= nWardCastRange then
			if  DotaTime() > bot.lastSwapWardTime + 6.1 then
				bot:Action_UseAbilityOnLocation(itemWard, targetLoc);
				wardCastTime = DotaTime();	
				return
			else
				if targetLoc == Vector(-2948.000000, 769.000000, 0.000000) then
					bot:Action_MoveToLocation(vNonStuck +RandomVector(300));
					return
				else	
					bot:Action_MoveToLocation(targetLoc +RandomVector(300));
					return
				end
			end
		else
			if targetLoc == Vector(-2948.000000, 769.000000, 0.000000) then
				bot:Action_MoveToLocation(vNonStuck +RandomVector(100));
				return
			else	
				bot:Action_MoveToLocation(targetLoc +RandomVector(100));
				return
			end
		end
	end
	
	

end


function X.FindLeastItemSlot()
	local minCost = 100000;
	local idx = -1;
	for i=0,5 
	do
		local hItem = bot:GetItemInSlot(i)
		if  hItem ~= nil 
			and hItem:GetName() ~= "item_aegis"  
			and hItem:GetName() ~= "item_gem"  
		then
			local sItemName = hItem:GetName()
			if( GetItemCost(sItemName) < minCost ) 
			then
				minCost = GetItemCost(sItemName);
				idx = i;
			end
		end
	end
	return idx;
end


--check if the condition is suitable for warding
function X.IsSuitableToWard()
	local Enemies = bot:GetNearbyHeroes(1300, true, BOT_MODE_NONE);
	local mode = bot:GetActiveMode();
	if ( ( mode == BOT_MODE_RETREAT and bot:GetActiveModeDesire() >= BOT_MODE_DESIRE_MODERATE )
		or mode == BOT_MODE_ATTACK
		or mode == BOT_MODE_RUNE 
		or mode == BOT_MODE_DEFEND_ALLY
		or mode == BOT_MODE_DEFEND_TOWER_TOP
		or mode == BOT_MODE_DEFEND_TOWER_MID
		or mode == BOT_MODE_DEFEND_TOWER_BOT
		or #Enemies >= 2
		or ( #Enemies >= 1 and X.IsIBecameTheTarget(Enemies) )
		or bot:WasRecentlyDamagedByAnyHero(5.0)
		) 
	then
		return false;
	end
	return true;
end


function X.IsIBecameTheTarget(units)
	for _,u in pairs(units) do
		if u:GetAttackTarget() == bot then
			return true;
		end
	end
	return false;
end


function X.GetItemWardSolt()

	local sWardTypeList = {
		'item_ward_observer',
		'item_ward_sentry',
		'item_ward_dispenser',
	}


	for _,sType in pairs(sWardTypeList)
	do
		local nWardSolt = bot:FindItemSlot(sType)
		if nWardSolt ~= -1
		then
			return nWardSolt
		end
	end

	return -1

end

-- dota2jmz@163.com QQ:2462331592
