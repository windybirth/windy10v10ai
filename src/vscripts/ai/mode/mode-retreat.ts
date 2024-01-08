import { BaseHeroAIModifier } from "../hero/hero-base";
import { ModeBase } from "./mode-base";
import { ModeEnum } from "./mode-enum";

export class ModeRetreat extends ModeBase {
  mode: ModeEnum = ModeEnum.RETREAT;

  GetDesire(heroAI: BaseHeroAIModifier): number {
    const curretHealthPercentage = heroAI.Hero.GetHealthPercent();
    // 血量低于50%时，desire从0开始递增至1
    let desire = 0;
    if (curretHealthPercentage < 50) {
      desire = 1 - curretHealthPercentage / 50;
    }
    return desire;
  }
}
