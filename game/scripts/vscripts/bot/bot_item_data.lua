--[[ ============================================================================================================
	Author: Windy
	Date: September 14, 2021
================================================================================================================= ]]
tBotItemData = {}

-- purchase item in order
tBotItemData.purchaseItemList = {
	npc_dota_hero_abaddon = {
		'item_magic_wand',
		'item_boots',
		'item_bracer',
		'item_holy_locket',
		'item_bracer',
		'item_vanguard',
		'item_blade_mail',
		'item_platemail',
		'item_recipe_blade_mail_2',
		'item_falcon_blade',	-- 猎鹰战刃
		'item_echo_sabre',
		'item_blink',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_ultimate_scepter_2',
		'item_shivas_guard_2',
		'item_black_king_bar_2',
		'item_vladmir_2',
		'item_insight_armor',
		'item_saint_orb',
		'item_moon_shard_datadriven',
		'item_jump_jump_jump',
	},
	npc_dota_hero_arc_warden = {
		'item_wings_of_haste',
		'item_lesser_crit',
		'item_maelstrom',
		'item_rod_of_atos',
		'item_recipe_gungir',
		'item_butterfly',
		'item_ultimate_scepter',
		'item_octarine_core',
		'item_aether_lens_2',
		'item_recipe_wasp_callous',
		'item_black_king_bar',
		'item_mjollnir',
		'item_recipe_gungir_2',
		'item_recipe_arcane_octarine_core',
		'item_monkey_king_bar',
		'item_javelin',
		'item_javelin',
		'item_recipe_monkey_king_bar_2',
		'item_recipe_ultimate_scepter_2',
		'item_sheepstick',
		'item_black_king_bar_2',
		'item_excalibur',
		'item_wasp_despotic',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_ethereal_blade',
		'item_null_talisman',
		'item_recipe_necronomicon_staff',
	},
	npc_dota_hero_axe = {
		'item_magic_wand',
		'item_boots',
		'item_bracer',
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
		'item_saint_orb',
		'item_undying_heart',
		'item_moon_shard_datadriven',
		'item_abyssal_blade_v2',
		'item_jump_jump_jump',
	},
	npc_dota_hero_spectre = {
		'item_magic_wand',
		'item_boots',
		'item_bracer',
		'item_power_treads',
		'item_bracer',
		'item_vanguard',
		'item_blade_mail',
		'item_platemail',
		'item_recipe_blade_mail_2',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_reaver',
		'item_ultimate_scepter_2',
		'item_undying_heart',
		'item_shivas_guard_2',
		'item_saint_orb',
		'item_blue_fantasy',
		'item_jump_jump_jump',
		'item_moon_shard_datadriven',
	},
	npc_dota_hero_bane = {
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_aether_lens_2',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter_2',
		'item_aeon_pendant',
		'item_gungir_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_necronomicon_staff',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_hallowed_scepter',
		'item_shivas_guard_2',
	},
	npc_dota_hero_bounty_hunter = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_power_treads',
		'item_orb_of_corrosion',
		'item_wings_of_haste',
		'item_sange_and_yasha',
		'item_echo_sabre_2',
		-- 'item_aghanims_shard',
		'item_infernal_desolator',
		'item_ultimate_scepter_2',
		'item_wasp_callous',
		'item_blue_fantasy',
		'item_undying_heart',
		'item_abyssal_blade_v2',
		'item_excalibur',
		'item_wasp_despotic',
	},
	npc_dota_hero_bloodseeker = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_quelling_blade_2_datadriven',
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
		'item_boots',
		'item_wraith_band',
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
		'item_heavens_halberd_v2',
		'item_insight_armor',
		'item_ultimate_scepter_2',
		'item_saint_orb',
		'item_undying_heart',
		'item_moon_shard_datadriven',
		'item_sacred_six_vein',
	},
	npc_dota_hero_chaos_knight = {
		'item_magic_wand',
		'item_boots',
		'item_quelling_blade_2_datadriven',
		'item_bracer',
		'item_power_treads',
		'item_bracer',
		'item_armlet',
		'item_echo_sabre',
		'item_falcon_blade',
		'item_wings_of_haste',
		'item_sange_and_yasha',
		'item_aghanims_shard',
		'item_vladmir_2',
		'item_ultimate_scepter_2',
		'item_insight_armor',
		'item_undying_heart',
		'item_infernal_desolator',
		'item_moon_shard_datadriven',
		'item_abyssal_blade_v2',
		'item_excalibur',
	},
	npc_dota_hero_crystal_maiden = {
		-- 出门装
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
		-- 过度
		'item_glimmer_cape',
		'item_phase_boots',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aether_lens_2',
		'item_aghanims_shard',
		'item_orb_of_the_brine',
		'item_sheepstick',
		'item_black_king_bar',
		'item_ultimate_scepter_2',
		'item_octarine_core',
		-- 最终装备
		'item_recipe_arcane_octarine_core',
		'item_black_king_bar_2',
		'item_aeon_pendant',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_necronomicon_staff',
		'item_hallowed_scepter',
	},
	npc_dota_hero_dazzle = {
		-- 出门装
		'item_magic_wand',
		'item_boots',
		'item_holy_locket',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_orb_of_the_brine',
		'item_sheepstick',

		-- 最终装备
		'item_aether_lens_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_aeon_pendant',

		'item_dagon_5',
		'item_necronomicon_staff',
		'item_gungir_2',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_ultimate_scepter_2',
		'item_hallowed_scepter',
	},
	npc_dota_hero_death_prophet = {
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_shivas_guard_2',
		'item_sheepstick',
		'item_aether_lens_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_dagon_5',
		'item_aeon_pendant',
		'item_ultimate_scepter_2',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_necronomicon_staff',
		'item_hallowed_scepter',
		'item_sacred_six_vein',
	},
	npc_dota_hero_dragon_knight = {
		'item_magic_wand',
		'item_boots',
		'item_bracer',
		'item_armlet',
		'item_bracer',
		'item_power_treads',
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
		'item_wasp_despotic',
		'item_moon_shard_datadriven',
		'item_wasp_callous',
		'item_jump_jump_jump',
		'item_excalibur',
	},
	npc_dota_hero_drow_ranger = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_wraith_band',
		'item_wraith_band',
		'item_power_treads',
		'item_mask_of_madness',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_hurricane_pike_2',
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
		'item_boots',
		'item_bracer',
		'item_bracer',
		'item_arcane_boots',
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
		'item_boots',
		'item_null_talisman',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_aether_lens_2',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_dagon_5',
		'item_shivas_guard_2',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_hallowed_scepter',
		'item_necronomicon_staff',
	},
	npc_dota_hero_juggernaut = {
		'item_magic_wand',
		'item_boots',
		'item_quelling_blade_2_datadriven',
		'item_wraith_band',
		'item_wraith_band',
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
		'item_boots',
		'item_bracer',
		'item_bracer',
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
		'item_boots',
		'item_null_talisman',
		'item_null_talisman',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_aether_lens_2',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_sheepstick',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_gungir_2',
		'item_shivas_guard_2',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_hallowed_scepter',
		'item_necronomicon_staff',
	},
	npc_dota_hero_lina = {
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_aether_lens_2',
		'item_octarine_core',
		'item_sacred_trident',
		'item_recipe_arcane_octarine_core',
		'item_gungir_2',
		'item_hallowed_scepter',
		'item_necronomicon_staff',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_shivas_guard_2',
		'item_sacred_trident',
	},
	npc_dota_hero_lion = {
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_blink',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_mystic_staff',
		'item_recipe_arcane_blink',
		'item_aether_lens_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_dagon_5',
		'item_gungir_2',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_hallowed_scepter',
		'item_necronomicon_staff',
	},
	npc_dota_hero_luna = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_wraith_band',
		'item_power_treads',
		'item_wraith_band',
		'item_mask_of_madness',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_hurricane_pike_2',
		'item_monkey_king_bar_2',
		'item_ultimate_scepter_2',
		'item_satanic',
		'item_infernal_desolator',
		'item_wasp_callous',
		'item_skadi_2',
		'item_wasp_despotic',
		'item_satanic',
	},
	npc_dota_hero_medusa = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_wraith_band',
		'item_wraith_band',
		'item_power_treads',
		'item_mask_of_madness',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_wings_of_haste',
		'item_skadi',
		'item_hurricane_pike_2',
		'item_butterfly',
		'item_recipe_ultimate_scepter_2',
		'item_lesser_crit',
		'item_infernal_desolator',
		'item_black_king_bar_2',
		'item_recipe_wasp_callous',
		'item_wasp_despotic',
		'item_skadi_2',
		'item_excalibur',
	},
	npc_dota_hero_meepo = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_wraith_band',
		'item_power_treads',
		'item_orb_of_corrosion',
		'item_falcon_blade',
		'item_aghanims_shard',
		'item_bfury',
		'item_echo_sabre',
		'item_wings_of_haste',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_yasha_and_kaya',
		'item_black_king_bar_2',
		'item_infernal_desolator',
		'item_wasp_callous',
		'item_moon_shard_datadriven',
		'item_abyssal_blade_v2',
		'item_wasp_despotic',
		'item_bfury_2',
		'item_jump_jump_jump',
	},
	-- 未启用
	npc_dota_hero_mirana = {
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_dagon_5',
		'item_arcane_octarine_core',
		'item_hallowed_scepter',
		'item_necronomicon_staff',
	},
	npc_dota_hero_nevermore = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_null_talisman',
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
		'item_boots',
		'item_null_talisman',
		'item_null_talisman',
		'item_holy_locket',
		'item_arcane_boots',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_sheepstick',
		'item_octarine_core',
		'item_aether_lens_2',
		'item_recipe_arcane_octarine_core',
		'item_shivas_guard_2',
		'item_undying_heart',
		'item_saint_orb',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_necronomicon_staff',
		'item_sacred_six_vein',
	},
	npc_dota_hero_ogre_magi = {
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
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
		'item_mystic_staff',
		'item_recipe_arcane_blink',
		'item_aether_lens_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_dagon_5',
		'item_hallowed_scepter',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_necronomicon_staff',
	},
	npc_dota_hero_omniknight = {
		'item_magic_wand',
		'item_boots',
		'item_holy_locket',
		'item_arcane_boots',
		'item_vanguard',
		'item_glimmer_cape',
		'item_echo_sabre_2',
		'item_orb_of_the_brine',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_aeon_pendant',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_octarine_core',
		'item_aether_lens_2',
		'item_recipe_arcane_octarine_core',
		'item_saint_orb',
		'item_insight_armor',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_heavens_halberd_v2',
	},
	npc_dota_hero_oracle = {
		'item_magic_wand',
		'item_boots',
		'item_holy_locket',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_rod_of_atos',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_orb_of_the_brine',
		'item_ultimate_scepter_2',
		'item_gungir_2',
		'item_aeon_pendant',
		'item_arcane_octarine_core',
		'item_shivas_guard_2',
		'item_necronomicon_staff',
		'item_refresher',
		'item_recipe_refresh_core',
	},
	npc_dota_hero_phantom_assassin = {
		-- 出门装
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_power_treads',
		'item_wraith_band',
		-- 过度装
		'item_orb_of_corrosion',
		'item_falcon_blade',
		'item_echo_sabre',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_desolator',
		-- 最终装备
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
		'item_boots',
		'item_bracer',
		'item_bracer',
		'item_arcane_boots',
		'item_vanguard',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_blade_mail_2',
		'item_blink',
		'item_eternal_shroud',
		'item_aether_lens_2',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_ultimate_scepter_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_saint_orb',
		'item_undying_heart',
		'item_shivas_guard_2',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_moon_shard_datadriven',
		'item_abyssal_blade_v2',
	},
	-- 未启用
	npc_dota_hero_razor = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_wraith_band',
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
		'item_boots',
		'item_wraith_band',
		'item_wraith_band',
		'item_power_treads',
		'item_wraith_band',
		'item_falcon_blade',	-- 猎鹰战刃
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
		'item_boots',
		'item_null_talisman',
		'item_holy_locket',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_aghanims_shard',
		'item_wings_of_haste',
		'item_blink',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_mystic_staff',
		'item_recipe_arcane_blink',
		'item_aeon_pendant',
		'item_aether_lens_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_refresher',
		'item_black_king_bar_2',
		'item_necronomicon_staff',
		"item_jump_jump_jump",
		'item_recipe_refresh_core',
	},
	npc_dota_hero_sand_king = {
		'item_magic_wand',
		'item_boots',
		'item_bracer',
		'item_quelling_blade_2_datadriven',
		'item_bracer',
		'item_holy_locket',
		'item_arcane_boots',
		'item_aether_lens_2',
		'item_blink',
		'item_blade_mail_2',
		'item_saint_orb',
		'item_shivas_guard_2',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_black_king_bar_2',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_undying_heart',
		'item_sheepstick',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_moon_shard_datadriven',
		'item_jump_jump_jump',
		'item_necronomicon_staff',
	},
	npc_dota_hero_skywrath_mage = {
		'item_tango',
		'item_clarity',
		'item_enchanted_mango',
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
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
		'item_necronomicon_staff',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_bloodstone_v2',
	},
	npc_dota_hero_sniper = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_wraith_band',
		'item_power_treads',
		'item_mask_of_madness',
		'item_maelstrom',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_hurricane_pike_2',
		'item_ultimate_scepter_2',
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
		'item_boots',
		'item_bracer',
		'item_quelling_blade_2_datadriven',
		'item_power_treads',
		'item_vanguard',		-- 先锋盾
		'item_falcon_blade',	-- 猎鹰战刃
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
		'item_boots',
		'item_bracer',
		'item_quelling_blade_2_datadriven',
		'item_bracer',
		'item_power_treads',
		'item_bracer',
		'item_echo_sabre',
		'item_armlet',
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
		'item_saint_orb',
		'item_moon_shard_datadriven',
		'item_blue_fantasy',
		'item_jump_jump_jump',
	},
	npc_dota_hero_tinker = {
		'item_clarity',
		'item_clarity',
		'item_boots',
		'item_null_talisman',
		'item_kaya',
		'item_glimmer_cape',
		'item_blink',
		'item_tome_of_knowledge',
		'item_aether_lens_2',
		'item_aghanims_shard',
		'item_dagon',
		'item_phylactery',
		'item_ghost',
		'item_recipe_ethereal_blade',
		'item_recipe_dagon',
		'item_recipe_dagon',
		'item_recipe_dagon',
		'item_recipe_dagon',
		'item_sheepstick',
		'item_mystic_staff',
		'item_recipe_arcane_blink',
		'item_ultimate_scepter',
		'item_necronomicon_staff',
		'item_recipe_ultimate_scepter_2',
		'item_wings_of_haste',
		'item_hallowed_scepter',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_refresher',
		'item_recipe_refresh_core',
	},
	npc_dota_hero_tiny = {
		'item_magic_wand',
		'item_boots',
		'item_bracer',
		'item_quelling_blade_2_datadriven',
		'item_power_treads',
		'item_vanguard',		-- 先锋盾
		'item_falcon_blade',	-- 猎鹰战刃
		'item_blink',
		'item_reaver',
		'item_recipe_overwhelming_blink',
		'item_wings_of_haste',
		'item_echo_sabre',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_black_king_bar_2',
		'item_vladmir_2',
		'item_moon_shard_datadriven',
		'item_saint_orb',
		'item_undying_heart',
		'item_wasp_despotic',
		'item_wasp_callous',
		'item_jump_jump_jump',
	},
	-- 未启用
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
		'item_boots',
		'item_falcon_blade',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_desolator',
		'item_hurricane_pike_2',
		'item_ultimate_scepter_2',
		'item_monkey_king_bar_2',
		'item_wasp_callous',
		'item_infernal_desolator',
		'item_skadi_2',
		'item_vladmir_2',
		'item_wasp_despotic',
	},
	npc_dota_hero_viper = {
		'item_magic_wand',
		'item_boots',
		'item_wraith_band',
		'item_wraith_band',
		'item_power_treads',
		'item_vanguard',		-- 先锋盾
		'item_falcon_blade',	-- 猎鹰战刃
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_sange_and_yasha',
		'item_hurricane_pike_2',
		'item_ultimate_scepter_2',
		'item_monkey_king_bar_2',
		'item_shotgun_v2',
		'item_wasp_callous',
		'item_black_king_bar_2',
		'item_wasp_despotic',
		'item_excalibur',
	},
	npc_dota_hero_warlock = {
		'item_magic_wand',
		'item_boots',
		'item_holy_locket',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_orb_of_the_brine',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_sheepstick',
		'item_arcane_octarine_core',
		'item_dagon_5',
		'item_hallowed_scepter',
		'item_refresher',
		'item_shivas_guard_2',
		'item_recipe_refresh_core',
	},
	npc_dota_hero_windrunner = {
		'item_magic_wand',
		'item_boots',
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
		'item_boots',
		'item_null_talisman',
		'item_null_talisman',
		'item_holy_locket',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_wings_of_haste',
		'item_aghanims_shard',
		'item_aether_lens_2',
		'item_ultimate_scepter',
		'item_recipe_ultimate_scepter_2',
		'item_orb_of_the_brine',
		'item_sheepstick',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_black_king_bar_2',
		'item_gungir_2',
		'item_refresher',
		'item_recipe_refresh_core',
		'item_hallowed_scepter',
		'item_necronomicon_staff',
	},
	npc_dota_hero_zuus = {
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
		'item_null_talisman',
		'item_glimmer_cape',
		'item_arcane_boots',
		'item_aghanims_shard',
		'item_ultimate_scepter',
		'item_aether_lens_2',
		'item_wings_of_haste',
		'item_octarine_core',
		'item_recipe_arcane_octarine_core',
		'item_recipe_ultimate_scepter_2',
		'item_refresher',
		'item_dagon_5',
		'item_hallowed_scepter',
		'item_recipe_refresh_core',
		'item_gungir_2',
		'item_necronomicon_staff',
	},
}


-- sell item if has more than 8 item
-- same item only need set once
tBotItemData.sellItemList = {
	npc_dota_hero_abaddon = {
		'item_vanguard',
		'item_overwhelming_blink',
		'item_echo_sabre_2',
		-- local
	},
	npc_dota_hero_arc_warden = {
		'item_black_king_bar',
		'item_monkey_king_bar_2',
	},
	npc_dota_hero_axe = {
		'item_vanguard',
		'item_overwhelming_blink',

		-- local
	},
	npc_dota_hero_spectre = {
		'item_vanguard',
		'item_reaver',
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
	},
	npc_dota_hero_lina = {
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
	npc_dota_hero_medusa = {
		'item_mask_of_madness',
	},
	npc_dota_hero_meepo = {
		'item_wraith_band',
		'item_power_treads',
		'item_echo_sabre_2',
		'item_bfury',
		'item_yasha_and_kaya',
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
	},
	npc_dota_hero_ogre_magi = {
		'item_overwhelming_blink',
	},
	npc_dota_hero_omniknight = {
		'item_vanguard',
		'item_echo_sabre_2',
	},
	npc_dota_hero_oracle = {
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
		'item_sange_and_yasha',
		'item_echo_sabre_2',
		'item_bfury',
	},
	npc_dota_hero_shadow_shaman = {
		'item_magic_wand',
		'item_boots',
		'item_null_talisman',
		'item_arcane_boots',
		'item_glimmer_cape',
		'item_force_staff',
		'item_arcane_blink',
	},
	npc_dota_hero_sand_king = {
		'item_overwhelming_blink',
		'item_blade_mail_2',
		'item_saint_orb',
	},
	npc_dota_hero_skywrath_mage = {
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
	},
	npc_dota_hero_windrunner = {
		'item_desolator',
	},
	npc_dota_hero_witch_doctor = {
		'item_arcane_boots',
		'item_rod_of_atos',
	},
	npc_dota_hero_skeleton_king = {
		'item_armlet',
		'item_heavens_halberd',
		'item_sange_and_yasha',
		'item_echo_sabre_2',
		'item_overwhelming_blink',
	},
	npc_dota_hero_tinker = {
		'item_force_staff_3',
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

	-- 补刀斧
	'item_quelling_blade',
	-- 毒瘤之刃
	'item_quelling_blade_2_datadriven',
	'item_circlet',
	'item_mantle',
	'item_sobi_mask',
	'item_ring_of_protection',
	'item_recipe_ring_of_basilius',
	'item_ring_of_basilius',

	-- 草鞋
	'item_boots',

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
	-- 纷争
	'item_veil_of_discord',
	-- 吹风
	'item_cyclone',

	-- 推推棒
	'item_force_staff',
	-- 微光
	'item_glimmer_cape',
	-- 回音刃
	'item_echo_sabre_2',

	-- 圣洁吊坠
	'item_holy_locket',
	-- 黯灭
	'item_desolator',
	-- BKB
	'item_black_king_bar',
	-- 笛子
	'item_pipe',
	-- 龙心
	'item_heart',
	-- 狂战斧
	'item_bfury',
	-- 羊刀
	'item_sheepstick',
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
	'item_tome_of_luoshu',
}
-- ward setting
tBotItemData.wardHeroList = Set {
	'npc_dota_hero_bane',
	'npc_dota_hero_bounty_hunter',
	'npc_dota_hero_crystal_maiden',
	'npc_dota_hero_pudge',
	'npc_dota_hero_sand_king',
	'npc_dota_hero_lich',
	'npc_dota_hero_lion',
	'npc_dota_hero_witch_doctor',
	'npc_dota_hero_warlock',
	'npc_dota_hero_ogre_magi',
	'npc_dota_hero_oracle',
	'npc_dota_hero_shadow_shaman',
	'npc_dota_hero_necrolyte',
	'npc_dota_hero_dazzle',
	'npc_dota_hero_death_prophet',
	'npc_dota_hero_jakiro',
	'npc_dota_hero_lina',
	'npc_dota_hero_omniknight',
	'npc_dota_hero_riki',
	'npc_dota_hero_sand_king',
	'npc_dota_hero_windrunner'
}

tBotItemData.wardObserverPostionList = {
	-- 天辉

	-- 上路
	Vector(-5856, 827, 0),
	Vector(2106,6046,0),
	Vector(-1998,6113,0),
	-- 上野区
	Vector(-5187, -1619, 0),
	Vector(-4640,-1056,0),
	Vector(-4574, 476, 0),
	Vector(-3815, 1577, 256),
	Vector(-4620,-1060,384),
	Vector(0,2598,256),
	-- 中路
	Vector(-1445,-2504,0),
	Vector(-4526.85,-5406.58,0),
	Vector(-5916,-3984,0),
	Vector(-6657,-4427,256),
	Vector(-5017,-6268,0),
	Vector(-3545,-6958,0),
	Vector(1037,-2023,0),
	Vector(1290,842,0),
	Vector(-2567,-1743,0),
	-- 下野区
	Vector(2800, -3087, 0),
	Vector(303, -2584, 0),
	Vector(-510, -3334, 0),
	Vector(1556, -3169, 0),
	Vector(-1233, -5087, 0),
	Vector(187, -4970, 0),
	Vector(3941,-4017,0),
	Vector(594,-4149,0),
	Vector(3876,-4138,0),
	Vector(1321.6,-2288,256),
	Vector(1045,-2041,128),
	-- 下路
	Vector(3443, -5779, 0),
	Vector(4445, -5124, 0),
	Vector(6318,-1038,0),

	-- 中路河道
	Vector(-1625, -200, 0),
	Vector(74, -1320, 0),
	Vector(-519, 605, 0),
	Vector(-820, -1921, 0),
	-- roshan
	Vector(-2142, 1776, 0),
	Vector(-3790,1583,0),
	Vector(-2675,3296,0),

	-- 夜魇

	-- 上路
	-- 上野区
	Vector(-758, 2033, 0),
	Vector(-512, 4094, 0),
	Vector(-2813, 3593, 0),
	Vector(-844, 3131, 0),
	Vector(-1040,4370,0),
	Vector(4488,1319,0),
	Vector(3825,4127,0),
	Vector(1082,4354.0),
	Vector(-3804,4120,0),
	-- 中路
	Vector(2190,4065,0),
	Vector(4861,5994,0),
	Vector(6319,4319,0),
	Vector(1739,1264),
	-- 下野区
	Vector(2050, -761, 0),
	Vector(2781, -1575, 0),
	Vector(4612, 768, 0),
	Vector(4024, -1056, 0),
	Vector(3923, -3441, 0),
	Vector(3240.6,196.2,0),
	Vector(4517,1319,0),
	Vector(3298,-181,256),
	Vector(6287,-1011,0),
	-- 下路
}
tBotItemData.wardSentryPostionList = {

	-- deward

	-- 天辉

	-- 上路
	Vector(-6586, -2440, 0),
	Vector(2106,6046,0),
	Vector(-1998,6113,0),
	-- 上野区
	Vector(-4347, -1028, 0),
	-- 中路
	Vector(-4511, -2582, 0),
	Vector(-3345, -4005, 0),
	Vector(-6119,-6403,0),
	Vector(-7036,-5603,0),
	Vector(-2073,-2417,0),
	Vector(1290,842,0),
	Vector(1739,1264,0),
	Vector(-2567,-1743,0),
	-- 下野区
	Vector(303, -2584, 0),
	Vector(-510, -3334, 0),
	Vector(1279, -5118, 0),
	Vector(-1233, -5087, 0),
	Vector(3239, -4273, 0),
	Vector(4540, -4320, 0),
	Vector(2671, -3418, 0),
	-- 下路
	Vector(-2945, -6087, 0),
	Vector(5664, -4000, 0),
	Vector(6435, -5472, 0),

	-- 中路河道
	Vector(-1625, -200, 0),
	Vector(74, -1320, 0),
	Vector(-519, 605, 0),
	-- roshan
	Vector(-2142, 1776, 0),
	Vector(-2273, 2628, 0),
	Vector(-3308, 3020, 0),



	-- 夜魇
	Vector(5251, 2947, 0),
	Vector(3493, 4632, 0),
	Vector(4861,5994,0),
	Vector(6319,4319,0),

	-- 上路
	Vector(-3300, 5608, 0),
	Vector(-5735, 4089, 0),
	Vector(3825,4127,0),
	-- 上野区
	Vector(-396, 2521, 0),
	Vector(512, 4094, 0),
	-- 中路
	Vector(-1611, 1155, 0),
	-- 下野区
	Vector(4490, -1907, 0),
	Vector(2686, -828, 0),
	Vector(4612, 768, 0),
	Vector(4359, -426, 0),
	-- 下路
	Vector(6342, 1735, 0),
	Vector(6318,-1038),
}
-- purchase neutral item in order
tBotItemData.addNeutralItemList = {
	npc_dota_hero_abaddon = {
		'item_mirror_shield',
	},
	npc_dota_hero_arc_warden = {
		'item_ballista',
	},
	npc_dota_hero_axe = {
		'item_timeless_relic',
	},
	npc_dota_hero_spectre = {
		'item_force_field',
	},
	npc_dota_hero_bane = {
		'item_seer_stone',
	},
	npc_dota_hero_bounty_hunter = {
		'item_desolator_2',
	},
	npc_dota_hero_bloodseeker = {
		'item_pirate_hat',
	},
	npc_dota_hero_bristleback = {
		'item_giants_ring',
	},
	npc_dota_hero_chaos_knight = {
		'item_the_leveller',
	},
	npc_dota_hero_crystal_maiden = {
		'item_timeless_relic',
	},
	npc_dota_hero_dazzle = {
		'item_spell_prism',
	},
	npc_dota_hero_death_prophet = {
		'item_demonicon',
	},
	npc_dota_hero_dragon_knight = {
		'item_force_field',
	},
	npc_dota_hero_drow_ranger = {
		'item_princes_knife',
	},
	npc_dota_hero_earthshaker = {
		'item_giants_ring',
	},
	npc_dota_hero_jakiro = {
		'item_demonicon',
	},
	npc_dota_hero_juggernaut = {
		'item_ninja_gear',
	},
	npc_dota_hero_kunkka = {
		'item_minotaur_horn',
	},
	npc_dota_hero_lich = {
		'item_demonicon',
	},
	npc_dota_hero_lina = {
		'item_spell_prism',
	},
	npc_dota_hero_lion = {
		'item_timeless_relic',
	},
	npc_dota_hero_luna = {
		'item_ballista',
	},
	npc_dota_hero_medusa = {
		'item_ballista',
	},
	npc_dota_hero_meepo = {
		'item_minotaur_horn',
	},
	npc_dota_hero_mirana = {
		'item_ballista',
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
		'item_giants_ring',
	},
	npc_dota_hero_oracle = {
		'item_spell_prism',
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
	npc_dota_hero_sand_king = {
		'item_giants_ring',
	},
	npc_dota_hero_shadow_shaman = {
		'item_seer_stone',
	},
	npc_dota_hero_skywrath_mage = {
		'item_seer_stone',
	},
	npc_dota_hero_sniper = {
		'item_ballista',
	},
	npc_dota_hero_sven = {
		'item_pirate_hat',
	},
	npc_dota_hero_tidehunter = {
		'item_mirror_shield',
	},
	npc_dota_hero_tinker = {
		'item_seer_stone',
	},
	npc_dota_hero_tiny = {
		'item_pirate_hat',
	},
	npc_dota_hero_vengefulspirit = {
		'item_desolator_2',
	},
	npc_dota_hero_viper = {
		'item_princes_knife',
	},
	npc_dota_hero_warlock = {
		'item_demonicon',
	},
	npc_dota_hero_windrunner = {
		'item_ballista',
	},
	npc_dota_hero_witch_doctor = {
		'item_spy_gadget',
	},
	npc_dota_hero_skeleton_king = {
		'item_the_leveller',
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
	x8 = {
		1200,
	},
	x10 = {
		900,
	},
	x20 = {
		600,
	},
}

