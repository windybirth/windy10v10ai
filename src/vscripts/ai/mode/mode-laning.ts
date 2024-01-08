import { BaseHeroAIModifier } from "../hero/hero-base";
import { ModeBase } from "./mode-base";
import { ModeEnum } from "./mode-enum";

export class ModeLaning extends ModeBase {
  mode: ModeEnum = ModeEnum.LANING;

  GetDesire(heroAI: BaseHeroAIModifier): number {
    // if time is less than 0:00, return 0
    const currentTime = heroAI.gameTime;
    let desire = 0;
    if (currentTime < 1) {
      desire = 0;
    } else if (currentTime < 600) {
      // 每过一分钟，减少0.1的desire
      desire = 0.7 - Math.floor(currentTime / 60) * 0.01;
    } else {
      desire = 0;
    }

    desire = Math.min(desire, 1);
    desire = Math.max(desire, 0);
    return desire;
  }
}
