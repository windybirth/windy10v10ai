import { BaseModifier, registerModifier } from "../../utils/dota_ts_adapter";
import { ModeEnum } from "../mode/mode-enum";
import { HeroHelper } from "./hero-helper";

@registerModifier()
export class BaseHeroAIModifier extends BaseModifier {
  // FIXME: 为了方便测试，这里设置为2秒
  protected readonly ThinkInterval: number = 2;
  // 当前状态
  protected mode: ModeEnum = ModeEnum.RUNE;

  // 技能
  protected ability_1: CDOTABaseAbility | undefined;
  protected ability_2: CDOTABaseAbility | undefined;
  protected ability_3: CDOTABaseAbility | undefined;
  protected ability_4: CDOTABaseAbility | undefined;
  protected ability_5: CDOTABaseAbility | undefined;
  protected ability_utli: CDOTABaseAbility | undefined;

  protected hero: CDOTA_BaseNPC_Hero;
  protected heroState = {
    currentHealth: 0,
    maxHealth: 0,
    currentMana: 0,
    maxMana: 0,
    currentLevel: 0,
  };

  protected aroundEnemyHeroes: CDOTA_BaseNPC[] = [];
  protected aroundEnemyCreeps: CDOTA_BaseNPC[] = [];
  protected aroundEnemyTowers: CDOTA_BaseNPC[] = [];

  Init() {
    this.hero = this.GetParent() as CDOTA_BaseNPC_Hero;
    print(`[AI] HeroBase OnCreated ${this.hero.GetUnitName()}`);
    // 初始化技能
    this.ability_1 = this.hero.GetAbilityByIndex(0);
    this.ability_2 = this.hero.GetAbilityByIndex(1);
    this.ability_3 = this.hero.GetAbilityByIndex(2);
    this.ability_4 = this.hero.GetAbilityByIndex(3);
    this.ability_5 = this.hero.GetAbilityByIndex(4);
    this.ability_utli = this.hero.GetAbilityByIndex(5);

    // 初始化Think
    this.StartIntervalThink(this.ThinkInterval);
  }

  Think(): void {
    if (this.NoAction()) {
      return;
    }

    this.mode = GameRules.AI.FSA.GetMode(this.mode, this.hero);
  }

  NoAction(): boolean {
    if (HeroHelper.NotActionable(this.hero)) {
      return true;
    }

    return false;
  }

  // ---------------------------------------------------------
  // DotaModifierFunctions
  // ---------------------------------------------------------
  // modifier functions
  OnCreated() {
    if (IsClient()) {
      return;
    }

    const delay = RandomFloat(3, 4);
    print(`[AI] HeroBase OnCreated delay ${delay}`);
    Timers.CreateTimer(delay, () => {
      this.Init();
    });
  }

  OnIntervalThink(): void {
    this.Think();
  }

  IsPurgable(): boolean {
    return false;
  }

  RemoveOnDeath(): boolean {
    return false;
  }

  IsHidden(): boolean {
    return true;
  }
}
