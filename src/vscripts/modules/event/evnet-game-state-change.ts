import { ModifierHelper } from "../../helper/modifier-helper";

export class EventGameStateChange {
  constructor() {
    ListenToGameEvent("game_rules_state_change", () => this.OnGameStateChanged(), this);
  }

  // 游戏状态变化
  OnGameStateChanged(): void {
    const state = GameRules.State_Get();
    if (state === GameState.HERO_SELECTION) {
      // 选择英雄
      this.OnHeroSelection();
    } else if (state === GameState.PRE_GAME) {
      // 出兵前
      this.OnPreGame();
    } else if (state === GameState.GAME_IN_PROGRESS) {
      // 出兵后
      this.OnGameInProgress();
      // 等待5分钟后，给电脑加钱
      Timers.CreateTimer(5 * 60, () => {
        this.OnGameInProgress();
      });
    }
  }

  // 获取经济最高的玩家的经济
  private GetPlayerMaxGold(): number {
    let maxGold = 0;
    for (let i = 0; i < PlayerResource.GetPlayerCount(); i++) {
      if (PlayerResource.IsValidPlayer(i) && !PlayerResource.IsFakeClient(i)) {
        const gold = PlayerResource.GetGold(i);
        if (gold > maxGold) {
          maxGold = gold;
        }
      }
    }
    return maxGold;
  }

  // 计算加多少钱
  private CalculateAddGold(hero: CDOTA_BaseNPC_Hero): number {
    // 获取电脑英雄的经济
    const gold = hero.GetGold();

    const playerMaxGold = this.GetPlayerMaxGold();

    const gameTime = GameRules.GetGameTime();
    print(
      `[CalculateAddGold] gameTime: ${gameTime}, playerMaxGold: ${playerMaxGold}, gold: ${gold}`,
    );
    // 如果玩家的经济比电脑的经济高，给电脑加钱
    if (playerMaxGold > gold) {
      return playerMaxGold - gold + (playerMaxGold / gameTime) * 60;
    }
    return 1000;
  }

  // 给电脑加钱
  private AddGoldToAI(): void {
    // 获取所有AI
    for (let i = 0; i < PlayerResource.GetPlayerCount(); i++) {
      // 是电脑
      if (PlayerResource.IsValidPlayer(i) && PlayerResource.IsFakeClient(i)) {
        const botPlayer = PlayerResource.GetPlayer(i);
        if (!botPlayer) {
          continue;
        }
        const hero = botPlayer.GetAssignedHero();
        const addGold = this.CalculateAddGold(hero);
        GameRules.ModifyGoldFiltered(i, addGold, true, ModifyGoldReason.CREEP_KILL);
      }
    }

    // 每隔2分钟给电脑加钱
    Timers.CreateTimer(120, () => {
      this.AddGoldToAI();
    });
  }

  private OnGameInProgress(): void {}

  private OnHeroSelection(): void {}

  private OnPreGame(): void {
    // 初始化游戏
    print(`[EventGameStateChange] OnPreGame`);

    // 防御塔BUFF
    const towers = Entities.FindAllByClassname("npc_dota_tower") as CDOTA_BaseNPC[];
    for (const tower of towers) {
      this.addModifierToTowers(tower);
    }
    // 兵营BUFF
    const barracks = Entities.FindAllByClassname("npc_dota_barracks") as CDOTA_BaseNPC[];
    for (const barrack of barracks) {
      this.addModifierToTowers(barrack);
    }
    const healer = Entities.FindAllByClassname("npc_dota_healer") as CDOTA_BaseNPC[];
    for (const heal of healer) {
      this.addModifierToTowers(heal);
    }

    // 基地BUFF
    const bases = Entities.FindAllByClassname("npc_dota_fort") as CDOTA_BaseNPC[];
    for (const base of bases) {
      this.addModifierToTowers(base);
    }
  }

  private addModifierToTowers(building: CDOTA_BaseNPC) {
    // 防御塔攻击
    let towerPower = GameRules.GameConfig.towerPower;

    // 1塔最高200%攻击
    const towerName = building.GetName();
    if (towerName.includes("tower1")) {
      if (towerPower > 200) {
        towerPower = 200;
      }
    }
    ModifierHelper.applyGlobalModifier(building, `modifier_global_tower_power_${towerPower}`);

    // 防御塔回血
    const towerHeal = GameRules.GameConfig.towerHeal;
    ModifierHelper.applyGlobalModifier(building, `modifier_global_tower_heal_${towerHeal}`);
  }
}
