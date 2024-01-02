import { Player } from "../../api/player";
import { Helper } from "../helper/helper";
import { PropertyController } from "../property/property_controller";

export class Event {
  constructor() {
    ListenToGameEvent("dota_player_gained_level", (keys) => this.OnPlayerLevelUp(keys), this);
    //  OnNPCSpawned
    ListenToGameEvent("npc_spawned", (keys) => this.OnNpcSpawned(keys), this);
  }

  OnPlayerLevelUp(keys: GameEventProvidedProperties & DotaPlayerGainedLevelEvent): void {
    PropertyController.RefreshPlayerPropertyWhereLevelUp(keys);
  }

  OnNpcSpawned(keys: GameEventProvidedProperties & NpcSpawnedEvent): void {
    if (GameRules.State_Get() < GameState.PRE_GAME) {
      Timers.CreateTimer(1, () => {
        this.OnNpcSpawned(keys);
      });
      return;
    }

    const npc = EntIndexToHScript(keys.entindex) as CDOTA_BaseNPC | undefined;
    if (!npc) {
      return;
    }

    if (keys.is_respawn == 0) {
      // is human player
      if (Helper.IsHumanPlayer(npc)) {
        Player.InitPlayerProperty(npc as CDOTA_BaseNPC_Hero);
      }
    }
  }
}
