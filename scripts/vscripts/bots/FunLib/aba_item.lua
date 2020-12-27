----------------------------------------------------------------------------------------------------
--- The Creation Come From: BOT EXPERIMENT Credit:FURIOUSPUPPY
--- BOT EXPERIMENT Author: Arizona Fauzie
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=837040016
--- Refactor: 决明子 Email: dota2jmz@163.com 微博@Dota2_决明子
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1573671599
--- Link:http://steamcommunity.com/sharedfiles/filedetails/?id=1627071163
----------------------------------------------------------------------------------------------------


local Item = {}

local tSpecifiedItemIndex = {

	["item_tpscroll"] = true,
	["item_travel_boots"] = true,
	["item_travel_boots_2"] = true,
	["item_blink"] = true,
	["item_black_king_bar"] = true,
	["item_manta"] = true,
	["item_force_staff"] = true,
	["item_mjollnir"] = true,

}

local sNeedDebugItemList =
{
	"item_mango_tree",
--	"item_iron_talon",
	"item_arcane_ring",
	"item_royal_jelly",
	"item_trusty_shovel",
	"item_clumsy_net",
	"item_essence_ring",
	"item_repair_kit",
	"item_greater_faerie_fire",
--	"item_spider_legs",
	"item_flicker",
	"item_ninja_gear",
	"item_illusionsts_cape",
	"item_havoc_hammer",
	"item_minotaur_horn",
	"item_force_boots",
	"item_woodland_striders",
	"item_fallen_sky",
	"item_ex_machina",

	"item_abyssal_blade",
	"item_ancient_janggo",
--	"item_arcane_boots",
	"item_armlet",
--	"item_bfury",
	"item_black_king_bar",
	"item_blade_mail",
	"item_blink",
	"item_bloodstone",
	"item_bloodthorn",
	"item_bottle",
--	"item_clarity",
	"item_crimson_guard",
	"item_cyclone",
	"item_dagon",
	"item_dagon_2",
	"item_dagon_3",
	"item_dagon_4",
	"item_dagon_5",
	"item_diffusal_blade",
	"item_enchanted_mango",
	"item_ethereal_blade",
--	"item_faerie_fire",
	"item_flask",
	"item_force_staff",
	"item_ghost",
	"item_glimmer_cape",
	"item_guardian_greaves",
--	"item_hand_of_midas",
	"item_heavens_halberd",
	"item_helm_of_the_dominator",
--	"item_hood_of_defiance",
	"item_hurricane_pike",
	"item_invis_sword",
	"item_lotus_orb",
--	"item_magic_stick",
--	"item_magic_wand",
	"item_manta",
--	"item_mask_of_madness",
	"item_medallion_of_courage",
	"item_mekansm",
	"item_meteor_hammer",
	"item_mjollnir",
	"item_moon_shard",
	"item_necronomicon",
	"item_necronomicon_2",
	"item_necronomicon_3",
	"item_nullifier",
	"item_orchid",
--	"item_phase_boots",
	"item_pipe",
--	"item_power_treads",
--	"item_quelling_blade",
	"item_refresher",
	"item_refresher_shard",
--	"item_ring_of_basilius",
	"item_rod_of_atos",
	"item_satanic",
--	"item_shadow_amulet",
	"item_sheepstick",
	"item_shivas_guard",
	"item_silver_edge",
	"item_solar_crest",
	"item_sphere",
	"item_spirit_vessel",
--	"item_tango",
--	"item_tango_single",
	"item_tome_of_knowledge",
	"item_tpscroll",
--	"item_travel_boots",
--	"item_travel_boots_2",
	"item_urn_of_shadows",
	"item_veil_of_discord",
}

local tDebugItemList = {}
for _, sItemName in pairs( sNeedDebugItemList )
do
	tDebugItemList[sItemName] = true
end

Item['sBasicItems'] = {
	'item_aegis',
	'item_boots_of_elves',
	'item_belt_of_strength',
	'item_blade_of_alacrity',
	'item_blades_of_attack',
	'item_blight_stone',
	'item_blink',
	'item_boots',
	'item_bottle',
	'item_branches',
	'item_broadsword',
	'item_chainmail',
	'item_cheese',
	'item_circlet',
	'item_clarity',
	'item_claymore',
	'item_cloak',
	'item_crown',
	'item_demon_edge',
	'item_dust',
	'item_eagle',
	'item_enchanted_mango',
	'item_energy_booster',
	'item_faerie_fire',
	'item_flask',
	'item_gauntlets',
	'item_gem',
	'item_ghost',
	'item_gloves',
	'item_holy_locket',
	'item_hyperstone',
	'item_infused_raindrop',
	'item_javelin',
	'item_lifesteal',
	'item_magic_stick',
	'item_mantle',
	'item_mithril_hammer',
	'item_mystic_staff',
	'item_ogre_axe',
	'item_orb_of_venom',
	'item_platemail',
	'item_point_booster',
	'item_quarterstaff',
	'item_quelling_blade',
	'item_reaver',
	'item_refresher_shard',
	'item_ring_of_health',
	'item_ring_of_protection',
	'item_ring_of_regen',
	'item_robe',
	'item_relic',
	'item_sobi_mask',
	'item_shadow_amulet',
	'item_slippers',
	'item_smoke_of_deceit',
	'item_staff_of_wizardry',
	'item_talisman_of_evasion',
	'item_tango',
	'item_tango_single',
	'item_tome_of_knowledge',
	'item_tpscroll',
	'item_ultimate_orb',
	'item_vitality_booster',
	'item_void_stone',
	'item_wind_lace',
	'item_ward_observer',
	'item_ward_sentry',
	'item_blitz_knuckles', --闪电指套
	'item_voodoo_mask', --巫毒面具
	'item_fluffy_hat', --毛毛帽
}

Item['sSeniorItems'] = {

	'item_arcane_boots',
	'item_buckler',
	'item_basher',
	'item_dagon',
	'item_dagon_2',
	'item_dagon_3',
	'item_dagon_4',
	'item_dragon_lance',
	'item_force_staff',
	'item_headdress',
	'item_hood_of_defiance',
	'item_invis_sword',
	'item_kaya',
	'item_lesser_crit',
	'item_maelstrom',
	'item_medallion_of_courage',
	'item_mekansm',
	'item_necronomicon',
	'item_necronomicon_2',
	'item_ring_of_basilius',
	'item_sange',
	'item_soul_booster',
	'item_travel_boots',
	'item_urn_of_shadows',
	'item_vanguard',
	'item_yasha',

}

Item['sTopItems'] = {

	'item_clarity',
	'item_tango',
	'item_flask',
	'item_faerie_fire',
	'item_enchanted_mango',
	'item_infused_raindrop',

	'item_abyssal_blade',
	'item_aether_lens',
	'item_armlet',
	'item_assault',
	'item_ancient_janggo',
	'item_aeon_disk',
	'item_bfury',
	'item_black_king_bar',
	'item_blade_mail',
--	'item_blink',
	'item_bloodstone',
	'item_bloodthorn',
	'item_bottle',
	'item_bracer',
	'item_butterfly',
	'item_crimson_guard',
--	'item_cyclone',
	'item_dagon_5',
	'item_desolator',
	'item_diffusal_blade',
	'item_echo_sabre',
	'item_ethereal_blade',
	'item_gem',
	'item_glimmer_cape',
	'item_guardian_greaves',
	'item_greater_crit',
	'item_hand_of_midas',
	'item_heart',
	'item_heavens_halberd',
--	'item_helm_of_the_dominator',
	'item_hurricane_pike',
	'item_holy_locket',
	'item_kaya_and_sange',
	'item_lotus_orb',
	'item_manta',
	'item_mask_of_madness',
	'item_mjollnir',
	'item_monkey_king_bar',
	'item_moon_shard',
	'item_meteor_hammer',
	'item_necronomicon_3',
	'item_null_talisman',
	'item_nullifier',
	'item_orb_of_venom',
	'item_phase_boots',
	'item_pipe',
	'item_power_treads',
	'item_radiance',
	'item_rapier',
	'item_refresher',
--	'item_rod_of_atos',
	'item_sange_and_yasha',
	'item_satanic',
	'item_sheepstick',
	'item_sphere',
	'item_shivas_guard',
	'item_silver_edge',
	'item_solar_crest',
	'item_soul_ring',
	'item_skadi',
	'item_spirit_vessel',
	'item_tpscroll',
	'item_tranquil_boots',
	'item_travel_boots_2',
	'item_veil_of_discord',
	'item_vladmir',
	'item_wraith_band',
	'item_yasha_and_kaya',
}

local tTopItemList = {}
for _, sItem in pairs( Item['sTopItems'] )
do
	tTopItemList[sItem] = true
end

Item['tEarlyItem'] = {
	 'item_clarity',
	 'item_faerie_fire',
	 'item_tango',
	 'item_flask',
	 'item_infused_raindrop',
	 -- 'item_magic_stick',
	 'item_orb_of_venom',
	 'item_bracer',
	 'item_wraith_band',
	 'item_null_talisman',
	 'item_bottle',
	 'item_soul_ring',
	 -- 'item_magic_wand',
	 -- 'item_ancient_janggo',
	 'item_refresher_shard',
	 'item_cheese',
}

Item['tEarlyBoots'] = {
	'item_boots',
	'item_phase_boots',
	'item_power_treads',
	'item_tranquil_boots',
	'item_arcane_boots'
}

Item['sCanNotSwitchItems'] = {
		'item_aegis',
		'item_refresher_shard',
		'item_cheese',
		'item_bloodstone',
		'item_gem',
}
local tCanNotSwitchItemList = {}
for _, sItem in pairs( Item['sCanNotSwitchItems'] )
do
	tCanNotSwitchItemList[sItem] = true
end


local sConsumableList = {

	'item_clarity',
	'item_tango',
	'item_flask',
	'item_faerie_fire',
	'item_enchanted_mango',
	'item_infused_raindrop',

	'item_mango_tree',
	'item_royal_jelly',
	'item_greater_faerie_fire',
	"item_repair_kit",

	'item_cheese',
	'item_refresher_shard',
	'item_aegis',

}
local tConsumableItemList = {}
for _, sItem in pairs( sConsumableList )
do
	tConsumableItemList[sItem] = true
end


local sNotSellItemList = {
	'item_abyssal_blade',
	'item_assault',
	'item_black_king_bar',
	'item_bloodstone',
	'item_bloodthorn',
	'item_butterfly',
	'item_bfury',
	'item_cheese',
	'item_crimson_guard',
	'item_pipe',
	'item_dust',
	'item_gem',
	'item_greater_crit',
	'item_guardian_greaves',
	'item_heart',
	'item_heavens_halberd',
	'item_hyperstone',
	'item_manta',
	'item_hurricane_pike',
	'item_mjollnir',
	'item_nullifier',
	'item_octarine_core',
	'item_radiance',
	'item_rapier',
	'item_refresher',
	'item_refresher_shard',
	'item_satanic',
	'item_sheepstick',
	'item_shivas_guard',
	'item_silver_edge',
	'item_skadi',
	'item_sphere',
	'item_ultimate_scepter',
	'item_travel_boots',
	'item_travel_boots_2',
	'item_ward_observer',
}
local tNotSellItemList = {}
for _, sItem in pairs( sNotSellItemList )
do
	tNotSellItemList[sItem] = true
end

local tNeutralItemLevelList = {


	['item_arcane_ring'] = 35,
	['item_broom_handle'] = 33,
	['item_faded_broach'] = 31,
	['item_keen_optic'] = 29, -- 基恩镜片	
	['item_ocean_heart'] = 43,	
	['item_royal_jelly'] = 96,
	['item_trusty_shovel'] = 32,
	['item_ironwood_tree'] = 44,
	
	['item_mysterious_hat'] = 35,
	['item_chipped_vest'] = 34,
	['item_possessed_mask'] = 33,
	

	['item_dragon_scale'] = 38, -- 炎龙之鳞
	['item_essence_ring'] = 55.5, -- 精华指环
	['item_grove_bow'] = 40, -- 林野长弓
	['item_imp_claw'] = 51.5, -- 魔童之爪
	['item_nether_shawl'] = 28, -- 幽冥披巾
	['item_philosophers_stone'] = 47.5, -- 贤者石
	['item_pupils_gift'] = 41,
	['item_ring_of_aquila'] = 46,
	['item_vambrace'] = 52,
	
	['item_quicksilver_amulet'] = 45,
	['item_bullwhip'] = 48, 

	
	['item_enchanted_quiver'] = 44, -- 魔力箭袋
	['item_mind_breaker'] = 55,
	['item_orb_of_destruction'] = 53, -- 毁灭灵球
	['item_paladin_sword'] = 40, -- 骑士剑
	['item_quickening_charm'] = 50,
	['item_titan_sliver'] = 54, -- 巨神残铁
	['item_spider_legs'] = 60,
	
	['item_ceremonial_robe'] = 46,
	['item_cloak_of_flames'] = 49,
	['item_elven_tunic'] = 47, 
	['item_psychic_headband'] = 50, 

	
	['item_spy_gadget'] = 36, -- 望远镜	
	['item_flicker'] = 49, 	-- 闪灵
	['item_illusionsts_cape'] = 64,
	['item_minotaur_horn'] = 65, -- 恶牛角
	['item_ninja_gear'] = 58, -- 忍者用具
	['item_spell_prism'] = 69, -- 法术棱镜
	['item_the_leveller'] = 61, -- 平世剑
	['item_timeless_relic'] = 59, -- 永恒遗物
	
	['item_trickster_cloak'] = 62, 
	['item_stormcrafter'] = 68, 
	['item_penta_edged_sword'] = 57, 


	['item_apex'] = 72, -- 极品
	['item_ballista'] = 36.5, -- 弩炮
	['item_demonicon'] = 73,
	['item_desolator_2'] = 75,
	['item_ex_machina'] = 71,
	['item_fallen_sky'] = 80,
	['item_force_boots'] = 66,
	['item_mirror_shield'] = 77,
	['item_pirate_hat'] = 74,
	['item_seer_stone'] = 40,
	
	['item_book_of_shadows'] = 49,
	['item_giants_ring'] = 70,

}


local tSmallItemList = {

	['item_tpscroll'] = 1,
	['item_flask'] = 1,
	['item_enchanted_mango'] = 1,

}


if true then

Item['item_abyssal_blade']				= { 'item_basher', 'item_vanguard', 'item_recipe_abyssal_blade' }

Item['item_aether_lens']				= { 'item_void_stone', 'item_energy_booster', 'item_recipe_aether_lens' }

Item['item_arcane_boots']				= { 'item_boots', 'item_energy_booster' }

Item['item_armlet']						= { 'item_helm_of_iron_will', 'item_gloves', 'item_blades_of_attack', 'item_recipe_armlet' }

Item['item_assault']					= { 'item_platemail', 'item_hyperstone', 'item_buckler', 'item_recipe_assault' }

Item['item_ancient_janggo']				= { 'item_wind_lace', 'item_belt_of_strength', 'item_robe', 'item_recipe_ancient_janggo' }

Item['item_aeon_disk']					= { 'item_vitality_booster', 'item_energy_booster', 'item_recipe_aeon_disk' }

Item['item_bfury']						= { 'item_quelling_blade', 'item_pers', 'item_broadsword', 'item_claymore' }

Item['item_black_king_bar']				= { 'item_mithril_hammer', 'item_ogre_axe', 'item_recipe_black_king_bar' }

Item['item_blade_mail']					= { 'item_chainmail', 'item_broadsword', 'item_recipe_blade_mail' }

Item['item_bloodstone']					= { 'item_voodoo_mask', 'item_kaya', 'item_soul_booster' }

Item['item_bloodthorn']					= { 'item_orchid', 'item_hyperstone', 'item_recipe_bloodthorn' }

Item['item_bracer']						= { 'item_gauntlets', 'item_circlet', 'item_recipe_bracer' }

Item['item_buckler']					= { 'item_ring_of_protection', 'item_recipe_buckler' }

Item['item_butterfly']					= { 'item_eagle', 'item_quarterstaff', 'item_talisman_of_evasion' }

Item['item_basher']						= { 'item_mithril_hammer', 'item_belt_of_strength', 'item_recipe_basher' }

Item['item_crimson_guard']				= { 'item_vanguard', 'item_helm_of_iron_will', 'item_recipe_crimson_guard' }

Item['item_cyclone']					= { 'item_wind_lace', 'item_void_stone', 'item_staff_of_wizardry', 'item_recipe_cyclone' }

Item['item_dagon']						= { 'item_staff_of_wizardry', 'item_crown', 'item_recipe_dagon' }

Item['item_dagon_2']					= { 'item_dagon', 'item_recipe_dagon' }

Item['item_dagon_3']					= { 'item_dagon_2', 'item_recipe_dagon' }

Item['item_dagon_4']					= { 'item_dagon_3', 'item_recipe_dagon' }

Item['item_dagon_5']					= { 'item_dagon_4', 'item_recipe_dagon' }

Item['item_desolator']					= { 'item_blight_stone', 'item_mithril_hammer', 'item_mithril_hammer' }

Item['item_diffusal_blade']				= { 'item_blade_of_alacrity', 'item_blade_of_alacrity', 'item_robe', 'item_recipe_diffusal_blade' }

Item['item_dragon_lance']				= { 'item_boots_of_elves', 'item_boots_of_elves', 'item_ogre_axe' }

Item['item_echo_sabre']					= { 'item_ogre_axe', 'item_oblivion_staff' }

Item['item_ethereal_blade']				= { 'item_ghost', 'item_eagle' }

Item['item_force_staff']				= { 'item_staff_of_wizardry', 'item_ring_of_regen', 'item_recipe_force_staff' }

Item['item_glimmer_cape']				= { 'item_shadow_amulet', 'item_cloak', 'item_recipe_glimmer_cape' }

Item['item_guardian_greaves']			= { 'item_arcane_boots', 'item_mekansm', 'item_recipe_guardian_greaves', 'item_buckler' }

Item['item_greater_crit']				= { 'item_lesser_crit', 'item_demon_edge', 'item_recipe_greater_crit' }

Item['item_hand_of_midas']				= { 'item_gloves', 'item_recipe_hand_of_midas' }

Item['item_headdress']					= { 'item_ring_of_regen', 'item_recipe_headdress' }

Item['item_heart']						= { 'item_reaver' , 'item_vitality_booster', 'item_recipe_heart' }

Item['item_heavens_halberd']			= { 'item_sange', 'item_talisman_of_evasion', 'item_recipe_heavens_halberd' }

Item['item_helm_of_the_dominator']		= { 'item_helm_of_iron_will', 'item_crown', 'item_recipe_helm_of_the_dominator' }

Item['item_hood_of_defiance']			= { 'item_ring_of_health', 'item_cloak', 'item_ring_of_regen' }

Item['item_hurricane_pike']				= { 'item_dragon_lance', 'item_force_staff', 'item_recipe_hurricane_pike' }

Item['item_holy_locket']				= { 'item_magic_wand', 'item_fluffy_hat', 'item_headdress', 'item_energy_booster', 'item_recipe_holy_locket' }

Item['item_invis_sword']				= { 'item_shadow_amulet', 'item_blitz_knuckles', 'item_broadsword' }

Item['item_kaya']						= { 'item_robe', 'item_staff_of_wizardry', 'item_recipe_kaya' }

Item['item_kaya_and_sange']				= { 'item_sange', 'item_kaya' }

Item['item_lotus_orb']					= { 'item_pers', 'item_platemail', 'item_energy_booster' }

Item['item_lesser_crit']				= { 'item_broadsword', 'item_blades_of_attack', 'item_recipe_lesser_crit' }

Item['item_maelstrom']					= { 'item_javelin', 'item_mithril_hammer' }

Item['item_magic_wand']					= { 'item_branches', 'item_branches', 'item_magic_stick', 'item_recipe_magic_wand' }

Item['item_manta']						= { 'item_yasha', 'item_ultimate_orb', 'item_recipe_manta' }

Item['item_mask_of_madness']			= { 'item_quarterstaff', 'item_lifesteal' }

Item['item_medallion_of_courage']		= { 'item_blight_stone', 'item_sobi_mask', 'item_chainmail' }

Item['item_mekansm']					= { 'item_headdress', 'item_chainmail', 'item_recipe_mekansm' }

Item['item_mjollnir']					= { 'item_maelstrom', 'item_hyperstone', 'item_recipe_mjollnir' }

Item['item_monkey_king_bar']			= { 'item_blitz_knuckles', 'item_javelin', 'item_demon_edge', 'item_recipe_monkey_king_bar' }

Item['item_moon_shard']					= { 'item_hyperstone', 'item_hyperstone' }

Item['item_meteor_hammer']				= { 'item_pers', 'item_crown', 'item_recipe_meteor_hammer' }

Item['item_necronomicon']				= { 'item_sobi_mask', 'item_sobi_mask', 'item_belt_of_strength', 'item_recipe_necronomicon' }

Item['item_necronomicon_2']				= { 'item_necronomicon', 'item_recipe_necronomicon' }

Item['item_necronomicon_3']				= { 'item_necronomicon_2', 'item_recipe_necronomicon' }

Item['item_null_talisman']				= { 'item_circlet', 'item_mantle', 'item_recipe_null_talisman' }

Item['item_nullifier']					= { 'item_helm_of_iron_will', 'item_relic' }

Item['item_oblivion_staff']				= { 'item_quarterstaff', 'item_robe', 'item_sobi_mask' }

Item['item_octarine_core']				= { 'item_aether_lens', 'item_soul_booster' }

Item['item_orchid']						= { 'item_oblivion_staff', 'item_oblivion_staff', 'item_recipe_orchid' }

Item['item_pers']						= { 'item_ring_of_health', 'item_void_stone' }

Item['item_phase_boots']				= { 'item_boots', 'item_blades_of_attack', 'item_chainmail' }

Item['item_pipe']						= { 'item_headdress', 'item_hood_of_defiance', 'item_recipe_pipe' }

Item['item_power_treads_agi']			= { 'item_boots', 'item_boots_of_elves', 'item_gloves' }

Item['item_power_treads_int']			= { 'item_boots', 'item_robe', 'item_gloves' }

Item['item_power_treads_str']			= { 'item_boots', 'item_belt_of_strength' , 'item_gloves' }

Item['item_power_treads']				= { 'item_boots', 'item_belt_of_strength', 'item_gloves' }

Item['item_radiance']					= { 'item_relic', 'item_recipe_radiance' }

Item['item_rapier']						= { 'item_relic', 'item_demon_edge' }

Item['item_refresher']					= { 'item_pers', 'item_pers', 'item_recipe_refresher' }

Item['item_ring_of_basilius']			= { 'item_sobi_mask', 'item_recipe_ring_of_basilius' }

Item['item_rod_of_atos']				= { 'item_crown', 'item_crown', 'item_staff_of_wizardry', 'item_recipe_rod_of_atos' }

Item['item_sange']						= { 'item_belt_of_strength', 'item_ogre_axe', 'item_recipe_sange' }

Item['item_sange_and_yasha']			= { 'item_yasha', 'item_sange' }

Item['item_satanic']					= { 'item_reaver', 'item_claymore', 'item_lifesteal' }

Item['item_sheepstick']					= { 'item_ultimate_orb', 'item_void_stone', 'item_mystic_staff' }

Item['item_sphere']						= { 'item_pers', 'item_ultimate_orb', 'item_recipe_sphere' }

Item['item_shivas_guard']				= { 'item_mystic_staff', 'item_platemail', 'item_recipe_shivas_guard' }

Item['item_silver_edge']				= { 'item_invis_sword', 'item_oblivion_staff', 'item_recipe_silver_edge' }

Item['item_solar_crest']				= { 'item_medallion_of_courage', 'item_wind_lace', 'item_ultimate_orb', 'item_recipe_solar_crest' }

Item['item_soul_booster']				= { 'item_point_booster', 'item_vitality_booster', 'item_energy_booster' }

Item['item_soul_ring']					= { 'item_gauntlets', 'item_gauntlets', 'item_ring_of_protection', 'item_recipe_soul_ring' }

Item['item_skadi']						= { 'item_ultimate_orb', 'item_point_booster', 'item_ultimate_orb' }

Item['item_spirit_vessel']				= { 'item_urn_of_shadows', 'item_vitality_booster', 'item_recipe_spirit_vessel' }

Item['item_tranquil_boots']				= { 'item_wind_lace', 'item_boots', 'item_ring_of_regen' }

Item['item_travel_boots']				= { 'item_boots', 'item_recipe_travel_boots' }

Item['item_travel_boots_2']				= { 'item_travel_boots', 'item_recipe_travel_boots' }

Item['item_urn_of_shadows']				= { 'item_circlet', 'item_ring_of_protection', 'item_sobi_mask', 'item_recipe_urn_of_shadows' }

Item['item_ultimate_scepter']			= { 'item_point_booster', 'item_ogre_axe', 'item_blade_of_alacrity', 'item_staff_of_wizardry' }

Item['item_ultimate_scepter_2']			= { 'item_ultimate_scepter', 'item_recipe_ultimate_scepter_2' }

Item['item_vanguard']					= { 'item_vitality_booster', 'item_ring_of_health' }

Item['item_veil_of_discord']			= { 'item_ring_of_basilius', 'item_crown', 'item_recipe_veil_of_discord' }

Item['item_vladmir']					= { 'item_ring_of_basilius', 'item_lifesteal', 'item_blades_of_attack', 'item_recipe_vladmir', 'item_buckler' }

Item['item_wraith_band']				= { 'item_slippers', 'item_circlet', 'item_recipe_wraith_band' }

Item['item_yasha']						= { 'item_boots_of_elves', 'item_blade_of_alacrity', 'item_recipe_yasha' }

Item['item_yasha_and_kaya']				= { 'item_yasha', 'item_kaya' }




Item['item_falcon_blade']				= { 'item_fluffy_hat', 'item_sobi_mask', 'item_blades_of_attack', 'item_recipe_falcon_blade' }

Item['item_orb_of_corrosion']				= { 'item_blight_stone', 'item_orb_of_venom', 'item_fluffy_hat' }

Item['item_witch_blade']				= { 'item_blitz_knuckles', 'item_chainmail', 'item_chainmail', 'item_recipe_witch_blade' }

Item['item_gungir']				= { 'item_maelstrom', 'item_rod_of_atos', 'item_recipe_gungir' }

Item['item_mage_slayer']				= { 'item_cloak', 'item_blade_of_alacrity', 'item_claymore', 'item_recipe_mage_slayer' }

Item['item_eternal_shroud']				= { 'item_hood_of_defiance', 'item_voodoo_mask', 'item_recipe_eternal_shroud' }

Item['item_helm_of_the_dominator_2']				= { 'item_helm_of_the_dominator', 'item_ultimate_orb', 'item_recipe_helm_of_the_dominator_2' }

Item['item_overwhelming_blink']				= { 'item_blink', 'item_reaver', 'item_recipe_overwhelming_blink' }
Item['item_swift_blink']				= { 'item_blink', 'item_eagle', 'item_recipe_swift_blink' }
Item['item_arcane_blink']				= { 'item_blink', 'item_mystic_staff', 'item_recipe_arcane_blink' }
Item['item_wind_waker']				= { 'item_cyclone', 'item_mystic_staff', 'item_recipe_wind_waker' }




end


------------------------------------------------------------------------------------------------------
--Self_Define Item
------------------------------------------------------------------------------------------------------
local tDefineItemRealName = {

['item_double_tango'] = "item_tango",
['item_double_clarity'] = "item_clarity",
['item_double_flask'] = "item_flask",
['item_double_enchanted_mango'] = "item_enchanted_mango",


['item_broken_satanic'] = "item_satanic",


['item_power_treads_agi'] = "item_power_treads",
['item_power_treads_int'] = "item_power_treads",
['item_power_treads_str'] = "item_power_treads",


['item_trident_yasha'] = 'item_trident',
['item_trident_sange'] = 'item_trident',
['item_trident_kaya'] = 'item_trident',


['item_mid_outfit'] = "item_urn_of_shadows",
['item_templar_assassin_outfit'] = "item_urn_of_shadows",


['item_ranged_carry_outfit'] = "item_power_treads",
['item_melee_carry_outfit'] = "item_power_treads",
['item_phantom_assassin_outfit'] = "item_power_treads",
['item_huskar_outfit'] = "item_phase_boots",
['item_sven_outfit'] = "item_phase_boots",
['item_bristleback_outfit'] = "item_power_treads",


['item_tank_outfit'] = "item_ancient_janggo",
['item_dragon_knight_outfit'] = "item_ancient_janggo",
['item_ogre_magi_outfit'] = "item_hand_of_midas",


['item_mage_outfit'] = "item_magic_wand",
['item_crystal_maiden_outfit'] = "item_magic_wand",
['item_priest_outfit'] = "item_arcane_boots",


}

if true then

Item['item_double_branches']		= { 'item_branches', 'item_branches', }

Item['item_double_tango']			= { 'item_tango', 'item_tango', }

Item['item_double_clarity']			= { 'item_clarity', 'item_clarity', }

Item['item_double_flask']			= { 'item_flask', 'item_flask', }

Item['item_double_enchanted_mango']	= { 'item_enchanted_mango', 'item_enchanted_mango', }

Item['item_double_circlet']			= { 'item_circlet', 'item_circlet', }

Item['item_double_slippers']		= { 'item_slippers', 'item_slippers', }

Item['item_double_mantle']			= { 'item_mantle', 'item_mantle', }

Item['item_double_gauntlets']		= { 'item_gauntlets', 'item_gauntlets', }

Item['item_double_wraith_band']		= { 'item_wraith_band', 'item_wraith_band', }

Item['item_double_null_talisman']	= { 'item_null_talisman', 'item_null_talisman', }

Item['item_double_bracer']			= { 'item_bracer', 'item_bracer', }

Item['item_double_crown']			= { 'item_crown', 'item_crown', }

Item['item_broken_urn']				= { 'item_ring_of_protection', 'item_sobi_mask', 'item_recipe_urn_of_shadows' }

Item['item_broken_hurricane_pike']	= { 'item_force_staff', 'item_recipe_hurricane_pike' }

Item['item_broken_silver_edge']		= { 'item_blitz_knuckles', 'item_broadsword', 'item_recipe_silver_edge'}

Item['item_broken_bfury']			= { 'item_ring_of_health', 'item_void_stone', 'item_broadsword', 'item_claymore' }

Item['item_broken_satanic']			= { 'item_reaver', 'item_claymore' }

Item['item_broken_soul_ring']		= { 'item_ring_of_protection', 'item_recipe_soul_ring' }

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

Item['item_mid_outfit']					= { 'item_tango', 'item_faerie_fire', 'item_double_branches', 'item_wraith_band', 'item_circlet', 'item_flask', 'item_magic_stick', 'item_recipe_magic_wand', 'item_flask', 'item_power_treads_agi', 'item_flask', 'item_broken_urn', }

Item['item_templar_assassin_outfit']	= { 'item_tango', 'item_faerie_fire', 'item_double_branches', 'item_wraith_band', 'item_circlet', 'item_flask', 'item_magic_stick', 'item_recipe_magic_wand', 'item_flask', 'item_power_treads_agi', 'item_flask', 'item_broken_urn', 'item_blight_stone', }



----------------------------------------------------------------------


Item['item_ranged_carry_outfit']		= { 'item_tango', 'item_flask', 'item_double_branches', 'item_slippers', 'item_circlet', 'item_magic_stick', 'item_recipe_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_recipe_magic_wand', 'item_flask', 'item_infused_raindrop' }

Item['item_melee_carry_outfit']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_slippers', 'item_recipe_wraith_band', 'item_flask', 'item_recipe_magic_wand', 'item_power_treads_agi', 'item_flask' }

Item['item_phantom_assassin_outfit']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_slippers', 'item_recipe_wraith_band', 'item_flask', 'item_recipe_magic_wand', 'item_power_treads_agi', 'item_flask', 'item_blight_stone' }

Item['item_huskar_outfit']				= { 'item_tango', 'item_flask', 'item_double_branches', 'item_gauntlets', 'item_circlet', 'item_magic_stick', 'item_recipe_bracer', 'item_boots', 'item_bracer', 'item_recipe_magic_wand', 'item_flask', 'item_blades_of_attack', 'item_chainmail' }

Item['item_sven_outfit']				= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_gauntlets', 'item_recipe_bracer', 'item_flask', 'item_recipe_magic_wand', 'item_phase_boots', 'item_flask' }

Item['item_bristleback_outfit']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_gauntlets', 'item_recipe_bracer', 'item_flask', 'item_recipe_magic_wand', 'item_power_treads_str', 'item_flask' }


----------------------------------------------------------------------

Item['item_tank_outfit']				= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_gauntlets', 'item_recipe_bracer', 'item_flask', 'item_recipe_magic_wand', 'item_power_treads_str', 'item_flask', "item_ancient_janggo" }

Item['item_dragon_knight_outfit']		= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_gauntlets', 'item_magic_stick', 'item_flask', 'item_recipe_magic_wand', 'item_gauntlets', 'item_power_treads_str', 'item_flask', 'item_broken_soul_ring', "item_ancient_janggo" }

Item['item_ogre_magi_outfit']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_mantle', 'item_recipe_null_talisman', 'item_flask', 'item_recipe_magic_wand', 'item_power_treads_int', 'item_flask', "item_ancient_janggo", 'item_hand_of_midas' }


--------------------------------------------------------------------------

Item['item_priest_outfit']				= { 'item_tango', 'item_tango', 'item_flask', 'item_double_branches', 'item_circlet', 'item_magic_stick', 'item_flask', 'item_boots', 'item_recipe_magic_wand', 'item_ring_of_protection', 'item_sobi_mask', 'item_recipe_urn_of_shadows', 'item_flask', 'item_energy_booster' }

-----------------------------------------------------------------------------


Item['item_mage_outfit']				= { 'item_tango', 'item_flask', 'item_branches', 'item_circlet', 'item_mantle', 'item_magic_stick', 'item_recipe_null_talisman', 'item_branches', 'item_flask', 'item_arcane_boots', 'item_flask', 'item_recipe_magic_wand' }

Item['item_crystal_maiden_outfit']		= { 'item_tango', 'item_flask', 'item_branches', 'item_circlet', 'item_mantle', 'item_magic_stick', 'item_recipe_null_talisman', 'item_branches', 'item_flask', 'item_power_treads_int', 'item_flask', 'item_recipe_magic_wand' }


-----------------------------------------------------------------------------


Item['PvN_priest']		= { 'item_tango', 'item_flask', 'item_bracer', 'item_power_treads_int', 'item_flask', 'item_bracer', 'item_blade_mail', 'item_glimmer_cape', 'item_heavens_halberd', 'item_cyclone', 'item_sphere', 'item_sheepstick', 'item_moon_shard'}

Item['PvN_mage']		= { 'item_tango', 'item_flask', 'item_bracer', 'item_power_treads_int', 'item_flask', 'item_bracer', 'item_blade_mail', 'item_glimmer_cape', 'item_heavens_halberd', 'item_lotus_orb', 'item_force_staff', 'item_sheepstick', 'item_moon_shard'}

Item['PvN_melee_carry']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_blade_mail', 'item_shadow_amulet', 'item_heavens_halberd', 'item_diffusal_blade', "item_travel_boots", 'item_abyssal_blade', 'item_moon_shard'}

Item['PvN_str_carry']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_bracer', 'item_bracer', 'item_flask', 'item_power_treads_str', 'item_blade_mail', 'item_heavens_halberd', "item_travel_boots", 'item_abyssal_blade', 'item_moon_shard'}

Item['PvN_ranged_carry']= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_wraith_band', 'item_dragon_lance', 'item_blade_mail', 'item_shadow_amulet', 'item_heavens_halberd', "item_travel_boots", 'item_broken_hurricane_pike', 'item_bloodthorn', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_tank']		= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_bracer', 'item_bracer', 'item_flask', 'item_power_treads_str', 'item_blade_mail', 'item_crimson_guard', 'item_heavens_halberd', "item_travel_boots", 'item_assault', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_mid']			= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_dragon_lance', 'item_blade_mail', 'item_heavens_halberd', 'item_shadow_amulet', "item_travel_boots", 'item_broken_hurricane_pike', 'item_bloodthorn', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_antimage']	= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_blade_mail', 'item_broken_bfury', 'item_manta', 'item_heavens_halberd', "item_travel_boots", 'item_abyssal_blade', 'item_skadi', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_huskar']		= { 'item_tango', 'item_flask', 'item_bracer', 'item_bracer', 'item_bracer', 'item_flask', 'item_power_treads_agi', 'item_dragon_lance', 'item_blade_mail', 'item_shadow_amulet', 'item_heavens_halberd', "item_travel_boots", 'item_broken_hurricane_pike', 'item_heart', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_clinkz']		= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_dragon_lance', 'item_blade_mail', 'item_heavens_halberd', "item_travel_boots", 'item_solar_crest', 'item_broken_hurricane_pike', 'item_bloodthorn', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_BH']			= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_blade_mail', 'item_heavens_halberd', "item_travel_boots", 'item_solar_crest', "item_abyssal_blade", 'item_bloodthorn', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_TA']			= { 'item_tango', 'item_flask', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_dragon_lance', 'item_blade_mail',  'item_heavens_halberd', "item_travel_boots", 'item_desolator', 'item_broken_hurricane_pike', 'item_bloodthorn', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_PA']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_blade_mail',  'item_heavens_halberd', "item_travel_boots", 'item_desolator', 'item_abyssal_blade', 'item_nullifier', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_PL']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_wraith_band', 'item_wraith_band', 'item_flask', 'item_power_treads_agi', 'item_diffusal_blade', 'item_blade_mail', 'item_manta', 'item_heavens_halberd', "item_travel_boots", 'item_abyssal_blade', 'item_moon_shard', "item_travel_boots_2" }

Item['PvN_OM']			= { 'item_tango', 'item_flask', 'item_quelling_blade', 'item_bracer', 'item_bracer', 'item_flask', 'item_power_treads_int', 'item_blade_mail', 'item_hand_of_midas', 'item_shadow_amulet', 'item_heavens_halberd', "item_travel_boots", 'item_sheepstick', 'item_moon_shard', "item_travel_boots_2" }

end
------------------------------------------------------------------------------------------------------


function Item.IsConsumableItem( sItemName )

	return tConsumableItemList[sItemName] == true

end


function Item.IsSmallItem( sItemName )

	return tSmallItemList[sItemName] ~= nil

end


function Item.IsNeutralItem( sItemName )

	return tNeutralItemLevelList[sItemName] ~= nil

end

function Item.GetNeutralItemLevel( sItemName )

	if tNeutralItemLevelList[sItemName] == nil then return 0 end

	return tNeutralItemLevelList[sItemName]

end

function Item.GetMinTeamNeutralItemLevel()

	local nMinItemLevel = 999
	for i = 1, 5
	do
		local member = GetTeamMember( i )
		if	member ~= nil
		then
			local hNeutralItem = member:GetItemInSlot( 16 )
			if hNeutralItem ~= nil
			then
				local sNeutralItemName = hNeutralItem:GetName()
				if Item.GetNeutralItemLevel( sNeutralItemName ) < nMinItemLevel
				then
					nMinItemLevel = Item.GetNeutralItemLevel( sNeutralItemName )
				end
			else
				nMinItemLevel = 0
				break
			end
		end
	end

	return nMinItemLevel

end

function Item.GetInUseNeutralItemLevel( bot )

	local hNeutralItem = bot:GetItemInSlot( 16 )
	if hNeutralItem ~= nil
	then
		local sNeutralItemName = hNeutralItem:GetName()
		return Item.GetNeutralItemLevel( sNeutralItemName )
	end

	return 0

end

--捡中立物品
function Item.GetInGroundItem( bot )

	local botEmptyInventoryCount = Item.GetEmptyNeutralBackpackAmount( bot )

	if botEmptyInventoryCount == 0 then return nil end

	if bot:GetItemInSlot( 16 ) ~= nil
	then
		for i = 1, 5
		do
			local nAlly = GetTeamMember( i )
			if nAlly ~= nil
				and nAlly ~= bot
				and nAlly:IsAlive()
				and GetUnitToUnitDistance( bot, nAlly ) <= 1200
				and ( Item.GetEmptyNeutralBackpackAmount( nAlly ) > botEmptyInventoryCount
					 or not nAlly:IsBot()
					 or nAlly:GetItemInSlot( 16 ) == nil )
			then
				return nil
			end
		end
	end

	if bot:DistanceFromFountain() > 1800 and botEmptyInventoryCount >= 1
	then
		local tDropList = GetDroppedItemList()
		local nMaxLevel = - 1
		local nTargetItem = nil
		for _, tDropItem in pairs( tDropList )
		do
			if tDropItem.item ~= nil
				and tDropItem.location ~= nil
				and GetUnitToLocationDistance( bot, tDropItem.location ) <= 1200
			then
				local sDropName = tDropItem.item:GetName()
				local nDropOwner = tDropItem.owner
				if nDropOwner ~= bot
					and Item.IsNeutralItem( sDropName )
					and Item.GetNeutralItemLevel( sDropName ) > nMaxLevel
				then
					nMaxLevel = Item.GetNeutralItemLevel( sDropName )
					nTargetItem = tDropItem
				end
			end
		end

		if nTargetItem ~= nil
		then
			--print( bot:GetUnitName().." piking item:"..nTargetItem.item:GetName() )
			return nTargetItem
		end
	end

	return nil

end

--丢中立物品
function Item.GetNeedDropNeutralItem( bot )

	local botEmptyInventoryCount = Item.GetEmptyNeutralBackpackAmount( bot )
	local botNeutralItemCount = Item.GetNeutralItemCount( bot )

	if botNeutralItemCount <= 0 then return nil end

	local hNeedDropItem = nil
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
				hNeedDropItem = inSoltItem
				nMinItemLevel = Item.GetNeutralItemLevel( inSoltItemName )
			end
		end
	end

	if hNeedDropItem ~= nil
	then
		--基地丢装备
		if bot:DistanceFromFountain() < 1800
		then
			local sNeedDropItemName = hNeedDropItem:GetName()
			local nNeedDropItemLevel = Item.GetNeutralItemLevel( sNeedDropItemName )
			local nMinTeamNeutralItemLevel = Item.GetMinTeamNeutralItemLevel()
			if ( nNeedDropItemLevel <= nMinTeamNeutralItemLevel + 1 and nNeedDropItemLevel < 42 ) --中立物品等级过低
				or ( botNeutralItemCount >= 2 and nNeedDropItemLevel <= nMinTeamNeutralItemLevel ) --中立物品等级低
				or ( botNeutralItemCount >= 3 ) --中立物品过多
			then
				--print( bot:GetUnitName().." 1dropping item:"..hNeedDropItem:GetName() )
				return hNeedDropItem, bot
			end

		end


		--非基地丢装备
		local nTargetMember = nil
		if bot:DistanceFromFountain() > 2000
			and botNeutralItemCount >= 2
		then
			for i = 1, 5
			do
				local member = GetTeamMember( i )
				if member ~= nil
					and member ~= bot
					and member:IsAlive()
					and not member:IsChanneling()
					and GetUnitToUnitDistance( bot, member ) <= 1200
					and Item.GetEmptyNeutralBackpackAmount( member ) >= 1
				then
					local memberEmptyInventoryCount = Item.GetEmptyNeutralBackpackAmount( member )
					if ( member:GetItemInSlot( 16 ) == nil )
						or ( memberEmptyInventoryCount >= botEmptyInventoryCount + 3 )
						or ( memberEmptyInventoryCount >= botEmptyInventoryCount + 2
							 and Item.GetInUseNeutralItemLevel( member ) + 3 < Item.GetNeutralItemLevel( hNeedDropItem:GetName() ) )--队友正在用的等级远低于要丢的
					then
						nTargetMember = member
						break
					end
				end
			end
		end

		if nTargetMember ~= nil
		then
			--print( bot:GetUnitName().." 2dropping item:"..hNeedDropItem:GetName() )
			return hNeedDropItem, nTargetMember
		end

	end

	return nil

end


function Item.IsNotSellItem( sItemName )

	return tNotSellItemList[sItemName] == true

end


function Item.IsCanNotSwitchItem( sItemName )

	return tCanNotSwitchItemList[sItemName] == true

end


function Item.IsDebugItem( sItemName )

	return tDebugItemList[sItemName] == true

end


function Item.IsSpecifiedItem( sItemName )

	return tSpecifiedItemIndex[sItemName] == true

end


function Item.IsTopItem( sItemName )

	return tTopItemList[sItemName] == true

end


function Item.IsExistInTable( u, tUnits )

	for _, t in pairs( tUnits )
	do
		if u == t then return true end
	end

	return false

end


function Item.HasItem( bot, itemName )

	return bot:FindItemSlot( itemName ) >= 0

end


function Item.IsItemInHero( sItemName )

	local bot = GetBot()

	if tDefineItemRealName[sItemName] ~= nil
	then return Item.IsItemInHero( tDefineItemRealName[sItemName] ) end

	if string.find( sItemName, 'item_double' ) ~= nil
	then return Item.GetItemCountInSolt( bot, string.gsub( sItemName, "_double", "" ), 0, 8 ) >= 2 end

	if string.find( sItemName, 'PvN_' ) ~= nil then return Item.IsItemInHero( 'item_moon_shard' ) end

	if sItemName == 'item_ultimate_scepter' and bot:HasModifier( 'modifier_item_ultimate_scepter_consumed' ) then return true end

	if sItemName == 'item_ultimate_scepter_2' then return bot:HasModifier( 'modifier_item_ultimate_scepter_consumed' ) end

	local nItemSolt = bot:FindItemSlot( sItemName )

	--add courier solt better
	return nItemSolt >= 0 and ( nItemSolt <= 8 or Item.IsTopItem( sItemName ) )

end

--获取物品当前不重复基础构造
function Item.GetBasicItems( sItemList )

	local bot = GetBot()
	local tBasicItem = {}

	for i, v in pairs( sItemList )
	do
		local bRepeatedItem = Item.IsItemInHero( v )
		if bRepeatedItem == false
			or v == bot.sLastRepeatItem
		then
			if Item[v] ~= nil	
			then		
				for _, w in pairs( Item.GetBasicItems( Item[v] ) )
				do
					tBasicItem[#tBasicItem + 1] = w
				end
			elseif Item[v] == nil
				then
					tBasicItem[#tBasicItem + 1] = v
			end
		else
			if Item.GetItemCount( GetBot(), v ) <= 1 --能修复"两个"系列重复的问题
			then
				bot.sLastRepeatItem = v	--能修复单重重复的问题
			end
		end
	end

	return tBasicItem

end


--获取物品的基础构造
function Item.GetItemBasicBuild( sItemName )

	local tItem = sItemName

	if type( tItem ) == "string" then tItem = { tItem } end

	local sBasicItem = {}

	for i, v in pairs( tItem )
	do
		local tComponents = GetItemComponents( v )
		if #tComponents == 0
		then
			sBasicItem[#sBasicItem + 1] = v
		elseif #tComponents > 0
			then
				for _, w in pairs( Item.GetItemBasicBuild( tComponents[1] ) )
				do
					sBasicItem[#sBasicItem + 1] = w
				end
		end
	end

	return sBasicItem

end


--根据购物列表获取完整的不重复基础物品名单
function Item.GetBasicItemToBuyList( sItemList )

	local sBasicItemToBuyList = {}

	return sBasicItemToBuyList

end


function Item.GetMainInvLessValItemSlot( bot )

	local minPrice = 10000
	local minSlot = - 1
	for i = 0, 5
	do
		local item = bot:GetItemInSlot( i )
		if item ~= nil
			and not Item.IsCanNotSwitchItem( item:GetName() )
		then
			local cost = GetItemCost( item:GetName() )
			if cost < minPrice then
				minPrice = cost
				minSlot = i
			end
		end
	end

	return minSlot

end


function Item.GetItemCharges( bot, itemName )

	local charges = 0
	for i = 0, 16
	do
		local item = bot:GetItemInSlot( i )
		if item ~= nil and item:GetName() == itemName
		then
			charges = charges + item:GetCurrentCharges()
		end
	end

	return charges

end


function Item.GetNeutralItemCount( bot )

	local amount = 0
	local nSlotList = { 6, 7, 8, 16 }
	for _, i in pairs( nSlotList )
	do
		local item = bot:GetItemInSlot( i )
		if item ~= nil
		then
			local itemName = item:GetName()
			if Item.IsNeutralItem( itemName )
				and not Item.IsConsumableItem( itemName )
			then
				amount = amount + 1
			end
		end
	end

	return amount

end


function Item.GetEmptyInventoryAmount( bot )

	local amount = 0
	for i = 0, 8
	do
		local item = bot:GetItemInSlot( i )
		if item == nil
		then
			amount = amount + 1
		end
	end

	return amount

end


function Item.GetEmptyNeutralBackpackAmount( bot )

	local amount = ( bot:GetItemInSlot( 16 ) == nil and 1 or 0 )

	for i = 6, 8
	do
		local item = bot:GetItemInSlot( i )
		if item == nil
		then
			amount = amount + 1
		end
	end

	return amount

end


function Item.GetItemCount( unit, itemName )

	local count = 0
	for i = 0, 16
	do
		local item = unit:GetItemInSlot( i )
		if item ~= nil and item:GetName() == itemName
		then
			count = count + 1
		end
	end

	return count

end


function Item.GetItemCountInSolt( unit, itemName, nSlotMin, nSlotMax )

	local count = 0
	for i = nSlotMin, nSlotMax
	do
		local item = unit:GetItemInSlot( i )
		if item ~= nil and item:GetName() == itemName
		then
			count = count + 1
		end
	end

	return count

end


function Item.HasBasicItem( bot )

	local basicItemSlot = - 1

	for i = 1, #Item['sBasicItems']
	do
		basicItemSlot = bot:FindItemSlot( Item['sBasicItems'][i] )
		if basicItemSlot >= 0 and basicItemSlot <= 5
		then
			return true
		end
	end

	return false
end


function Item.HasBuyBoots( bot )

	local bootsSlot = - 1

	for i = 1, #Item['tEarlyBoots']
	do
		bootsSlot = bot:FindItemSlot( Item['tEarlyBoots'][i] )
		if bootsSlot >= 0
		then
			return true
		end
	end


	return false

end


function Item.HasBootsInMainSolt( bot )

	local bootsSlot = - 1

	for i = 1, #Item['tEarlyBoots']
	do
		bootsSlot = bot:FindItemSlot( Item['tEarlyBoots'][i] )
		if bootsSlot >= 0 and bootsSlot <= 8
		then
			return true
		end
	end

	return false

end


function Item.GetTheItemSolt( bot, nSlotMin, nSlotMax, bMaxCost )

	if bMaxCost
	then
		local nMaxCost = - 9999
		local idx = - 1
		for i = nSlotMin, nSlotMax
		do
			if bot:GetItemInSlot( i ) ~= nil
			then
				local sItem = bot:GetItemInSlot( i ):GetName()
				if GetItemCost( sItem ) > nMaxCost
				then
					nMaxCost = GetItemCost( sItem )
					idx = i
				end
			end
		end

		return idx
	end

	local nMinCost = 99999
	local idx = - 1
	for i = nSlotMin, nSlotMax
	do
		if bot:GetItemInSlot( i ) ~= nil
		then
			local sItem = bot:GetItemInSlot( i ):GetName()
			if GetItemCost( sItem ) < nMinCost
			then
				nMinCost = GetItemCost( sItem )
				idx = i
			end
		end
	end

	return idx

end


function Item.GetOutfitType( bot )

	local nOutfitID = 0
	local sOutfitTypeList = {
		[1] = 'outfit_priest',
		[2] = 'outfit_mage',
		[3] = 'outfit_carry',
		[4] = 'outfit_tank',
		[5] = 'outfit_mid',
	}

	local nTeamPlayerIDs = GetTeamPlayers( GetTeam() )
	for i = 1, 5
	do
		local memberID = nTeamPlayerIDs[i]
		if memberID ~= nil
			and IsPlayerBot( memberID )
		then
			nOutfitID = nOutfitID + 1
			if bot:GetPlayerID() == memberID
			then
				return sOutfitTypeList[nOutfitID]
			end
		end
	end

end

function Item.GetItemWardSolt()

	local bot = GetBot()

	local sWardTypeList = {
		'item_ward_observer',
		'item_ward_sentry',
		'item_ward_dispenser',
	}


	for _, sType in pairs( sWardTypeList )
	do
		local nWardSolt = bot:FindItemSlot( sType )
		if nWardSolt ~= - 1
		then
			return nWardSolt
		end
	end

	return - 1

end

--item_aghanims_shard

return Item
-- dota2jmz@163.com QQ:2462331592