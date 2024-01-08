import { BaseHeroAIModifier } from "../hero/hero-base";
import { ModeBase } from "./mode-base";
import { ModeEnum } from "./mode-enum";
import { ModeLaning } from "./mode-laning";
import { ModePush } from "./mode-push";
import { ModeRetreat } from "./mode-retreat";
import { ModeRune } from "./mode-rune";

export class FSA {
  // 切换模式的阈值
  public static readonly MODE_SWITCH_THRESHOLD = 0.6;

  ModeList: ModeBase[] = [];
  constructor() {
    this.ModeList.push(new ModeRune());
    this.ModeList.push(new ModeLaning());
    this.ModeList.push(new ModePush());
    this.ModeList.push(new ModeRetreat());
  }

  GetMode(heroAI: BaseHeroAIModifier): ModeEnum {
    const currentMode = heroAI.GetMode();
    let maxDesire = 0;
    let desireMode: ModeEnum | undefined;
    for (const mode of this.ModeList) {
      if (mode.mode === currentMode) {
        continue;
      }

      const desire = mode.GetDesire(heroAI);
      if (desire > maxDesire) {
        maxDesire = desire;
        desireMode = mode.mode;
      }
    }

    if (maxDesire > FSA.MODE_SWITCH_THRESHOLD) {
      print(`[AI] hero ${heroAI.GetHero().GetUnitName()} desire to switch mode to ${desireMode}`);
      return desireMode!;
    } else {
      return currentMode;
    }
  }
}
