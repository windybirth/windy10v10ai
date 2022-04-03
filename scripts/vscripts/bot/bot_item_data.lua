--[[ ============================================================================================================
	Author: Windy
	Date: September 14, 2021
================================================================================================================= ]]
tBotItemData = {}

-- purchase item in order
tBotItemData.purchaseItemList = {
	npc_dota_hero_axe = {
		'item_magic_wand',
		'item_power_treads',
		'item_bracer',
		'item_vanguard',
		'item_blade_mail',
		'item_platemail',
		'item_recipe_blade_mail_2',
		'item_blink',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_black_king_bar_2',
		'item_ultimate_scepter_2',
		'item_insight_armor',
		'item_undying_heart',
		'item_moon_shard_datadriven',
		'item_abyssal_blade_v2',
		'item_jump_jump_jump',
	},
	npc_dota_hero_bane = {
		'item_magic_wand',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_aether_lens_3',
		'item_wings_of_haste',
		'item_aghanims_shard',
		-- 'item_ultimate_scepter',
		-- 'item_recipe_ultimate_scepter_2',
		'item_soul_booster',
		'item_gungir_2',
		'item_recipe_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_sheepstick',
		'item_hallowed_scepter',
		'item_shivas_guard_2',
	},
	npc_dota_hero_bounty_hunter = {
		'item_magic_wand',
		'item_wraith_band',
		'item_power_treads',
		'item_orb_of_corrosion',
		'item_wings_of_haste',
		'item_sange_and_yasha',
		'item_echo_sabre_2',
		'item_aghanims_shard',
		'item_infernal_desolator',
		'item_ultimate_scepter_2',
		'item_monkey_king_bar_2',
		'item_wasp_callous',
		'item_blue_fantasy',
		'item_undying_heart',
		'item_abyssal_blade_v2',
		'item_wasp_despotic',
	},
	npc_dota_hero_bloodseeker = {
		'item_magic_wand',
		'item_wraith_band',
		'item_power_treads',
		'item_orb_of_corrosion',
		'item_vanguard',
		'item_maelstrom',
		'item_wings_of_haste',
		'item_hyperstone',
		'item_recipe_mjollnir',
		'item_echo_sabre_2',
		'item_sange_and_yasha',
		'item_aghanims_shard',
		'item_ultimate_scepter_2',
		'item_basher',
		'item_recipe_abyssal_blade',
		'item_recipe_abyssal_blade_v2',

		'item_monkey_king_bar_2',
		'item_wasp_callous',
		'item_infernal_desolator',
		'item_wasp_despotic',
		'item_black_king_bar_2',
		'item_blue_fantasy',
	},
	npc_dota_hero_bristleback = {
		'item_magic_wand',
		'item_power_treads',
		'item_vanguard',
		'item_falcon_blade',
		'item_blade_mail',
		'item_platemail',
		'item_recipe_blade_mail_2',
		'item_echo_sabre',
		'item_wings_of_haste',
		'item_eternal_shroud',
		'item_aghanims_shard',
		'item_insight_armor',
		'item_ultimate_scepter_2',
		'item_radiance_2',
		'item_vladmir_2',
		'item_undying_heart',
		'item_moon_shard_datadriven',
		'item_sacred_six_vein',
	},
	npc_dota_hero_chaos_knight = {
		'item_magic_wand',
		'item_power_treads',
		'item_bracer',
		'item_armlet',
		'item_echo_sabre',
		'item_falcon_blade',
		'item_wings_of_haste',
		'item_sange_and_yasha',
		'item_aghanims_shard',
		'item_vladmir_2',
		'item_insight_armor',
		'item_undying_heart',
		'item_monkey_king_bar_2',
		'item_infernal_desolator',
		-- 'item_ultimate_scepter_2',
		'item_moon_shard_datadriven',
		'item_abyssal_blade_v2',
	},
	npc_dota_hero_crystal_maiden = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_aghanims_shard',
		'item_black_king_bar_2',
		'item_ultimate_scepter_2',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_sheepstick',
		'item_dagon_5',
		'item_hallowed_scepter',
	},
	npc_dota_hero_dazzle = {
		'item_magic_wand',
		'item_headdress',
		'item_fluffy_hat',
		'item_recipe_holy_locket',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sheepstick',

		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',

		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_dagon_5',
		'item_gungir_2',
		'item_ultimate_scepter_2',
		'item_hallowed_scepter',
	},
	npc_dota_hero_death_prophet = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_shivas_guard_2',
		'item_aghanims_shard',
		'item_aether_lens_3',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_dagon_5',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_ultimate_scepter_2',
		'item_sheepstick',
		'item_hallowed_scepter',
		'item_sphere_2',
	},
	npc_dota_hero_dragon_knight = {
		'item_magic_wand',
		'item_power_treads',
		'item_bracer',
		'item_armlet',
		'item_heavens_halberd',
		'item_wings_of_haste',
		'item_blink',
		'item_sange_and_yasha',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_maelstrom',
		'item_hyperstone',
        'item_recipe_mjollnir',
		'item_gungir',
		'item_recipe_gungir_2',
		'item_black_king_bar_2',
		'item_vladmir_2',
		'item_aghanims_shard',
		'item_ultimate_scepter_2',
		'item_undying_heart',
		'item_wasp_despotic',
		'item_moon_shard_datadriven',
		'item_wasp_callous',
		'item_jump_jump_jump',
	},
	npc_dota_hero_drow_ranger = {
		'item_wraith_band',
		'item_wraith_band',
		'item_power_treads',
		'item_dragon_lance',
		'item_mask_of_madness',
		'item_wings_of_haste',
		'item_recipe_dragon_lance_plus',
		'item_eagle',
		'item_recipe_dragon_lance_pro_max',
		'item_aghanims_shard',
		'item_hurricane_pike',
		'item_recipe_hurricane_pike_2',
		'item_ultimate_scepter_2',
		'item_butterfly',
		'item_satanic',
		'item_silver_edge_2',
		'item_infernal_desolator',
		'item_black_king_bar_2',
		'item_lesser_crit',
		'item_recipe_wasp_callous',
		'item_wasp_despotic',
		'item_satanic',
	},
	npc_dota_hero_earthshaker = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_bracer',
		'item_force_staff',
		'item_blink',
		'item_blade_mail_2',
		'item_wings_of_haste',
		'item_heavens_halberd',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_echo_sabre_2',
		'item_aghanims_shard',
		'item_shivas_guard_2',
		'item_ultimate_scepter_2',
		'item_abyssal_blade_v2',
		'item_undying_heart',
		'item_moon_shard_datadriven',
		'item_jump_jump_jump',
		'item_sacred_six_vein',
	},
	npc_dota_hero_jakiro = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_sheepstick',
		'item_shivas_guard_2',
		'item_dagon_5',
		'item_hallowed_scepter',
	},
	npc_dota_hero_juggernaut = {
		'item_magic_wand',
		'item_power_treads',
		'item_orb_of_corrosion',
		'item_mask_of_madness',
		'item_falcon_blade',
		'item_bfury',
		'item_wings_of_haste',
		'item_echo_sabre',
		'item_sange_and_yasha',
		'item_aghanims_shard',
		'item_black_king_bar_2',
		'item_monkey_king_bar_2',
		'item_ultimate_scepter_2',
		'item_adi_king_plus',
		'item_wasp_callous',
		'item_moon_shard_datadriven',
		'item_blue_fantasy',
		'item_abyssal_blade_v2',
		'item_wasp_despotic',
	},
	npc_dota_hero_kunkka = {
		'item_magic_wand',
		'item_power_treads',
		'item_bracer',
		'item_armlet',
		'item_bfury',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter_2',
		'item_greater_crit',
		'item_black_king_bar_2',
		'item_vladmir',
		'item_assault',
		'item_recipe_vladmir_2',
		'item_abyssal_blade_v2',
		'item_infernal_desolator',
		'item_silver_edge_2',
		'item_moon_shard_datadriven',
		'item_wasp_despotic',
		'item_wasp_callous',
		'item_excalibur',
	},
	npc_dota_hero_lich = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_sheepstick',
		'item_shivas_guard_2',
		'item_dagon_5',
		'item_hallowed_scepter',
	},
	npc_dota_hero_lina = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_kaya_and_sange',
		'item_yasha',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_sacred_trident',
		'item_sheepstick',
		'item_dagon_5',
		'item_hallowed_scepter',
		'item_silver_edge_2',
	},
	npc_dota_hero_lion = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_blink',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_mystic_staff',
		'item_recipe_arcane_blink',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_dagon_5',
		'item_hallowed_scepter',
		'item_sheepstick',
	},
	npc_dota_hero_luna = {
		'item_magic_wand',
		'item_power_treads',
		'item_wraith_band',
		'item_dragon_lance',
		'item_mask_of_madness',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_recipe_dragon_lance_plus',
		'item_eagle',
		'item_recipe_dragon_lance_pro_max',
		'item_hurricane_pike',
		'item_recipe_hurricane_pike_2',
		'item_monkey_king_bar_2',
		'item_ultimate_scepter_2',
		'item_satanic',
		'item_infernal_desolator',
		'item_wasp_callous',
		'item_skadi_2',
		'item_wasp_despotic',
		'item_satanic',
	},
	npc_dota_hero_mirana = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_dagon_5',
		'item_sheepstick',
		'item_arcane_octarine_core',
		'item_hallowed_scepter',
		'item_shivas_guard_2',
	},
	npc_dota_hero_nevermore = {
		'item_magic_wand',
		'item_wraith_band',
		'item_power_treads',
		'item_falcon_blade',
		'item_mask_of_madness',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_black_king_bar_2',
		'item_ultimate_scepter_2',
		'item_blink',
		'item_eagle',
		'item_recipe_swift_blink',
		'item_infernal_desolator',
		'item_satanic',
		'item_wasp_callous',
		'item_monkey_king_bar_2',
		'item_skadi_2',
		'item_wasp_despotic',
		'item_satanic',
		'item_jump_jump_jump',
	},
	npc_dota_hero_necrolyte = {
		'item_magic_wand',
		'item_headdress',
		'item_fluffy_hat',
		'item_recipe_holy_locket',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_shivas_guard_2',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_undying_heart',
		'item_insight_armor',
		'item_sheepstick',
		'item_sacred_six_vein',
	},
	npc_dota_hero_ogre_magi = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_orb_of_corrosion',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_blink',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_dagon_5',
		'item_hallowed_scepter',
		'item_sheepstick',
		'item_jump_jump_jump',
	},
	npc_dota_hero_omniknight = {
		'item_magic_wand',
		'item_headdress',
		'item_fluffy_hat',
		'item_recipe_holy_locket',
		'item_arcane_boots',
		'item_vanguard',
		'item_glimmer_cape',
		'item_echo_sabre_2',
		'item_shivas_guard_2',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_undying_heart',
		'item_insight_armor',
		'item_vladmir_2',
		'item_moon_shard_datadriven',
		'item_heavens_halberd_v2',
	},
	npc_dota_hero_oracle = {
		'item_magic_wand',
		'item_headdress',
		'item_fluffy_hat',
		'item_recipe_holy_locket',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_rod_of_atos',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter_2',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_dagon_5',
		'item_sheepstick',
		'item_arcane_octarine_core',
		'item_shivas_guard_2',
		'item_hallowed_scepter',
	},
	npc_dota_hero_phantom_assassin = {
		'item_magic_wand',
		'item_power_treads',
		'item_wraith_band',
		'item_orb_of_corrosion',
		'item_falcon_blade',
		'item_echo_sabre',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_black_king_bar_2',
		'item_infernal_desolator',
		'item_ultimate_scepter_2',
		'item_abyssal_blade_v2',
		'item_wasp_callous',
		'item_satanic',
		'item_wasp_despotic',
		'item_excalibur',
		'item_satanic',
	},
	npc_dota_hero_pudge = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_bracer',
		'item_vanguard',
		'item_hood_of_defiance',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_blade_mail_2',
		'item_blink',
		'item_voodoo_mask',
		'item_recipe_eternal_shroud',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_ultimate_scepter_2',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_insight_armor',
		'item_undying_heart',
		'item_shivas_guard_2',
		'item_moon_shard_datadriven',
		'item_abyssal_blade_v2',
	},
	npc_dota_hero_razor = {
		'item_magic_wand',
		'item_power_treads',
		'item_vanguard',
		'item_falcon_blade',
		'item_mask_of_madness',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_cyclone',
		'item_black_king_bar_2',
		'item_ultimate_scepter_2',
		'item_monkey_king_bar_2',
		'item_skadi_2',
		'item_moon_shard_datadriven',
		'item_undying_heart',
		'item_insight_armor',
		'item_wasp_callous',
		'item_wasp_despotic',
	},
	npc_dota_hero_riki = {
		'item_magic_wand',
		'item_power_treads',
		'item_wraith_band',
		'item_falcon_blade',
		'item_echo_sabre',
		'item_bfury',
		'item_wings_of_haste',
		'item_sange_and_yasha',
		'item_aghanims_shard',
		'item_monkey_king_bar_2',
		'item_infernal_desolator',
		'item_ultimate_scepter_2',
		'item_blue_fantasy',
		'item_satanic',
		'item_moon_shard_datadriven',
		'item_wasp_callous',
		'item_wasp_despotic',
		'item_abyssal_blade_v2',
		'item_satanic',
	},
	npc_dota_hero_shadow_shaman = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_blink',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_mystic_staff',
		'item_recipe_arcane_blink',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_soul_booster',
		'item_recipe_arcane_octarine_core',
		'item_sheepstick',
		'item_wind_waker',
		'item_sphere_2',
	},
	npc_dota_hero_sand_king = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_aether_lens_3',
		'item_blink',
		'item_shivas_guard_2',
		'item_echo_sabre_2',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_soul_booster',
		'item_black_king_bar_2',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_recipe_arcane_octarine_core',
		'item_undying_heart',
		'item_sheepstick',
		'item_moon_shard_datadriven',
		'item_jump_jump_jump',
	},
	npc_dota_hero_skywrath_mage = {
		'item_tango',
		'item_clarity',
		'item_enchanted_mango',
		'item_magic_wand',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_rod_of_atos',
		'item_aghanims_shard',
		'item_ultimate_scepter_2',
		'item_sacred_trident',
		'item_dagon_5',
		'item_sacred_trident',
		'item_arcane_octarine_core',
		'item_hallowed_scepter',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_shivas_guard_2',
	},
	npc_dota_hero_sniper = {
		'item_magic_wand',
		'item_power_treads',
		'item_dragon_lance',
		'item_mask_of_madness',
		'item_maelstrom',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_recipe_dragon_lance_plus',
		'item_eagle',
		'item_recipe_dragon_lance_pro_max',
		'item_hurricane_pike',
		'item_recipe_hurricane_pike_2',
		'item_ultimate_scepter_2',
		'item_monkey_king_bar_2',
		'item_infernal_desolator',
		'item_wasp_callous',
		'item_satanic',
		'item_skadi_2',
		'item_wasp_despotic',
		'item_shotgun_v2',
		'item_excalibur',
		'item_satanic',
	},
	npc_dota_hero_sven = {
		'item_magic_wand',
		'item_power_treads',
		'item_vanguard',
		'item_falcon_blade',
		'item_mask_of_madness',
		'item_wings_of_haste',
		'item_echo_sabre',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_sange_and_yasha',
		'item_black_king_bar_2',
		'item_monkey_king_bar_2',
		'item_vladmir_2',
		'item_moon_shard_datadriven',
		'item_wasp_despotic',
		'item_undying_heart',
		'item_infernal_desolator',
		'item_wasp_callous',
		'item_sacred_six_vein',
	},
	npc_dota_hero_skeleton_king = {
		'item_magic_wand',
		'item_power_treads',
		'item_bracer',
		'item_armlet',
		'item_echo_sabre',
		'item_falcon_blade',
		'item_blink',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_heavens_halberd',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_sange_and_yasha',
		'item_monkey_king_bar_2',
		'item_adi_king_plus',
		'item_ultimate_scepter_2',
		'item_infernal_desolator',
		'item_undying_heart',
		'item_moon_shard_datadriven',
		'item_blue_fantasy',
		'item_jump_jump_jump',
	},
	npc_dota_hero_tiny = {
		'item_magic_wand',
		'item_power_treads',
		'item_vanguard',
		'item_falcon_blade',
		'item_blink',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_wings_of_haste',
		'item_echo_sabre',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_black_king_bar_2',
		'item_vladmir_2',
		'item_moon_shard_datadriven',
		'item_heavens_halberd_v2',
		'item_undying_heart',
		'item_wasp_despotic',
		'item_wasp_callous',
		'item_silver_edge_2',
		'item_jump_jump_jump',
	},
	npc_dota_hero_tidehunter = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_bracer',
		'item_force_staff',
		'item_blink',
		'item_wings_of_haste',
		'item_heavens_halberd',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_aghanims_shard',
		'item_shivas_guard_2',
		'item_ultimate_scepter_2',
		'item_arcane_octarine_core',
		'item_vladmir_2',
		'item_insight_armor',
		'item_moon_shard_datadriven',
		'item_undying_heart',
	},
	npc_dota_hero_vengefulspirit = {
		'item_magic_wand',
		'item_power_treads',
		'item_vanguard',
		'item_falcon_blade',
		'item_dragon_lance',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_desolator',
		'item_recipe_dragon_lance_plus',
		'item_eagle',
		'item_recipe_dragon_lance_pro_max',
		'item_hurricane_pike',
		'item_recipe_hurricane_pike_2',
		'item_ultimate_scepter_2',
		'item_monkey_king_bar_2',
		'item_infernal_desolator',
		'item_wasp_callous',
		'item_skadi_2',
		'item_vladmir_2',
		'item_wasp_despotic',
	},
	npc_dota_hero_viper = {
		'item_magic_wand',
		'item_power_treads',
		'item_vanguard',
		'item_falcon_blade',
		'item_dragon_lance',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_recipe_dragon_lance_plus',
		'item_eagle',
		'item_recipe_dragon_lance_pro_max',
		'item_hurricane_pike',
		'item_recipe_hurricane_pike_2',
		'item_ultimate_scepter_2',
		'item_monkey_king_bar_2',
		'item_shotgun_v2',
		'item_adi_king_plus',
		'item_wasp_callous',
		'item_undying_heart',
		'item_insight_armor',
		'item_wasp_despotic',
	},
	npc_dota_hero_warlock = {
		'item_magic_wand',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_dagon_5',
		'item_hallowed_scepter',
		'item_refresher',
		'item_shivas_guard_2',
	},
	npc_dota_hero_windrunner = {
		'item_magic_wand',
		'item_null_talisman',
		'item_power_treads',
		'item_maelstrom',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_desolator',
		'item_hyperstone',
		'item_recipe_mjollnir',
		'item_monkey_king_bar',
		'item_javelin',
		'item_javelin',
		'item_recipe_monkey_king_bar_2',
		'item_wasp_despotic',
		'item_black_king_bar_2',
		'item_infernal_desolator',
		'item_ultimate_scepter_2',
		'item_skadi_2',
		'item_wasp_callous',
	},
	npc_dota_hero_witch_doctor = {
		'item_magic_wand',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_soul_booster',
		'item_black_king_bar_2',
		'item_recipe_arcane_octarine_core',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_shivas_guard_2',
		'item_dagon_5',
		'item_hallowed_scepter',
	},
	npc_dota_hero_zuus = {
		'item_magic_wand',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_ultimate_scepter',
		'item_aether_lens',
		'item_recipe_aether_lens',
		'item_recipe_aether_lens',
		'item_soul_booster',
		'item_recipe_ultimate_scepter_2',
		'item_sacred_trident',
		'item_aghanims_shard',
		'item_wings_of_haste',
		'item_refresher',
		'item_aeon_disk',
		'item_recipe_aeon_pendant',
		'item_sacred_trident',
		'item_dagon_5',
		'item_recipe_arcane_octarine_core',
		'item_hallowed_scepter',
	},
}


-- sell item if has more than 8 item
-- same item only need set once
tBotItemData.sellItemList = {
	npc_dota_hero_axe = {
		'item_vanguard',
		'item_overwhelming_blink',

		-- local
	},
	npc_dota_hero_bane = {
		'item_arcane_boots',
		'item_force_staff',
	},
	npc_dota_hero_bounty_hunter = {
		'item_vanguard',
		'item_sange_and_yasha',
		'item_echo_sabre_2',

		-- local
		'item_mithril_hammer',
		'item_recipe_black_king_bar',
		'item_desolator',
	},
	npc_dota_hero_bloodseeker = {
		'item_sange_and_yasha',
		'item_echo_sabre_2',
		'item_mjollnir',
		-- local
		'item_mithril_hammer',
		'item_recipe_black_king_bar',
	},
	npc_dota_hero_bristleback = {
		'item_vanguard',
		'item_echo_sabre_2',
		'item_eternal_shroud',

	},
	npc_dota_hero_chaos_knight = {
		'item_armlet',
		'item_sange_and_yasha',
		'item_echo_sabre_2',
	},
	npc_dota_hero_crystal_maiden = {
		'item_force_staff',
	},
	npc_dota_hero_dazzle = {
		'item_holy_locket',
		'item_force_staff',
	},
	npc_dota_hero_death_prophet = {
		'item_force_staff',
	},
	npc_dota_hero_dragon_knight = {
		'item_armlet',
		'item_heavens_halberd',
		'item_sange_and_yasha',
		'item_overwhelming_blink',
	},
	npc_dota_hero_drow_ranger = {
		'item_wraith_band',
		'item_mask_of_madness',
	},
	npc_dota_hero_earthshaker = {
		'item_force_staff',
		'item_heavens_halberd',
		'item_echo_sabre_2',
		'item_overwhelming_blink',
	},
	npc_dota_hero_jakiro = {
		'item_force_staff',
	},
	npc_dota_hero_juggernaut = {
		'item_mask_of_madness',
		'item_sange_and_yasha',
		'item_echo_sabre_2',
		'item_bfury',
	},
	npc_dota_hero_kunkka = {
		'item_armlet',
		'item_greater_crit',
		'item_black_king_bar_2',
		'item_bfury',
	},
	npc_dota_hero_lich = {
		'item_force_staff',
	},
	npc_dota_hero_lina = {
		'item_force_staff',
	},
	npc_dota_hero_lion = {

		-- local
		'item_recipe_dagon',
	},
	npc_dota_hero_luna = {
		'item_wraith_band',
		'item_mask_of_madness',
		'item_sange_and_yasha',
	},
	npc_dota_hero_mirana = {
		'item_force_staff',
	},
	npc_dota_hero_nevermore = {
		'item_wraith_band',
		'item_falcon_blade',
		'item_mask_of_madness',
		'item_swift_blink',
	},
	npc_dota_hero_necrolyte = {
		'item_holy_locket',
	},
	npc_dota_hero_ogre_magi = {
		'item_overwhelming_blink',
	},
	npc_dota_hero_omniknight = {
		'item_vanguard',
		'item_holy_locket',
		'item_echo_sabre_2',
	},
	npc_dota_hero_oracle = {
		'item_holy_locket',
		'item_force_staff',
		'item_rod_of_atos',
	},
	npc_dota_hero_phantom_assassin = {
		'item_wraith_band',
		'item_echo_sabre_2',
	},
	npc_dota_hero_pudge = {
		'item_vanguard',
		'item_eternal_shroud',
		'item_overwhelming_blink',
	},
	npc_dota_hero_razor = {
		'item_vanguard',
		'item_falcon_blade',
		'item_mask_of_madness',
		'item_sange_and_yasha',
		'item_cyclone',
	},
	npc_dota_hero_riki = {
		'item_wraith_band',
		'item_echo_sabre_2',
		'item_bfury',
	},
	npc_dota_hero_shadow_shaman = {
		'item_force_staff',
	},
	npc_dota_hero_sand_king = {
		'item_echo_sabre_2',
		'item_overwhelming_blink',
	},
	npc_dota_hero_skywrath_mage = {
		'item_force_staff',
		'item_rod_of_atos',
	},
	npc_dota_hero_sniper = {
		'item_mask_of_madness',
		'item_sange_and_yasha',
		'item_maelstrom',
	},
	npc_dota_hero_sven = {
		'item_vanguard',
		'item_mask_of_madness',
		'item_sange_and_yasha',
		'item_echo_sabre_2',
	},
	npc_dota_hero_tidehunter = {
		'item_force_staff',
	},
	npc_dota_hero_vengefulspirit = {
		'item_falcon_blade',
		'item_vanguard',
		'item_desolator',
	},
	npc_dota_hero_viper = {
		'item_falcon_blade',
		'item_vanguard',
		'item_sange_and_yasha',
	},
	npc_dota_hero_warlock = {
		'item_arcane_boots',
		'item_force_staff',
	},
	npc_dota_hero_windrunner = {
		'item_desolator',
	},
	npc_dota_hero_witch_doctor = {
		'item_arcane_boots',
		'item_force_staff',
		'item_rod_of_atos',
	},
	npc_dota_hero_skeleton_king = {
		'item_armlet',
		'item_heavens_halberd',
		'item_sange_and_yasha',
		'item_echo_sabre_2',
		'item_overwhelming_blink',
	},
	npc_dota_hero_tiny = {
		'item_vanguard',
		'item_sange_and_yasha',
		'item_echo_sabre_2',
		'item_overwhelming_blink',
	},
	npc_dota_hero_zuus = {
	},
}

tBotItemData.sellItemCommonList = {
	-- Consume
	'item_tango_single',
	'item_tango',
	'item_clarity',
	'item_faerie_fire',
	'item_enchanted_mango',
	'item_flask',
	'item_bottle',

	-- basic
	'item_branches',
	'item_magic_stick',
	'item_recipe_magic_wand',
	'item_magic_wand',

	'item_quelling_blade',
	'item_circlet',
	'item_mantle',
	'item_sobi_mask',
	'item_ring_of_protection',
	'item_recipe_ring_of_basilius',
	'item_ring_of_basilius',

	-- 王冠
	'item_crown',
	-- 护腕
	'item_bracer',
	-- 挂件
	'item_null_talisman',
	-- 系带
	'item_wraith_band',
	-- 腐蚀之球
	'item_orb_of_corrosion',

	-- 相位
	'item_phase_boots',
	-- 动力鞋
	'item_power_treads',
	-- 秘法
	'item_arcane_boots',
	-- 绿鞋
	'item_tranquil_boots',
	-- 空明杖
	'item_oblivion_staff',
	-- BKB
	'item_black_king_bar',
}

-- Consume items
tBotItemData.itemConsumeList = {
	'item_wings_of_haste',
	'item_ultimate_scepter_2',
	'item_moon_shard_datadriven',
}

tBotItemData.itemConsumeNoTargetList = {
	'item_tome_of_agility',
	'item_tome_of_strength',
	'item_tome_of_intelligence',
}
-- ward setting
tBotItemData.wardHeroList = Set {
	'npc_dota_hero_bane',
	'npc_dota_hero_bounty_hunter',
	'npc_dota_hero_crystal_maiden',
	'npc_dota_hero_dazzle',
	'npc_dota_hero_pudge',
	'npc_dota_hero_sand_king',
	'npc_dota_hero_sven',
	'npc_dota_hero_lina',
	'npc_dota_hero_lich',
	'npc_dota_hero_lion',
	'npc_dota_hero_witch_doctor',
	'npc_dota_hero_riki',
	'npc_dota_hero_necrolyte',
}

tBotItemData.wardObserverPostionList = {
	-- 天辉

	-- 上路
	-- 上野区
	Vector(-5187, -1619, 0),
	Vector(-4574, 476, 0),
	Vector(-4096, 1525, 0),
	-- 中路
	-- 下野区
	Vector(303, -2584, 0),
	Vector(-510, -3334, 0),
	Vector(1556, -3169, 0),
	Vector(-1233, -5087, 0),
	-- 下路

	-- 中路河道
	Vector(-1625, -200, 0),
	Vector(74, -1320, 0),
	Vector(-519, 605, 0),
	-- roshan
	Vector(-2142, 1776, 0),

	-- 夜魇

	-- 上路
	-- 上野区
	-- 中路
	-- 下野区
	-- 下路
}
tBotItemData.wardSentryPostionList = {

	-- deward

	-- 天辉

	-- 上路
	Vector(-6586, -2440, 0),
	-- 上野区
	Vector(-4347, -1028, 0),
	-- 中路
	Vector(-3971, -3468, 0),
	-- 下野区
	Vector(303, -2584, 0),
	Vector(-510, -3334, 0),
	Vector(2800, -3087, 0),
	Vector(1279, -5118, 0),
	Vector(-1233, -5087, 0),
	-- 下路
	Vector(-2945, -6087, 0),

	-- 中路河道
	Vector(-1625, -200, 0),
	Vector(74, -1320, 0),
	Vector(-519, 605, 0),
	-- roshan
	Vector(-2142, 1776, 0),
	Vector(-2273, 2628, 0),



	-- 夜魇

	-- 上路
	-- 上野区
	-- 中路
	Vector(-3462, 2923, 0),
	Vector(-1611, 1155, 0),
	-- 下野区
	-- 下路
}
-- purchase neutral item in order
tBotItemData.addNeutralItemList = {
	npc_dota_hero_axe = {
		'item_mirror_shield',
	},
	npc_dota_hero_bane = {
		'item_seer_stone',
	},
	npc_dota_hero_bounty_hunter = {
		'item_desolator_2',
	},
	npc_dota_hero_bloodseeker = {
		'item_desolator_2',
	},
	npc_dota_hero_bristleback = {
		'item_mirror_shield',
	},
	npc_dota_hero_chaos_knight = {
		'item_minotaur_horn',
	},
	npc_dota_hero_crystal_maiden = {
		'item_demonicon',
	},
	npc_dota_hero_dazzle = {
		'item_seer_stone',
	},
	npc_dota_hero_death_prophet = {
		'item_demonicon',
	},
	npc_dota_hero_dragon_knight = {
		'item_giants_ring',
	},
	npc_dota_hero_drow_ranger = {
		'item_ballista',
	},
	npc_dota_hero_earthshaker = {
		'item_giants_ring',
	},
	npc_dota_hero_jakiro = {
		'item_demonicon',
	},
	npc_dota_hero_juggernaut = {
		'item_spell_prism',
	},
	npc_dota_hero_kunkka = {
		'item_minotaur_horn',
	},
	npc_dota_hero_lich = {
		'item_demonicon',
	},
	npc_dota_hero_lina = {
		'item_demonicon',
	},
	npc_dota_hero_lion = {
		'item_seer_stone',
	},
	npc_dota_hero_luna = {
		'item_ballista',
	},
	npc_dota_hero_mirana = {
		'item_demonicon',
	},
	npc_dota_hero_nevermore = {
		'item_desolator_2',
	},
	npc_dota_hero_necrolyte = {
		'item_mirror_shield',
	},
	npc_dota_hero_ogre_magi = {
		'item_seer_stone',
	},
	npc_dota_hero_omniknight = {
		'item_mirror_shield',
	},
	npc_dota_hero_oracle = {
		'item_seer_stone',
	},
	npc_dota_hero_phantom_assassin = {
		'item_desolator_2',
	},
	npc_dota_hero_pudge = {
		'item_giants_ring',
	},
	npc_dota_hero_razor = {
		'item_spell_prism',
	},
	npc_dota_hero_riki = {
		'item_desolator_2',
	},
	npc_dota_hero_shadow_shaman = {
		'item_seer_stone',
	},
	npc_dota_hero_sand_king = {
		'item_seer_stone',
	},
	npc_dota_hero_skywrath_mage = {
		'item_seer_stone',
	},
	npc_dota_hero_sniper = {
		'item_ballista',
	},
	npc_dota_hero_sven = {
		'item_minotaur_horn',
	},
	npc_dota_hero_tidehunter = {
		'item_mirror_shield',
	},
	npc_dota_hero_tiny = {
		'item_pirate_hat',
	},
	npc_dota_hero_vengefulspirit = {
		'item_desolator_2',
	},
	npc_dota_hero_viper = {
		'item_ballista',
	},
	npc_dota_hero_warlock = {
		'item_demonicon',
	},
	npc_dota_hero_windrunner = {
		'item_desolator_2',
	},
	npc_dota_hero_witch_doctor = {
		'item_seer_stone',
	},
	npc_dota_hero_skeleton_king = {
		'item_desolator_2',
	},
	npc_dota_hero_zuus = {
		'item_seer_stone',
	},
}

-- default x1
tBotItemData.addNeutralItemMultiTimeMap = {
	x1 = {
		1800,
	},
	x5 = {
		1500,
	},
	x7_5 = {
		1200,
	},
	x10 = {
		900,
	},
	x20 = {
		300,
	},
}

