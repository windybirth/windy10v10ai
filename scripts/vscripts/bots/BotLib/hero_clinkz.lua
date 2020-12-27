----------------------------------------------------------------------------------------------------
--- The Creation Come From: BOT EXPERIMENT Credit:FURIOUSPUPPY
--- BOT EXPERIMENT Author: Arizona Fauzie 2018.11.21
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=837040016
--- Refactor: 决明子 Email: dota2jmz@163.com 微博@Dota2_决明子
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1573671599
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1627071163
----------------------------------------------------------------------------------------------------
local X = {}
local bDebugMode = ( 1 == 10 )
local bot = GetBot()

local J = require( GetScriptDirectory()..'/FunLib/jmz_func' )
local Minion = dofile( GetScriptDirectory()..'/FunLib/aba_minion' )
local sTalentList = J.Skill.GetTalentList( bot )
local sAbilityList = J.Skill.GetAbilityList( bot )
local sOutfitType = J.Item.GetOutfitType( bot )


local tTalentTreeList = {
						['t25'] = {10, 0},
						['t20'] = {10, 0},
						['t15'] = {10, 0},
						['t10'] = {10, 0},
}

local tAllAbilityBuildList = {
						{2,1,2,3,2,6,2,1,1,1,6,3,3,3,6},
}

local nAbilityBuildList = J.Skill.GetRandomBuild( tAllAbilityBuildList )

local nTalentBuildList = J.Skill.GetTalentBuild( tTalentTreeList )

local sRandomItem_1 = RandomInt( 1, 9 ) > 6 and "item_satanic" or "item_butterfly"

local tOutFitList = {}

tOutFitList['outfit_carry'] = {

	"item_ranged_carry_outfit",
	"item_blight_stone",
	"item_dragon_lance",
	"item_orchid",
	"item_desolator",
	"item_black_king_bar",
	"item_travel_boots",
	"item_bloodthorn",
	"item_hurricane_pike",
	sRandomItem_1,
	"item_moon_shard",
	"item_travel_boots_2",

}

tOutFitList['outfit_mid'] = tOutFitList['outfit_carry']

tOutFitList['outfit_priest'] = tOutFitList['outfit_carry']

tOutFitList['outfit_mage'] = tOutFitList['outfit_carry']

tOutFitList['outfit_tank'] = tOutFitList['outfit_carry']

X['sBuyList'] = tOutFitList[sOutfitType]


X['sSellList'] = {

	"item_bloodthorn",
	"item_magic_wand",

}

if J.Role.IsPvNMode() or J.Role.IsAllShadow() then X['sBuyList'], X['sSellList'] = { 'PvN_clinkz' }, {} end

nAbilityBuildList, nTalentBuildList, X['sBuyList'], X['sSellList'] = J.SetUserHeroInit( nAbilityBuildList, nTalentBuildList, X['sBuyList'], X['sSellList'] )

X['sSkillList'] = J.Skill.GetSkillList( sAbilityList, nAbilityBuildList, sTalentList, nTalentBuildList )

X['bDeafaultAbility'] = false
X['bDeafaultItem'] = false

function X.MinionThink( hMinionUnit )

	if Minion.IsValidUnit( hMinionUnit )
		and hMinionUnit:GetUnitName() ~= "npc_dota_clinkz_skeleton_archer"
	then
		Minion.IllusionThink( hMinionUnit )
	end

end

--[[

npc_dota_hero_clinkz

7.23
"Ability1"		"clinkz_death_pact"
"Ability2"		"clinkz_searing_arrows"
"Ability3"		"clinkz_wind_walk"
"Ability4"		"generic_hidden"
"Ability5"		"generic_hidden"
"Ability6"		"clinkz_burning_army"
"Ability10"		"special_bonus_agility_8"
"Ability11"		"special_bonus_strength_10"
"Ability12"		"special_bonus_unique_clinkz_5"
"Ability13"		"special_bonus_unique_clinkz_1"
"Ability14"		"special_bonus_attack_range_125"
"Ability15"		"special_bonus_unique_clinkz_6"
"Ability16"		"special_bonus_unique_clinkz_2"
"Ability17"		"special_bonus_unique_clinkz_3"

modifier_clinkz_skeleton_archer_taunt_anim
modifier_clinkz_strafe
modifier_clinkz_searing_arrows
modifier_clinkz_wind_walk
modifier_clinkz_death_pact
modifier_clinkz_burning_army_thinker
modifier_clinkz_burning_army


--]]

local abilityQ = bot:GetAbilityByName( sAbilityList[1] )
local abilityW = bot:GetAbilityByName( sAbilityList[2] )
local abilityE = bot:GetAbilityByName( sAbilityList[3] )
local abilityR = bot:GetAbilityByName( sAbilityList[6] )
local talent4 = bot:GetAbilityByName( sTalentList[4] )

local castQDesire, castQTarget
local castWDesire, castWTarget
local castEDesire
local castRDesire, castRTarget

local nKeepMana, nMP, nHP, nLV, hEnemyList, hAllyList, botTarget, sMotive
local aetherRange = 0

function X.SkillsComplement()

	if J.CanNotUseAbility( bot ) then return end

	nKeepMana = 200
	aetherRange = 0
	nLV = bot:GetLevel()
	nMP = bot:GetMana()/bot:GetMaxMana()
	nHP = bot:GetHealth()/bot:GetMaxHealth()
	botTarget = J.GetProperTarget( bot )
	hEnemyList = bot:GetNearbyHeroes( 1600, true, BOT_MODE_NONE )
	hAllyList = J.GetAlliesNearLoc( bot:GetLocation(), 1600 )


	local aether = J.IsItemAvailable( "item_aether_lens" )
	if aether ~= nil then aetherRange = 250 end

	castEDesire, sMotive = X.ConsiderE()
	if ( castEDesire > 0 )
	then
		J.SetReportMotive( bDebugMode, sMotive )

		J.SetQueuePtToINT( bot, true )

		bot:ActionQueue_UseAbility( abilityE )
		return
	end

	castRDesire, castRTarget, sMotive = X.ConsiderR()
	if ( castRDesire > 0 )
	then
		J.SetReportMotive( bDebugMode, sMotive )

		J.SetQueuePtToINT( bot, true )

		bot:ActionQueue_UseAbilityOnEntity( abilityR, castRTarget )
		return

	end

	castQDesire, sMotive = X.ConsiderQ()
	if ( castQDesire > 0 )
	then
		J.SetReportMotive( bDebugMode, sMotive )

		J.SetQueuePtToINT( bot, true )

		bot:ActionQueue_UseAbility( abilityQ )
		return
	end

	castWDesire, castWTarget, sMotive = X.ConsiderW()
	if ( castWDesire > 0 )
	then
		J.SetReportMotive( bDebugMode, sMotive )

		bot:Action_UseAbilityOnEntity( abilityW, castWTarget )
		return
	end

end


function X.ConsiderR()


	if not abilityR:IsFullyCastable() then return 0 end

	local nSkillLV = abilityR:GetLevel()
	local nCastRange = abilityR:GetCastRange() + aetherRange + 32
	local nCastPoint = abilityR:GetCastPoint()
	local nManaCost = abilityR:GetManaCost()
	local nDamage = abilityR:GetAbilityDamage()
	local nDamageType = DAMAGE_TYPE_MAGICAL

	if #hEnemyList == 0 then nCastRange = 1600 end

	local nEnemyCreepList = bot:GetNearbyCreeps( nCastRange, true )

	local nBestEnemyCreep = nil

	local targetCreepBountyGoldMax = 0
	for _, nCreep in pairs( nEnemyCreepList )
	do
		if J.IsValid( nCreep )
			and not nCreep:IsHero()
			and not nCreep:IsAncientCreep()
			and not nCreep:IsMagicImmune()
			and nCreep:GetHealth() > targetCreepBountyGoldMax
		then
			nBestEnemyCreep = nCreep
			targetCreepBountyGoldMax = nCreep:GetHealth()
		end
	end

	if nBestEnemyCreep ~= nil 
	then
		return BOT_ACTION_DESIRE_HIGH, nBestEnemyCreep, "R-吃兵:"..nBestEnemyCreep:GetUnitName()
	end
	
	return BOT_ACTION_DESIRE_NONE


end



local lastAutoTime = 0
function X.ConsiderW()

	if not abilityW:IsFullyCastable() or bot:IsDisarmed() then
		return BOT_ACTION_DESIRE_NONE, 0
	end

	local nSkillLV = abilityW:GetLevel()
	local nAttackRange = bot:GetAttackRange() + 50
	local nAttackDamage = bot:GetAttackDamage()
	local nTalent4Damage = talent4:IsTrained() and talent4:GetSpecialValueInt( "value" ) or 0
	local nAbilityDamage = nAttackDamage + abilityW:GetSpecialValueInt( "damage_bonus" ) + nTalent4Damage
	local nDamageType = DAMAGE_TYPE_PHYSICAL
	local nCastRange = nAttackRange

	local nTowers = bot:GetNearbyTowers( 870, true )
	local nEnemysLaneCreepsInRange = bot:GetNearbyLaneCreeps( nAttackRange + 100, true )
	local nEnemysLaneCreepsInBonus = bot:GetNearbyLaneCreeps( 500, true )
	local nEnemysWeakestLaneCreepsInRange = J.GetVulnerableWeakestUnit( bot, false, true, nAttackRange + 200 )

	local nEnemysHerosInAttackRange = bot:GetNearbyHeroes( nAttackRange, true, BOT_MODE_NONE )
	local nEnemysWeakestHero = J.GetVulnerableWeakestUnit( bot, true, true, nAttackRange + 40 )

	local nAllyLaneCreeps = bot:GetNearbyLaneCreeps( 450, false )
	local botMode = bot:GetActiveMode()
	local nTargetUint = nil


	if nLV >= 7
	then
		if ( hEnemyList[1] ~= nil or ( nSkillLV >= 4 and nMP > 0.6 - 0.01 * nLV ) )
			and not abilityW:GetAutoCastState()
		then
			lastAutoTime = DotaTime()
			abilityW:ToggleAutoCast()
		elseif hEnemyList[1] == nil
				and lastAutoTime < DotaTime() - 2.0
				and abilityW:GetAutoCastState()
			then
				abilityW:ToggleAutoCast()
		end
	else
		if abilityW:GetAutoCastState()
		then
			abilityW:ToggleAutoCast()
		end
	end

	if nLV <= 6 and nHP > 0.55
		and J.IsValidHero( botTarget )
		and ( not J.IsRunning( bot ) or J.IsInRange( bot, botTarget, nAttackRange + 29 ) )
	then
		if not botTarget:IsAttackImmune()
			and GetUnitToUnitDistance( bot, botTarget ) < nAttackRange + 99
		then
			nTargetUint = botTarget
			return BOT_ACTION_DESIRE_HIGH, nTargetUint, "W-手动法球"
		end
	end


	if ( botMode == BOT_MODE_LANING and #nTowers == 0 )
	then

		if J.IsValid( nEnemysWeakestHero )
		then
			if nHP >= 0.62
				and #nEnemysLaneCreepsInBonus <= 6
				and #nAllyLaneCreeps >= 2
				and not bot:WasRecentlyDamagedByCreep( 1.5 )
				and not bot:WasRecentlyDamagedByAnyHero( 1.5 )
			then
				return BOT_ACTION_DESIRE_HIGH, nEnemysWeakestHero, "W-对线法球1"
			end

			if J.GetAllyUnitCountAroundEnemyTarget( bot, nEnemysWeakestHero, 500 ) >= 3
				and nHP >= 0.6
				and not bot:WasRecentlyDamagedByCreep( 1.5 )
				and not bot:WasRecentlyDamagedByAnyHero( 1.5 )
			then
				return BOT_ACTION_DESIRE_HIGH, nEnemysWeakestHero, "W-对线法球2"
			end

		end

		--补刀
		if J.IsWithoutTarget( bot )
			and not J.IsAttacking( bot )
		then
			local nLaneCreepList = bot:GetNearbyLaneCreeps( 1100, true )
			for _, creep in pairs( nLaneCreepList )
			do
				if J.IsValid( creep )
					and not creep:HasModifier( "modifier_fountain_glyph" )
					and creep:GetHealth() < nAttackDamage + 180
					and not J.IsAllysTarget( creep )
				then
					local nAttackProDelayTime = J.GetAttackProDelayTime( bot, nCreep ) * 1.12 + 0.05
					local nAD = nAbilityDamage * bot:GetAttackCombatProficiency( creep )
					if J.WillKillTarget( creep, nAD, nDamageType, nAttackProDelayTime )
					then
						return BOT_ACTION_DESIRE_HIGH, creep, nAD..'W-补刀:'..creep:GetHealth()
					end
				end
			end

		end
	end


	if J.IsValidHero( botTarget )
		and not J.IsInRange( bot, botTarget, nAttackRange + 200 )
		and J.IsValidHero( nEnemysHerosInAttackRange[1] )
		and J.CanBeAttacked( nEnemysHerosInAttackRange[1] )
		and botMode ~= BOT_MODE_RETREAT
	then
		return BOT_ACTION_DESIRE_HIGH, nEnemysHerosInAttackRange[1]
	end


	if botTarget == nil
		and botMode ~= BOT_MODE_RETREAT
		and botMode ~= BOT_MODE_ATTACK
		and botMode ~= BOT_MODE_ASSEMBLE
		and botMode ~= BOT_MODE_TEAM_ROAM
	then

		if J.IsValid( nEnemysWeakestLaneCreepsInRange )
			and not J.IsAllysTarget( nEnemysWeakestLaneCreepsInRange )
		then
			local nCreep = nEnemysWeakestLaneCreepsInRange
			local nAttackProDelayTime = J.GetAttackProDelayTime( bot, nCreep )

			local otherAttackRealDamage = J.GetTotalAttackWillRealDamage( nCreep, nAttackProDelayTime )
			local nRealDamage = nCreep:GetActualIncomingDamage( nAbilityDamage * bot:GetAttackCombatProficiency( nCreep ), nDamageType )

			if otherAttackRealDamage + nRealDamage > nCreep:GetHealth()
				and not J.CanKillTarget( nCreep, nAttackDamage, DAMAGE_TYPE_PHYSICAL )
			then

				local nTime = nAttackProDelayTime
				local rMessage = "时:"..J.GetTwo( DotaTime()%60 ).."延:"..J.GetOne( nAttackProDelayTime ).."生:"..nCreep:GetHealth().."技:"..J.GetOne( nAbilityDamage ).."额:"..J.GetOne( otherAttackRealDamage ).."总:"..( otherAttackRealDamage + nRealDamage )
				return BOT_ACTION_DESIRE_HIGH, nCreep, rMessage
			end

		end

	end


	if ( J.IsFarming( bot ) or J.IsPushing( bot ) )
		and nSkillLV >= 3
		and not abilityW:GetAutoCastState()
	then
		if J.IsValidBuilding( botTarget )
			and bot:GetMana() > nKeepMana
			and not botTarget:HasModifier( 'modifier_fountain_glyph' )
			and J.IsInRange( bot, botTarget, nCastRange + 80 )
		then
			return BOT_ACTION_DESIRE_HIGH, botTarget, 'W-推塔'
		end

		if botTarget ~= nil
			and botTarget:IsAlive()
			and nMP > 0.4
			and not botTarget:HasModifier( 'modifier_fountain_glyph' )
			and botTarget:GetHealth() > nAbilityDamage * 2.6
			and J.IsInRange( bot, botTarget, nCastRange + 80 )
		then
			return BOT_ACTION_DESIRE_HIGH, botTarget, 'W-打钱'
		end
	end


	if J.IsGoingOnSomeone( bot ) and not abilityW:GetAutoCastState()
	then
		if J.IsValidHero( botTarget )
			and not botTarget:IsAttackImmune()
			and J.CanCastOnMagicImmune( botTarget )
			and J.IsInRange( botTarget, bot, nAttackRange + 80 )
		then
			return BOT_ACTION_DESIRE_MODERATE, botTarget
		end
	end


	if ( bot:GetActiveMode() == BOT_MODE_ROSHAN and not abilityW:GetAutoCastState() )
	then
		if J.IsRoshan( botTarget )
			and J.IsInRange( botTarget, bot, nAttackRange )
		then
			return BOT_ACTION_DESIRE_HIGH, botTarget
		end
	end


	return BOT_ACTION_DESIRE_NONE


end

function X.ConsiderE()

	local nEnemyTowers = bot:GetNearbyTowers( 888, true )

	if not abilityE:IsFullyCastable()
		or bot:IsInvisible()
		or #nEnemyTowers >= 1
		or bot:HasModifier( "modifier_item_dustofappearance" )
		or bot:DistanceFromFountain() < 800
	then return 0 end

	local nSkillLV = abilityE:GetLevel()
	local nCastRange = abilityE:GetCastRange()
	local nCastPoint = abilityE:GetCastPoint()
	local nManaCost = abilityE:GetManaCost()
	local nDamage = abilityE:GetAbilityDamage()
	local nDamageType = DAMAGE_TYPE_MAGICAL
	local nInRangeEnemyList = bot:GetNearbyHeroes( nCastRange, true, BOT_MODE_NONE )

	if J.IsRetreating( bot )
		and bot:GetActiveModeDesire() > BOT_MODE_DESIRE_HIGH
		and #hEnemyList > 0
	then
		return BOT_ACTION_DESIRE_HIGH, 'E-撤退了'
	end

	if J.GetHP( bot ) < 0.166
		and ( #hEnemyList > 0 or bot:WasRecentlyDamagedByAnyHero( 5.0 ) )
	then
		return BOT_ACTION_DESIRE_HIGH, 'E-隐身保命'
	end

	if J.IsGoingOnSomeone( bot )
	then
		if J.IsValidHero( botTarget )
			and J.CanCastOnMagicImmune( botTarget )
		then
			if not J.IsInRange( bot, botTarget, botTarget:GetCurrentVisionRange() )
				and J.IsInRange( bot, botTarget, 3000 )
			then
				local hEnemyCreepList = bot:GetNearbyLaneCreeps( 700, true )
				if #hEnemyCreepList == 0 and #hEnemyList == 0
				then
					return BOT_ACTION_DESIRE_HIGH, 'E-隐身攻击:'..J.Chat.GetNormName( botTarget )
				end
			end

			if J.IsChasingTarget( bot, botTarget )
				and J.IsInRange( bot, botTarget, 1000 )
			then
				return BOT_ACTION_DESIRE_HIGH, 'E-隐身追击:'..J.Chat.GetNormName( botTarget )
			end

		end
	end

	if J.IsInEnemyArea( bot )
		and nLV >= 9
		and J.IsRunning( bot )
	then
		local nEnemies = bot:GetNearbyHeroes( 1600, true, BOT_MODE_NONE )
		local nAllies = bot:GetNearbyHeroes( 1400, true, BOT_MODE_NONE )
		local nEnemyTowers = bot:GetNearbyTowers( 1400, true )
		if #nEnemies == 0 and #nAllies <= 2 and nEnemyTowers == 0
		then
			return BOT_ACTION_DESIRE_HIGH, 'E-敌方地区潜行'
		end
	end

	return BOT_ACTION_DESIRE_NONE


end

function X.ConsiderQ()


	if not abilityQ:IsFullyCastable() 
		or bot:IsDisarmed()
	then return 0 end

	local nSkillLV = abilityQ:GetLevel()
	local nCastRange = bot:GetAttackRange()
	local nCastPoint = abilityQ:GetCastPoint()
	local nManaCost = abilityQ:GetManaCost()
	local nDamage = abilityQ:GetAbilityDamage()
	local nDamageType = DAMAGE_TYPE_MAGICAL
	local nInRangeEnemyList = bot:GetNearbyHeroes( nCastRange, true, BOT_MODE_NONE )

	--攻击敌人, 有弹道或目标被减速控制
	if J.IsGoingOnSomeone(bot)
	then
		if J.IsValidHero(botTarget)
			and J.CanCastOnMagicImmune(botTarget)
			and J.IsInRange(bot, botTarget, nCastRange)
		then
			if J.IsAttackProjectileIncoming( bot, 800 )
			then
				return BOT_ACTION_DESIRE_HIGH, 'Q-攻击时躲弹道'
			end 
			
			if J.IsInRange(bot, botTarget, 480)
				and J.IsAttacking(bot)
			then
				return BOT_ACTION_DESIRE_HIGH, 'Q-加速攻击:'..J.Chat.GetNormName( botTarget )
			end
			
			if botTarget:GetCurrentMovementSpeed() < bot:GetCurrentMovementSpeed() * 0.7
				or ( not J.IsMoving(botTarget) and not J.IsRunning(botTarget) )
				or J.IsDisabled(botTarget)
			then
				return BOT_ACTION_DESIRE_HIGH, 'Q-追击:'..J.Chat.GetNormName( botTarget )
			end				
		end
	end

	
	--攻击建筑
	if J.IsPushing(bot)
	then
		if J.IsValidBuilding(botTarget)
			and ( J.IsInRange(bot, botTarget, nCastRange) or J.IsAttacking(bot) )
			and not botTarget:HasModifier('modifier_fountain_glyph')
			and botTarget:GetHealth() > bot:GetAttackDamage() * 2
		then
			return BOT_ACTION_DESIRE_HIGH, 'Q-推塔'
		end
	end
	
	
	--攻击肉山
	if bot:GetActiveMode() == BOT_MODE_ROSHAN
	then
		if J.IsRoshan( botTarget ) and J.GetHP( botTarget ) > 0.3
			and J.IsInRange( bot, botTarget, nCastRange )
		then
			return BOT_ACTION_DESIRE_HIGH
		end
	end

	return BOT_ACTION_DESIRE_NONE


end


return X
-- dota2jmz@163.com QQ:2462331592
