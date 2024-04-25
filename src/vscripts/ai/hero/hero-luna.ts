import { registerModifier } from "../../utils/dota_ts_adapter";
import { ActionAbility } from "../action/action-ability";
import { BaseHeroAIModifier } from "./hero-base";

@registerModifier()
export class LunaAIModifier extends BaseHeroAIModifier {
  override UseAbilityEnemy(): boolean {
    // 环绕月刃
    if (
      ActionAbility.CastAbilityOnEnemyHero(this, "luna_moon_glaive", {
        self: { healthPercentMoreThan: 1, hasshard: true },
      })
    ) {
      return true;
    }
    return false;
  }
}
