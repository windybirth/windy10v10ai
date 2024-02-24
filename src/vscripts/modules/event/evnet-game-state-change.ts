export class EventGameStateChange {
  constructor() {
    ListenToGameEvent("game_rules_state_change", () => this.OnGameStateChanged(), this);
  }

  OnGameStateChanged(): void {
    const state = GameRules.State_Get();
    if (state === GameState.GAME_IN_PROGRESS) {
    }
  }
}
