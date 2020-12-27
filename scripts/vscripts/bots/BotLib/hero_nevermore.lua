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
						['t10'] = {0, 10},
}

local tAllAbilityBuildList = {
						{4,1,4,1,1,4,1,4,5,6,6,5,5,5,6},
						{4,1,4,1,4,1,4,1,5,6,6,5,5,5,6},
}

local nAbilityBuildList = J.Skill.GetRandomBuild( tAllAbilityBuildList )

local nTalentBuildList = J.Skill.GetTalentBuild( tTalentTreeList )

local tOutFitList = {}

tOutFitList['outfit_carry'] = {

	"item_ranged_carry_outfit",
	"item_black_king_bar",
	"item_orchid",
	"item_ultimate_scepter",
	"item_travel_boots",
	"item_bloodthorn",
	"item_sheepstick", 
	"item_butterfly",
	"item_moon_shard",
	"item_travel_boots_2",
	"item_ultimate_orb",
	"item_ultimate_scepter_2",
	"item_sphere",

}

tOutFitList['outfit_mid'] = {

	"item_mid_outfit",
	"item_black_king_bar",
	"item_orchid",
	"item_ultimate_scepter",
	"item_travel_boots",
	"item_bloodthorn",
	"item_sheepstick",
	"item_butterfly",
	"item_moon_shard",
	"item_travel_boots_2",
	"item_ultimate_orb",
	"item_ultimate_scepter_2",
	"item_sphere",


}

tOutFitList['outfit_priest'] = tOutFitList['outfit_carry']

tOutFitList['outfit_mage'] = tOutFitList['outfit_carry']

tOutFitList['outfit_tank'] = tOutFitList['outfit_carry']

X['sBuyList'] = tOutFitList[sOutfitType]

X['sSellList'] = {

	"item_ultimate_scepter",
	"item_urn_of_shadows",

	"item_sheepstick",
	"item_magic_wand",
}

if J.Role.IsPvNMode() or J.Role.IsAllShadow() then X['sBuyList'], X['sSellList'] = { 'PvN_mid' }, {} end

nAbilityBuildList, nTalentBuildList, X['sBuyList'], X['sSellList'] = J.SetUserHeroInit( nAbilityBuildList, nTalentBuildList, X['sBuyList'], X['sSellList'] )

X['sSkillList'] = J.Skill.GetSkillList( sAbilityList, nAbilityBuildList, sTalentList, nTalentBuildList )

X['bDeafaultAbility'] = false
X['bDeafaultItem'] = false

function X.MinionThink( hMinionUnit )

	if Minion.IsValidUnit( hMinionUnit )
	then
		Minion.IllusionThink( hMinionUnit )
	end

end

--[[

npc_dota_hero_nevermore

"Ability1"		"nevermore_shadowraze1"
"Ability2"		"nevermore_shadowraze2"
"Ability3"		"nevermore_shadowraze3"
"Ability4"		"nevermore_necromastery"
"Ability5"		"nevermore_dark_lord"
"Ability6"		"nevermore_requiem"
"Ability10"		"special_bonus_spell_amplify_8"
"Ability11"		"special_bonus_attack_speed_20"
"Ability12"		"special_bonus_unique_nevermore_3"
"Ability13"		"special_bonus_movement_speed_30"
"Ability14"		"special_bonus_unique_nevermore_1"
"Ability15"		"special_bonus_unique_nevermore_2"
"Ability16"		"special_bonus_unique_nevermore_5"
"Ability17"		"special_bonus_cooldown_reduction_40"

modifier_nevermore_shadowraze_debuff
modifier_nevermore_shadowraze_counter
modifier_nevermore_presence_aura
modifier_nevermore_presence
modifier_nevermore_requiem_invis_break
modifier_nevermore_requiem_thinker
modifier_nevermore_requiem_aura
modifier_nevermore_requiem
modifier_nevermore_necromastery

--]]

local abilityZ = bot:GetAbilityByName( sAbilityList[1] )
local abilityX = bot:GetAbilityByName( sAbilityList[2] )
local abilityC = bot:GetAbilityByName( sAbilityList[3] )
local abilityR = bot:GetAbilityByName( sAbilityList[6] )
local talent6 = bot:GetAbilityByName( sTalentList[6] )

local castZDesire
local castXDesire
local castCDesire
local castRDesire

local nKeepMana, nMP, nHP, nLV, hEnemyHeroList
local talentDamage = 0


function X.SkillsComplement()


	J.ConsiderTarget()


	if J.CanNotUseAbility( bot ) or bot:IsInvisible() then return end


	nKeepMana = 340
	talentDamage = 0
	nLV = bot:GetLevel()
	nMP = bot:GetMana()/bot:GetMaxMana()
	nHP = bot:GetHealth()/bot:GetMaxHealth()
	hEnemyHeroList = bot:GetNearbyHeroes( 1600, true, BOT_MODE_NONE )


	if talent6:IsTrained() then talentDamage = talentDamage + talent6:GetSpecialValueInt( "value" ) end


	castCDesire = X.Consider( abilityC, 700 )
	if castCDesire > 0
	then

		J.SetQueuePtToINT( bot, true )

		bot:ActionQueue_UseAbility( abilityC )
		return
	end

	castXDesire = X.Consider( abilityX, 450 )
	if castXDesire > 0
	then

		J.SetQueuePtToINT( bot, true )

		bot:ActionQueue_UseAbility( abilityX )
		return
	end

	castZDesire = X.Consider( abilityZ, 200 )
	if castZDesire > 0
	then

		J.SetQueuePtToINT( bot, true )

		bot:ActionQueue_UseAbility( abilityZ )
		return

	end

	castRDesire = X.ConsiderR()
	if castRDesire > 0
	then

		J.SetQueuePtToINT( bot, false )

		bot:ActionQueue_UseAbility ( abilityR )
		return

	end
end


function X.ConsiderR()


	if not abilityR:IsFullyCastable()
		or ( bot:WasRecentlyDamagedByAnyHero( 1.5 ) and not bot:HasModifier( "modifier_black_king_bar_immune" ) and nHP < 0.62 )
	then return 0 end


	local nRadius = 1000

	local nEnemysHerosInLong	 = J.GetEnemyList( bot, 1400 )
	local nEnemysHerosInSkillRange = J.GetEnemyList( bot, 850 )
	local nEnemysHerosNearby	 = J.GetEnemyList( bot, 400 )

	for _, enemy in pairs( nEnemysHerosNearby )
	do
		if J.IsValidHero( enemy )
			and enemy:HasModifier( "modifier_brewmaster_storm_cyclone" )
			and J.GetModifierTime( enemy, "modifier_brewmaster_storm_cyclone" ) < 1.66
			and enemy:GetHealth() > 800
		then
			return BOT_ACTION_DESIRE_HIGH
		end
	end

	if J.IsInTeamFight( bot, 1200 ) or J.IsGoingOnSomeone( bot )
	then
		if #nEnemysHerosInSkillRange >= 3
			or ( #nEnemysHerosNearby >= 1 and #nEnemysHerosInSkillRange >= 2 )
			or ( #nEnemysHerosInLong >= 3 and #nEnemysHerosInSkillRange >= 2 )
			or ( #nEnemysHerosInLong >= 4 and #nEnemysHerosNearby >= 1 )
		then
			return BOT_ACTION_DESIRE_HIGH
		end

		local nAoe = bot:FindAoELocation( true, true, bot:GetLocation(), 100, 800, 1.67, 0 )
		if nAoe.count >= 3
		then
			return BOT_ACTION_DESIRE_HIGH
		end

		local npcTarget = J.GetProperTarget( bot )
		if J.IsValidHero( npcTarget )
			and J.CanCastOnNonMagicImmune( npcTarget )
			and not J.IsDisabled( npcTarget )
			and GetUnitToUnitDistance( npcTarget, bot ) <= 400
			and npcTarget:GetHealth() > 800
			and nHP > 0.38
		then
			return BOT_ACTION_DESIRE_HIGH
		end

	end

	return 0
end


function X.Consider( nAbility, nDistance )

	if not nAbility:IsFullyCastable() then
		return BOT_ACTION_DESIRE_NONE, 0
	end

	local nRadius	 = 248
	local nCastLocation = J.GetFaceTowardDistanceLocation( bot, nDistance )
	local nCastPoint = nAbility:GetCastPoint()
	local nDamageType = DAMAGE_TYPE_MAGICAL
	local nSkillLV	 = nAbility:GetLevel()
	local nDamage	 = nAbility:GetSpecialValueInt( 'shadowraze_damage' ) + talentDamage
	local nBonus	 = nAbility:GetSpecialValueInt( 'stack_bonus_damage' )
	local keyWord	 = "ranged"
	local nEnemyHeroes = bot:GetNearbyHeroes( 1000, true, BOT_MODE_NONE )
	local npcTarget = J.GetProperTarget( bot )


	if J.IsValidHero( npcTarget )
		and J.CanCastOnNonMagicImmune( npcTarget )
		and X.IsUnitNearLoc( npcTarget, nCastLocation, nRadius -20, nCastPoint )
		and not ( bot:GetMana() <= nKeepMana * ( 1 - nSkillLV/4 ) )
	then
		return BOT_ACTION_DESIRE_HIGH
	end
	if J.IsValid( npcTarget )
	then
		for _, enemy in pairs( nEnemyHeroes )
		do
			if J.IsValidHero( enemy )
				and J.CanCastOnNonMagicImmune( enemy )
				and X.IsUnitNearLoc( enemy, nCastLocation, nRadius -30, nCastPoint )
				and ( not ( bot:GetMana() <= nKeepMana * ( 1 - nSkillLV/4 ) )
					or X.IsUnitCanBeKill( enemy, nDamage, nBonus, nCastPoint ) )
			then
				return BOT_ACTION_DESIRE_HIGH
			end
		end
	end

	if nLV <= 12
	then
		local nLaneCreeps = bot:GetNearbyLaneCreeps( 1000, true )
		local keyCount = 0
		for _, creep in pairs( nLaneCreeps )
		do
			if J.IsValid( creep )
				and not creep:HasModifier( "modifier_fountain_glyph" )
				and J.IsKeyWordUnit( keyWord, creep )
				and X.IsUnitNearLoc( creep, nCastLocation, nRadius, nCastPoint )
				and X.IsUnitCanBeKill( creep, nDamage, nBonus, nCastPoint )
			then
				keyCount = keyCount + 1
			end
		end
		if keyCount >= 2
		then
			--十二级下可击杀二远程
			return BOT_ACTION_DESIRE_HIGH
		end
	end

	if not J.IsRetreating( bot )
	then
		local nEnemysCreeps = bot:GetNearbyCreeps( 1200, true )
		local tableLaneCreeps = bot:GetNearbyLaneCreeps( nDistance + nRadius * 1.5, true )
		local nCanHurtCount = 0
		local nCanKillCount = 0
		for _, creep in pairs( nEnemysCreeps )
		do
			if J.IsValid( creep )
				and not creep:HasModifier( "modifier_fountain_glyph" )
				and ( creep:GetMagicResist() < 0.4 or nMP > 0.9 )
				and X.IsUnitNearLoc( creep, nCastLocation, nRadius, nCastPoint )
			then
				nCanHurtCount = nCanHurtCount + 1
				if X.IsUnitCanBeKill( creep, nDamage, nBonus, nCastPoint )
				then
					nCanKillCount = nCanKillCount + 1
				end
			end
		end

		if nLV >= 8 and nEnemyHeroes[1] == nil
		then
			if ( nCanHurtCount >= 4 and nMP > 0.6 )
				or ( nCanHurtCount >= 3 and bot:GetActiveMode() ~= BOT_MODE_LANING )
				or ( nCanKillCount >= 2 and nCanHurtCount == #tableLaneCreeps )
				or ( nCanHurtCount >= 2 and nMP > 0.8 and nLV > 10 and #nEnemysCreeps == 2 )
				or ( nCanHurtCount >= 2 and nLV > 24 and #nEnemysCreeps == 2 and J.IsAllowedToSpam( bot, 180 ) )
			then
				return BOT_ACTION_DESIRE_HIGH
			end
		end

		if nLV <= 10
		then
			if nCanKillCount >= 2 and ( nCanHurtCount == #tableLaneCreeps or nMP > 0.8 )
			then
				--十级下可击杀二小兵
				return BOT_ACTION_DESIRE_HIGH
			end
		end

		if nCanKillCount >= 3
		then
			--可击杀3小兵
			return BOT_ACTION_DESIRE_HIGH
		end
	end

	return 0
end


function X.IsUnitNearLoc( nUnit, vLoc, nRange, nDely )

	if GetUnitToLocationDistance( nUnit, vLoc ) > 250
	then
		return false
	end

	local nMoveSta = nUnit:GetMovementDirectionStability()
	if nMoveSta < 0.98 then nRange = nRange - 14 end
	if nMoveSta < 0.91 then nRange = nRange - 26 end
	if nMoveSta < 0.81 then nRange = nRange - 30 end

	local fLoc = J.GetCorrectLoc( nUnit, nDely )
	if J.GetLocationToLocationDistance( fLoc, vLoc ) < nRange
	then
		return true
	end

	return false

end


function X.IsUnitCanBeKill( nUnit, nDamage, nBonus, nCastPoint )

	local nDamageType = DAMAGE_TYPE_MAGICAL

	local nStack = 0
	local nUnitModifier = nUnit:NumModifiers()

	if nUnitModifier >= 1
	then
		for i = 0, nUnitModifier
		do
			if nUnit:GetModifierName( i ) == "modifier_nevermore_shadowraze_debuff"
			then
				nStack = nUnit:GetModifierStackCount( i )
				break
			end
		end
	end

	local nRealDamage = nDamage + nStack * nBonus


	return J.WillKillTarget( nUnit, nRealDamage, nDamageType, nCastPoint )

end


return X
-- dota2jmz@163.com QQ:2462331592
