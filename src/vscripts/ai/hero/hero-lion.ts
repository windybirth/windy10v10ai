import { registerModifier } from "../../utils/dota_ts_adapter";
import { ActionAbility } from "../action/action-ability";
import { BaseHeroAIModifier } from "./hero-base";

@registerModifier()
export class LionAIModifier extends BaseHeroAIModifier {
  override UseAbilityEnemy(): boolean {
    if (ActionAbility.CastAbilityOnEnemyHero(this, this.ability_2)) {
      return true;
    }
    if (ActionAbility.CastAbilityOnEnemyHero(this, this.ability_1)) {
      return true;
    }
    if (ActionAbility.CastAbilityOnEnemyHero(this, this.ability_3)) {
      return true;
    }
    if (
      ActionAbility.CastAbilityOnEnemyHero(this, this.ability_utli, {
        target: { healthPercentLessThan: 80 },
      })
    ) {
      return true;
    }
    return false;
  }
}
