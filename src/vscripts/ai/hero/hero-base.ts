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

  Init() {
    const hero = this.GetParent();
    print(`[AI] HeroBase OnCreated ${hero.GetUnitName()}`);
    // 初始化技能
    this.ability_1 = hero.GetAbilityByIndex(0);
    this.ability_2 = hero.GetAbilityByIndex(1);
    this.ability_3 = hero.GetAbilityByIndex(2);
    this.ability_4 = hero.GetAbilityByIndex(3);
    this.ability_5 = hero.GetAbilityByIndex(4);
    this.ability_utli = hero.GetAbilityByIndex(5);

    // 初始化Think
    this.StartIntervalThink(this.ThinkInterval);
  }

  Think(): void {
    if (this.NoAction()) {
      return;
    }

    this.mode = GameRules.AI.FSA.GetMode(this.mode, this.GetParent());
    print(`[AI] HeroBase Think ${this.mode}`);
  }

  NoAction(): boolean {
    if (HeroHelper.NotActionable(this.GetParent())) {
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
