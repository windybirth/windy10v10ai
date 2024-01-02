import { PropertyController } from "../property/property_controller";

export class Event {
  constructor() {
    ListenToGameEvent("dota_player_gained_level", (keys) => this.OnPlayerLevelUp(keys), this);
  }

  OnPlayerLevelUp(keys: GameEventProvidedProperties & DotaPlayerGainedLevelEvent): void {
    PropertyController.refreshPlayerPropertyWhereLevelUp(keys);
  }
}
