const memberHeroNames = [
	"brewmaster",
	"chen",
	"phantom_lancer",
]

const seasonLevel20HeroNames = [
	"dark_seer",
]

const interval = 0.03;

const random_button = FindDotaHudElement("RandomButton");
let random_pressed = false;
let member = GetMember();
let player = GetPlayer();

(() => {
	PickLockerLoop();
})();


function PickLockerLoop() {
	if (Game.GameStateIsBefore( DOTA_GameState.DOTA_GAMERULES_STATE_PRE_GAME )) {
		$.Schedule( interval, PickLocker );
	}
}

function PickRandomHero() {
	$.Msg("Random hero pressed");
	// discard random requests if we've already pressed that or have hero selected
	if (random_pressed || Players.GetSelectedHeroID(Players.GetLocalPlayer()) != -1) return;
	random_pressed = true;
	// GameEvents.SendCustomGameEventToServer("pick_random_hero", {});
}

function PickLocker() {
	const possible_hero_selection =  Game.GetLocalPlayerInfo().possible_hero_selection;

	if (memberHeroNames.includes(possible_hero_selection)) {
		if(isMember()) {
			unlockHero();
		} else {
			lockMemberHero();
		}
	} else if (seasonLevel20HeroNames.includes(possible_hero_selection)) {
		if(isSeasonLevel20()) {
			unlockHero();
		} else {
			lockSeasonLevel20Hero();
		}
	} else {
		unlockHero();
	}

	PickLockerLoop();
}

function unlockHero() {
	$.Msg("Unlock hero Pick");
	const pick_button = FindDotaHudElement("LockInButton");
	pick_button.enabled = true;
	pick_button.SetAcceptsFocus(true);
	pick_button.BAcceptsInput(true);
	pick_button.style.saturation = null;
	pick_button.style.brightness = null;

	let label = pick_button.GetChild(0);
	label.text = $.Localize("#DOTA_Hero_Selection_LOCKIN");
	label.style.fontSize = 20;
}

function lockMemberHero() {
	$.Msg("Lock Member hero Pick");
	const pick_button = FindDotaHudElement("LockInButton");
	pick_button.enabled = false;
	pick_button.SetAcceptsFocus(false);
	pick_button.BAcceptsInput(false);
	pick_button.style.saturation = 0.0;
	pick_button.style.brightness = 0.2;

	let label = pick_button.GetChild(0);
	label.text = $.Localize("#pick_button_member_text");
	label.style.fontSize = 20;
}


function lockSeasonLevel20Hero() {
	$.Msg("Lock Season Level 20 hero Pick");
	const pick_button = FindDotaHudElement("LockInButton");
	pick_button.enabled = false;
	pick_button.SetAcceptsFocus(false);
	pick_button.BAcceptsInput(false);
	pick_button.style.saturation = 0.0;
	pick_button.style.brightness = 0.2;

	let label = pick_button.GetChild(0);
	label.text = $.Localize("#pick_button_season_level20_text");
	label.style.fontSize = 16;
}

function isMember() {
	if (!member) {
		member = GetMember();
	}
	if (member && member.enable) {
		return true;
	} else {
		return false;
	}
}

function isSeasonLevel20() {
	if (!player) {
		player = GetPlayer();
	}
	$.Msg("Player Season Level: ", player?.seasonLevel);
	if (player && player.seasonLevel >= 20) {
		return true;
	} else {
		return false;
	}
}
