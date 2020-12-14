"use strict";

function CheckForHostPrivileges() {
	var player_info = Game.GetLocalPlayerInfo();
	if ( !player_info ) {
		return undefined;
	} else {
		return player_info.player_has_host_privileges;
	}
}

function InitializeUI(keys) {
	if (keys.PlayerID != Game.GetLocalPlayerID()) {return}
	var is_host = CheckForHostPrivileges();
	if (is_host === undefined) {
		$.Schedule(1, InitializeUI);
		return;
	} else if (is_host) {
		$("#game_options_container").style.visibility='visible';
		$.GetContextPanel().GetParent().GetParent().FindChildTraverse("LoadingScreenChat").visible=false;
		$("#ChatHideButtonShow").visible=true;
	} else {
		$("#ChatHideButtonHide").visible=true;
	}
	// Hides battlecuck crap
	var hit_test_blocker = $.GetContextPanel().GetParent().FindChild("SidebarAndBattleCupLayoutContainer");
	if (hit_test_blocker) {
		hit_test_blocker.hittest = false;
		hit_test_blocker.hittestchildren = false;
	}
	var iScreenWidth = 	Game.GetScreenWidth()
	var iScreenHeight = Game.GetScreenHeight()
	if (iScreenWidth/iScreenHeight < (16/10+4/3)/2){
		$("#ChatHideButtonContainer").SetHasClass("ChatHideButtonContainerPos4_3", true);
	}
	else if ((iScreenWidth/iScreenHeight < (16/10+16/9)/2)){
		$("#ChatHideButtonContainer").SetHasClass("ChatHideButtonContainerPos16_10", true);
	}
	else {
		$("#ChatHideButtonContainer").SetHasClass("ChatHideButtonContainerPos16_9", true);
	}
}

function HideChatTeamActivate() {
	$.GetContextPanel().GetParent().GetParent().FindChildTraverse("LoadingScreenChat").visible=false;

	$("#ChatHideButtonHide").visible=false;
	$("#ChatHideButtonShow").visible=true;
	GameEvents.SendCustomGameEventToAllClients("LoadingScreenTeamHide", {iPlayerID:Players.GetLocalPlayer()});
}

function ShowChatTeamActivate() {
	$.GetContextPanel().GetParent().GetParent().FindChildTraverse("LoadingScreenChat").visible=true;
	$("#ChatHideButtonHide").visible=true;
	$("#ChatHideButtonShow").visible=false;
	GameEvents.SendCustomGameEventToAllClients("LoadingScreenTeamShow", {iPlayerID:Players.GetLocalPlayer()});
}

$("#radiant_player_number_dropdown").SetSelected("5");
$("#dire_player_number_dropdown").SetSelected("10");
$("#radiant_tower_power_dropdown").SetSelected("4");
$("#dire_tower_power_dropdown").SetSelected("6");
$("#radiant_tower_endure_dropdown").SetSelected("4");
$("#dire_tower_endure_dropdown").SetSelected("5");
$("#max_level_dropdown").SetSelected("50");
$("#radiant_tower_heal_dropdown").SetSelected("10");
$("#dire_tower_heal_dropdown").SetSelected("10");
$("#same_hero_selection").checked=true;
$("#fast_courier").checked=true;

function StateChange() {
	if ( Game.GameStateIs(DOTA_GameState.DOTA_GAMERULES_STATE_HERO_SELECTION) ) {
		GameEvents.SendCustomGameEventToServer("loading_set_options",{
			"host_privilege": CheckForHostPrivileges(),
			"game_options":{
				"radiant_gold_multiplier": $("#radiant_gold_multiplier_dropdown").GetSelected().id,
				"dire_gold_multiplier": $("#dire_gold_multiplier_dropdown").GetSelected().id,
				"radiant_xp_multiplier": $("#radiant_xp_multiplier_dropdown").GetSelected().id,
				"dire_xp_multiplier": $("#dire_xp_multiplier_dropdown").GetSelected().id,
				"radiant_player_number": $("#radiant_player_number_dropdown").GetSelected().id,
				"dire_player_number": $("#dire_player_number_dropdown").GetSelected().id,
				"respawn_time_percentage": $("#respawn_time_percentage_dropdown").GetSelected().id,
				"radiant_tower_power": $("#radiant_tower_power_dropdown").GetSelected().id,
				"dire_tower_power": $("#dire_tower_power_dropdown").GetSelected().id,
				"radiant_tower_endure": $("#radiant_tower_endure_dropdown").GetSelected().id,
				"dire_tower_endure": $("#dire_tower_endure_dropdown").GetSelected().id,
				"radiant_tower_heal": $("#radiant_tower_heal_dropdown").GetSelected().id,
				"dire_tower_heal": $("#dire_tower_heal_dropdown").GetSelected().id,
				"max_level": $("#max_level_dropdown").GetSelected().id,
				"same_hero_selection": $("#same_hero_selection").checked,
				"fast_courier": $("#fast_courier").checked
			}
		});
	}
}

GameEvents.Subscribe( "player_connect_full", InitializeUI);
GameEvents.Subscribe( "game_rules_state_change", StateChange);
