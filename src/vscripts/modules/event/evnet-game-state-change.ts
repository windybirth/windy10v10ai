import { ModifierHelper } from "../../helper/modifier-helper";

export class EventGameStateChange {
  constructor() {
    ListenToGameEvent("game_rules_state_change", () => this.OnGameStateChanged(), this);
  }

  OnGameStateChanged(): void {
    const state = GameRules.State_Get();
    if (state === GameState.GAME_IN_PROGRESS) {
      this.OnGameInProgress();
    } else if (state === GameState.HERO_SELECTION) {
      this.OnHeroSelection();
    } else if (state === GameState.PRE_GAME) {
      this.OnPreGame();
    }
  }

  private OnGameInProgress(): void {}

  private OnHeroSelection(): void {}

  private OnPreGame(): void {
    // 初始化游戏
    print(`[EventGameStateChange] OnPreGame`);
    const towerPower = GameRules.GameConfig.towerPower;
    // 防御塔BUFF
    const towers = Entities.FindAllByClassname("npc_dota_tower") as CDOTA_BaseNPC[];
    for (const tower of towers) {
      const towerName = tower.GetName();
      let modifierName = `modifier_global_tower_power_${towerPower}`;
      if (towerName.includes("tower1")) {
        if (towerPower > 200) {
          modifierName = `modifier_global_tower_power_200`;
        }
      }

      print(`[EventGameStateChange] OnPreGame ${modifierName}`);
      ModifierHelper.applyGlobalModifier(tower, modifierName);
    }
    // 基地BUFF
    const bases = Entities.FindAllByClassname("npc_dota_fort") as CDOTA_BaseNPC[];
    for (const base of bases) {
      ModifierHelper.applyGlobalModifier(base, `modifier_global_tower_power_${towerPower}`);
    }
  }
}
