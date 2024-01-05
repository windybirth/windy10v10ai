import { BaseModifier, registerModifier } from "../../utils/dota_ts_adapter";

@registerModifier()
export class BaseHeroAIModifier extends BaseModifier {
  protected ability_1: CDOTABaseAbility | undefined;
  protected ability_2: CDOTABaseAbility | undefined;
  protected ability_3: CDOTABaseAbility | undefined;
  protected ability_4: CDOTABaseAbility | undefined;
  protected ability_5: CDOTABaseAbility | undefined;
  protected ability_6: CDOTABaseAbility | undefined;
  // modifier functions
  OnCreated() {
    print(`[AI] HeroBase OnCreated ${this.GetParent().GetUnitName()}`);
    // init abilities
    this.ability_1 = this.GetParent().FindAbilityByName("ability_1");
    this.ability_2 = this.GetParent().FindAbilityByName("ability_2");
    this.ability_3 = this.GetParent().FindAbilityByName("ability_3");
    this.ability_4 = this.GetParent().FindAbilityByName("ability_4");
    this.ability_5 = this.GetParent().FindAbilityByName("ability_5");
    this.ability_6 = this.GetParent().FindAbilityByName("ability_6");
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
