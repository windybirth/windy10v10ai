GameUI.CustomUIConfig().multiteam_top_scoreboard = {
  shouldSort: false,
};
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_SHOP_SUGGESTEDITEMS, true);
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_HEROES, false );
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_FLYOUT_SCOREBOARD, false);
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ENDGAME, false);
// Fix for Valve overlay covering team select
function UpdateHeroSelection() {
  if (Game.GameStateIsBefore(DOTA_GameState.DOTA_GAMERULES_STATE_HERO_SELECTION)) {
    $.GetContextPanel().GetParent().GetParent().FindChild("PreGame").visible = false;
  } else if (Game.GameStateIs(DOTA_GameState.DOTA_GAMERULES_STATE_HERO_SELECTION)) {
    $.GetContextPanel().GetParent().GetParent().FindChild("PreGame").visible = true;
  } else if (Game.GameStateIs(DOTA_GameState.DOTA_GAMERULES_STATE_PRE_GAME)) {
    $.GetContextPanel().GetParent().GetParent().FindChild("PreGame").visible = false;
  }
}
(function () {
  GameEvents.Subscribe("game_rules_state_change", UpdateHeroSelection);
})();
