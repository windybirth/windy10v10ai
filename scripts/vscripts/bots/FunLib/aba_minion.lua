----------------------------------------------------------------------------------------------------
--- Creat From: BOT EXPERIMENT Credit:FURIOUSPUPPY
--- BOT EXPERIMENT Author: Arizona Fauzie
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=837040016
--- Refactor: 决明子 Email: dota2jmz@163.com
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1573671599
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1627071163
----------------------------------------------------------------------------------------------------


local X = {};

local bot = GetBot();

local nTeamAncient = GetAncient(GetTeam());
local vTeamAncientLoc = nil;
if nTeamAncient ~= nil then vTeamAncientLoc = nTeamAncient:GetLocation() end;

local nEnemyAncient = GetAncient(GetOpposingTeam());
local vEnemyAncientLoc = nil
if nEnemyAncient ~= nil then vEnemyAncientLoc = nEnemyAncient:GetLocation() end;
local centre = Vector(0, 0, 0);

local attackDesire = 0;
local moveDesire = 0;
local retreatDesire = 0;

local castQDesire = 0;
local castWDesire = 0;
local castEDesire = 0;

function X.GetXUnitsTowardsLocation( hUnit, vLocation, nDistance)
    local direction = (vLocation - hUnit:GetLocation()):Normalized()
    return hUnit:GetLocation() + direction * nDistance
end

function X.IsFrozeSigil(unit_name)
	return unit_name == "npc_dota_tusk_frozen_sigil1"
		or unit_name == "npc_dota_tusk_frozen_sigil2"
		or unit_name == "npc_dota_tusk_frozen_sigil3"
		or unit_name == "npc_dota_tusk_frozen_sigil4";
end

------------BEASTMASTER'S HAWK
function X.IsHawk(unit_name)
	return unit_name == "npc_dota_scout_hawk"
		or unit_name == "npc_dota_greater_hawk"
		or unit_name == "npc_dota_beastmaster_hawk"
		or unit_name == "npc_dota_beastmaster_hawk_1"
		or unit_name == "npc_dota_beastmaster_hawk_2"
		or unit_name == "npc_dota_beastmaster_hawk_3"
		or unit_name == "npc_dota_beastmaster_hawk_4";
end

function X.HawkThink(minion)
	if X.CantMove(minion) then return end
	minion:Action_MoveToLocation(bot:GetLocation());
	return
end

function X.IsTornado(unit_name)
	return unit_name == "npc_dota_enraged_wildkin_tornado";
end

function X.IsHealingWard(unit_name)
	return unit_name == "npc_dota_juggernaut_healing_ward";
end

function X.IsBear(unit_name)
	return unit_name == "npc_dota_lone_druid_bear1"
		or unit_name == "npc_dota_lone_druid_bear2"
		or unit_name == "npc_dota_lone_druid_bear3"
		or unit_name == "npc_dota_lone_druid_bear4";
end

function X.IsFamiliar(unit_name)
	return unit_name == "npc_dota_visage_familiar1"
		or unit_name == "npc_dota_visage_familiar2"
		or unit_name == "npc_dota_visage_familiar3";
end

function X.IsMinionWithNoSkill(unit_name)
	return unit_name == "npc_dota_lesser_eidolon"
		or unit_name == "npc_dota_eidolon"
		or unit_name == "npc_dota_greater_eidolon"
		or unit_name == "npc_dota_dire_eidolon"
		or unit_name == "npc_dota_furion_treant"
		or unit_name == "npc_dota_furion_treant_large"
		or unit_name == "npc_dota_invoker_forged_spirit"
		or unit_name == "npc_dota_broodmother_spiderling"
		or unit_name == "npc_dota_broodmother_spiderite"
		or unit_name == "npc_dota_wraith_king_skeleton_warrior"
		or unit_name == "npc_dota_warlock_golem_1"
		or unit_name == "npc_dota_warlock_golem_2"
		or unit_name == "npc_dota_warlock_golem_3"
		or unit_name == "npc_dota_warlock_golem_scepter_1"
		or unit_name == "npc_dota_warlock_golem_scepter_2"
		or unit_name == "npc_dota_warlock_golem_scepter_3"
		or unit_name == "npc_dota_beastmaster_boar"
		or unit_name == "npc_dota_beastmaster_greater_boar"
		or unit_name == "npc_dota_beastmaster_boar_1"
		or unit_name == "npc_dota_beastmaster_boar_2"
		or unit_name == "npc_dota_beastmaster_boar_3"
		or unit_name == "npc_dota_beastmaster_boar_4"
		or unit_name == "npc_dota_lycan_wolf1"
		or unit_name == "npc_dota_lycan_wolf2"
		or unit_name == "npc_dota_lycan_wolf3"
		or unit_name == "npc_dota_lycan_wolf4"
		or unit_name == "npc_dota_neutral_kobold"
		or unit_name == "npc_dota_neutral_kobold_tunneler"
		or unit_name == "npc_dota_neutral_kobold_taskmaster"
		or unit_name == "npc_dota_neutral_centaur_outrunner"
		or unit_name == "npc_dota_neutral_fel_beast"
		or unit_name == "npc_dota_neutral_polar_furbolg_champion"
		or unit_name == "npc_dota_neutral_ogre_mauler"
		or unit_name == "npc_dota_neutral_giant_wolf"
		or unit_name == "npc_dota_neutral_alpha_wolf"
		or unit_name == "npc_dota_neutral_wildkin"
		or unit_name == "npc_dota_neutral_jungle_stalker"
		or unit_name == "npc_dota_neutral_elder_jungle_stalker"
		or unit_name == "npc_dota_neutral_prowler_acolyte"
		or unit_name == "npc_dota_neutral_rock_golem"
		or unit_name == "npc_dota_neutral_granite_golem"
		or unit_name == "npc_dota_neutral_small_thunder_lizard"
		or unit_name == "npc_dota_neutral_gnoll_assassin"
		or unit_name == "npc_dota_neutral_ghost"
		or unit_name == "npc_dota_wraith_ghost"
		or unit_name == "npc_dota_neutral_dark_troll"
		or unit_name == "npc_dota_neutral_forest_troll_berserker"
		or unit_name == "npc_dota_neutral_harpy_scout"
		or unit_name == "npc_dota_neutral_black_drake"
		or unit_name == "npc_dota_dark_troll_warlord_skeleton_warrior"
		or unit_name == "npc_dota_necronomicon_warrior_1"
		or unit_name == "npc_dota_necronomicon_warrior_2"
		or unit_name == "npc_dota_necronomicon_warrior_3";
end

local remnant = {
	"npc_dota_stormspirit_remnant",
	"npc_dota_ember_spirit_remnant",
	"npc_dota_earth_spirit_stone"
}

local trap = {
	"npc_dota_templar_assassin_psionic_trap",
	"npc_dota_techies_remote_mine",
	"npc_dota_techies_land_mine",
	"npc_dota_techies_stasis_trap"
}

local independent = {
	"npc_dota_brewmaster_earth_1",
	"npc_dota_brewmaster_earth_2",
	"npc_dota_brewmaster_earth_3",
	"npc_dota_brewmaster_storm_1",
	"npc_dota_brewmaster_storm_2",
	"npc_dota_brewmaster_storm_3",
	"npc_dota_brewmaster_fire_1",
	"npc_dota_brewmaster_fire_2",
	"npc_dota_brewmaster_fire_3"
}

function X.IsValidUnit(unit)
	return unit ~= nil
	   and not unit:IsNull()
	   and unit:IsAlive()
end

function X.IsValidTarget(target)
	return target ~= nil
	   and not target:IsNull()
	   and target:CanBeSeen()
	   and not target:IsInvulnerable()
	   and not target:IsAttackImmune()
	   and target:IsAlive();
end

function X.IsInRange(unit, target, range)
	return GetUnitToUnitDistance(unit, target) <= range;
end

function X.CanCastOnTarget(target, ability)
	if X.CheckFlag(ability:GetTargetFlags(), ABILITY_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES) then
		return target:IsHero() and target:IsIllusion() == false;
	else
		return target:IsHero() and target:IsIllusion() == false and target:IsMagicImmune() == false;
	end
end

local globRadius = 1600;

function X.GetWeakest(units)
	local target = nil;
	local minHP = 10000;
	if #units > 0 then
		for i=1, #units do
			if X.IsValidTarget(units[i]) then
				local hp = units[i]:GetHealth();
				if hp <= minHP then
					target = units[i];
					minHP  = hp;
				end
			end
		end
	end
	return target;
end

function X.GetWeakestHero(radius, minion)
	local enemies = minion:GetNearbyHeroes(radius, true, BOT_MODE_NONE);
	return X.GetWeakest(enemies);
end

function X.GetWeakestCreep(radius, minion)
	local creeps = minion:GetNearbyLaneCreeps(radius, true);
	return X.GetWeakest(creeps);
end

function X.GetWeakestTower(radius, minion)
	local towers = minion:GetNearbyTowers(radius, true);
	return X.GetWeakest(towers);
end

function X.GetWeakestBarracks(radius, minion)
	local barracks = minion:GetNearbyBarracks(radius, true);
	if nEnemyAncient ~= nil
		and X.IsInRange(minion,nEnemyAncient,radius)
	then
		table.insert(barracks,nEnemyAncient)
	end
	return X.GetWeakest(barracks);
end

function X.GetIllusionAttackTarget(minion)


	local target = bot:GetAttackTarget();

	if bot:HasModifier('modifier_bane_nightmare') and not bot:IsInvulnerable() then target = bot end

	if target == nil then target = bot:GetTarget() end

	if ( target == nil and bot:GetActiveMode() == BOT_MODE_RETREAT)
		or ( target == nil and bot:GetLevel() > 12 )
		or ( not bot:IsAlive() )
		or (target ~= nil and GetUnitToUnitDistance(minion,target) > 2000)
	then
		target = X.GetWeakestHero(globRadius, minion);
		if target == nil then target = X.GetWeakestCreep(globRadius, minion); end
		if target == nil then target = X.GetWeakestTower(globRadius, minion); end
		if target == nil then target = X.GetWeakestBarracks(globRadius, minion); end
	end

	return target

end


function X.IsBusy(unit)
	return unit:IsUsingAbility() or unit:IsCastingAbility() or unit:IsChanneling();
end

function X.CantMove(unit)
	return unit:IsStunned() or unit:IsRooted() or unit:IsNightmared() or unit:IsInvulnerable();
end

function X.CantAttack(unit)
	return unit:IsStunned() or unit:IsRooted() or unit:IsNightmared() or unit:IsDisarmed() or unit:IsInvulnerable();
end

------------ILLUSION ACT
function X.ConsiderIllusionAttack(minion)
	if X.CantAttack(minion) then return BOT_MODE_DESIRE_NONE, nil; end
	local target = X.GetIllusionAttackTarget(minion);
	if target ~= nil then
		return BOT_MODE_DESIRE_HIGH, target;
	end
	return BOT_MODE_DESIRE_NONE, nil;
end

function X.ConsiderIllusionMove(minion)

	if X.CantMove(minion) then return BOT_MODE_DESIRE_NONE, nil; end

	if not bot:IsAlive() then
		return BOT_MODE_DESIRE_HIGH, X.GetXUnitsTowardsLocation(minion, vEnemyAncientLoc, 540);
	end

	if bot:GetActiveMode() ~= BOT_MODE_RETREAT then
		return BOT_MODE_DESIRE_HIGH, X.GetXUnitsTowardsLocation(bot, vEnemyAncientLoc, 240);
	end

	return BOT_MODE_DESIRE_NONE, nil;
end

function X.IllusionThink(minion)
	minion.attackDesire, minion.target = X.ConsiderIllusionAttack(minion);
	minion.moveDesire, minion.loc      = X.ConsiderIllusionMove(minion);
	if minion.attackDesire > 0 then
		minion:Action_AttackUnit(minion.target, true);
		return
	end
	if minion.moveDesire > 0 then
		minion:Action_MoveToLocation(minion.loc);
		return
	end
end

-----------ATTACKING WARD LIKE UNIT
local tAttackWardNameList = {
	["npc_dota_shadow_shaman_ward_1"] = true,
	["npc_dota_shadow_shaman_ward_2"] = true,
	["npc_dota_shadow_shaman_ward_3"] = true,
	["npc_dota_venomancer_plague_ward_1"] = true,
	["npc_dota_venomancer_plague_ward_2"] = true,
	["npc_dota_venomancer_plague_ward_3"] = true,
	["npc_dota_venomancer_plague_ward_4"] = true,
	["npc_dota_witch_doctor_death_ward"] = true,
}

function X.IsAttackingWard(unit_name)
	return tAttackWardNameList[unit_name] == true
end

function X.GetWardAttackTarget(minion)
	local range = minion:GetAttackRange()
	local target = bot:GetAttackTarget();
	if	not X.IsValidTarget(target)
		or (X.IsValidTarget(target) and GetUnitToUnitDistance(minion, target) > range)
	then
		target = X.GetWeakestHero(range, minion);
		if target == nil then target = X.GetWeakestCreep(range, minion); end
		if target == nil then target = X.GetWeakestTower(range, minion); end
		if target == nil then target = X.GetWeakestBarracks(range, minion); end
	end
	return target;
end

function X.ConsiderWardAttack(minion)
	local target = X.GetWardAttackTarget(minion);
	if target ~= nil then
		return BOT_MODE_DESIRE_HIGH, target;
	end
	return BOT_MODE_DESIRE_NONE, nil;
end

function X.AttackingWardThink(minion)
	minion.attackDesire, minion.target = X.ConsiderWardAttack(minion);
	if minion.attackDesire > 0
		--and minion:GetAnimActivity() ~= 1503
	then
		minion:Action_AttackUnit(minion.target, true);
		return
	end
end

function X.HealingWardThink(minion)

	local nEnemyHeroes = minion:GetNearbyHeroes(800,true,BOT_MODE_DESIRE_NONE)
	local targetLocation = nil

	if #nEnemyHeroes == 0
	then
		local nAoeHeroTable = minion:FindAoELocation( false, true, minion:GetLocation(), 700, 500 , 0, 0);
		if nAoeHeroTable.count >= 2
		then
			targetLocation = nAoeHeroTable.targetloc
		end
	end

	if targetLocation == nil
		and bot:IsAlive()
		and GetUnitToUnitDistance(bot,minion) <= 1400
	then
		targetLocation = X.GetXUnitsTowardsLocation(bot,vTeamAncientLoc,460)
	end

	if targetLocation == nil
	then
		local nAoeHeroTable = minion:FindAoELocation( false, true, minion:GetLocation(), 660, 490 , 0, 0);
		if nAoeHeroTable.count >= 1
		then
			targetLocation = nAoeHeroTable.targetloc
		end

		if targetLocation == nil
		then
			local nAoeCreepTable = minion:FindAoELocation( false, false, minion:GetLocation(), 600, 480 , 0, 0);
			if nAoeCreepTable.count >= 1
			then
				targetLocation = nAoeCreepTable.targetloc
			end
		end
	end

	if targetLocation ~= nil
	then
		minion:Action_MoveToLocation(targetLocation)
	else
		minion:Action_MoveToLocation(vTeamAncientLoc)
	end

end

----------CAN'T BE CONTROLLED UNIT
function X.CantBeControlled(unit_name)
	return unit_name == "npc_dota_zeus_cloud"
		or unit_name == "npc_dota_unit_tombstone1"
		or unit_name == "npc_dota_unit_tombstone2"
		or unit_name == "npc_dota_unit_tombstone3"
		or unit_name == "npc_dota_unit_tombstone4"
		or unit_name == "npc_dota_pugna_nether_ward_1"
		or unit_name == "npc_dota_pugna_nether_ward_2"
		or unit_name == "npc_dota_pugna_nether_ward_3"
		or unit_name == "npc_dota_pugna_nether_ward_4"
		or unit_name == "npc_dota_rattletrap_cog"
		or unit_name == "npc_dota_rattletrap_rocket"
		or unit_name == "npc_dota_broodmother_web"
		or unit_name == "npc_dota_unit_undying_zombie"
		or unit_name == "npc_dota_unit_undying_zombie_torso"
		or unit_name == "npc_dota_weaver_swarm"
		or unit_name == "npc_dota_death_prophet_torment"
		or unit_name == "npc_dota_gyrocopter_homing_missile"
		or unit_name == "npc_dota_plasma_field"
		or unit_name == "npc_dota_wisp_spirit"
		or unit_name == "npc_dota_beastmaster_axe"
		or unit_name == "npc_dota_troll_warlord_axe"
		or unit_name == "npc_dota_phoenix_sun"
		or unit_name == "npc_dota_techies_minefield_sign"
		or unit_name == "npc_dota_treant_eyes"
		or unit_name == "dota_death_prophet_exorcism_spirit"
		or unit_name == "npc_dota_dark_willow_creature";
end

function X.CantBeControlledThink(minion)
	return
end

-----------MINION WITH SKILLS
function X.IsMinionWithSkill(unit_name)
	return unit_name == "npc_dota_neutral_centaur_khan"
		or unit_name == "npc_dota_neutral_polar_furbolg_ursa_warrior"
		or unit_name == "npc_dota_neutral_mud_golem"
		or unit_name == "npc_dota_neutral_mud_golem_split"
		or unit_name == "npc_dota_neutral_mud_golem_split_doom"
		or unit_name == "npc_dota_neutral_ogre_magi"
		or unit_name == "npc_dota_neutral_enraged_wildkin"
		or unit_name == "npc_dota_neutral_satyr_soulstealer"
		or unit_name == "npc_dota_neutral_satyr_hellcaller"
		or unit_name == "npc_dota_neutral_prowler_shaman"
		or unit_name == "npc_dota_neutral_big_thunder_lizard"
		or unit_name == "npc_dota_neutral_dark_troll_warlord"
		or unit_name == "npc_dota_neutral_satyr_trickster"
		or unit_name == "npc_dota_neutral_forest_troll_high_priest"
		or unit_name == "npc_dota_neutral_harpy_storm"
		or unit_name == "npc_dota_neutral_black_dragon"
		or unit_name == "npc_dota_necronomicon_archer_1"
		or unit_name == "npc_dota_necronomicon_archer_2"
		or unit_name == "npc_dota_necronomicon_archer_3";
end

function X.InitiateAbility(minion)
	minion.abilities = {};
	for i=0, 3 do
		minion.abilities [i+1] = minion:GetAbilityInSlot(i);
	end
end

function X.CheckFlag(bitfield, flag)
    return ((bitfield/flag) % 2) >= 1
end

function X.CanCastAbility(ability)
	return ability ~= nil and ability:IsFullyCastable() and ability:IsPassive() == false;
end

function X.ConsiderUnitTarget(minion, ability)
	local castRange = ability:GetCastRange() + 200;
	if bot:GetActiveMode() == BOT_MODE_RETREAT and bot:WasRecentlyDamagedByAnyHero(2.0) then
		local enemies = minion:GetNearbyHeroes(castRange, true, BOT_MODE_NONE);
		if #enemies > 0 then
			for i=1, #enemies do
				if X.IsValidTarget(enemies[i]) and X.CanCastOnTarget(enemies[i], ability) then
					return BOT_ACTION_DESIRE_HIGH, enemies[i];
				end
			end
		end
	else
		local target = bot:GetAttackTarget();
		if X.IsValidTarget(target) and X.CanCastOnTarget(target, ability) and X.IsInRange(minion, target, castRange) then
			return BOT_ACTION_DESIRE_HIGH, target;
		end
	end
	return BOT_ACTION_DESIRE_NONE, nil;
end

function X.ConsiderPointTarget(minion, ability)
	local castRange = ability:GetCastRange()+200;
	if bot:GetActiveMode() == BOT_MODE_RETREAT and bot:WasRecentlyDamagedByAnyHero(2.0) then
		local enemies = minion:GetNearbyHeroes(castRange, true, BOT_MODE_NONE);
		if #enemies > 0 then
			for i=1, #enemies do
				if X.IsValidTarget(enemies[i]) and X.CanCastOnTarget(enemies[i], ability) then
					return BOT_ACTION_DESIRE_HIGH, enemies[i]:GetLocation();
				end
			end
		end
	elseif bot:GetActiveMode() == BOT_MODE_ATTACK or bot:GetActiveMode() == BOT_MODE_DEFEND_ALLY then
		local target = bot:GetAttackTarget();
		if X.IsValidTarget(target) and X.CanCastOnTarget(target, ability) and X.IsInRange(minion, target, castRange) then
			return BOT_ACTION_DESIRE_HIGH, target:GetLocation();
		end
	end
	return BOT_ACTION_DESIRE_NONE, nil;
end


function X.ConsiderNoTarget(minion, ability)
	local nRadius = ability:GetSpecialValueInt("radius");
	if bot:GetActiveMode() == BOT_MODE_RETREAT and bot:WasRecentlyDamagedByAnyHero(2.0) then
		local enemies = minion:GetNearbyHeroes(nRadius, true, BOT_MODE_NONE);
		if #enemies > 0 then
			for i=1, #enemies do
				if X.IsValidTarget(enemies[i]) and X.CanCastOnTarget(enemies[i], ability) then
					return BOT_ACTION_DESIRE_HIGH;
				end
			end
		end
	elseif bot:GetActiveMode() == BOT_MODE_ATTACK or bot:GetActiveMode() == BOT_MODE_DEFEND_ALLY then
		local target = bot:GetAttackTarget();
		--print(tostring(target))
		if X.IsValidTarget(target) and X.CanCastOnTarget(target, ability) and X.IsInRange(minion, target, nRadius) then
			return BOT_ACTION_DESIRE_HIGH;
		end
	end
	return BOT_ACTION_DESIRE_HIGH;
end

function X.CastThink(minion, ability)
	if X.CheckFlag(ability:GetBehavior(), ABILITY_BEHAVIOR_UNIT_TARGET) then
		if ability:GetName() == "ogre_magi_frost_armor" then
			local castRange = ability:GetCastRange();
			local allies = GetNearbyHeroes(castRange+200, false, BOT_MODE_NONE);
			if #allies > 0 then
				for i=1, #allies do
					if X.IsValidTarget(allies[i]) and X.CanCastOnTarget(allies[i], ability)
					   and allies[i]:HasModifier("ogre_magi_frost_armor") == false
					then
						minion:Action_UseAbilityOnEntity(ability, allies[i]);
						return
					end
				end
			end
		else
			minion.castDesire, target = X.ConsiderUnitTarget(minion, ability);
			if minion.castDesire > 0 then
				--print(minion:GetUnitName()..tostring(minion.castDesire).." Use Ability "..ability:GetName())
				minion:Action_UseAbilityOnEntity(ability, target);
				return
			end
		end
	elseif X.CheckFlag(ability:GetBehavior(), ABILITY_BEHAVIOR_POINT) then
		minion.castDesire, loc = X.ConsiderPointTarget(minion, ability);
		if minion.castDesire > 0 then
			--print(minion:GetUnitName()..tostring(minion.castDesire).." Use Ability "..ability:GetName())
			minion:Action_UseAbilityOnLocation(ability, loc);
			return
		end
	elseif X.CheckFlag(ability:GetBehavior(), ABILITY_BEHAVIOR_NO_TARGET) then
		minion.castDesire = X.ConsiderNoTarget(minion, ability);
		if minion.castDesire > 0 then
			--print(minion:GetUnitName()..tostring(minion.castDesire).." Use Ability "..ability:GetName())
			minion:Action_UseAbility(ability);
			return
		end
	end
end

function X.CastAbilityThink(minion)

	if X.CanCastAbility(minion.abilities[1]) then
		X.CastThink(minion, minion.abilities[1]);
	end

	if X.CanCastAbility(minion.abilities[2]) then
		X.CastThink(minion, minion.abilities[2]);
	end

	if X.CanCastAbility(minion.abilities[3]) then
		X.CastThink(minion, minion.abilities[3]);
	end

	if X.CanCastAbility(minion.abilities[4]) then
		X.CastThink(minion, minion.abilities[4]);
	end

end

function X.MinionWithSkillThink(minion)
	if X.IsBusy(minion) then return; end
	if minion.abilities == nil then X.InitiateAbility(minion); end
	X.CastAbilityThink(minion);
	minion.attackDesire, minion.target = X.ConsiderIllusionAttack(minion);
	minion.moveDesire, minion.loc      = X.ConsiderIllusionMove(minion);
	if minion.attackDesire > 0 then
		minion:Action_AttackUnit(minion.target, true);
		return
	end
	if minion.moveDesire > 0 then
		minion:Action_MoveToLocation(minion.loc);
		return
	end
end


function X.MinionThink(  hMinionUnit )
	if bot == nil then bot = GetBot(); end
	if X.IsValidUnit(hMinionUnit) then
		if hMinionUnit:IsIllusion() then
			X.IllusionThink(hMinionUnit);
		elseif X.IsAttackingWard(hMinionUnit:GetUnitName()) then
			return;
		elseif X.CantBeControlled(hMinionUnit:GetUnitName()) then
			X.CantBeControlledThink(hMinionUnit);
		end
	end
end


return X;
-- dota2jmz@163.com QQ:2462331592