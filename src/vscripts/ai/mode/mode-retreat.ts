import { ActionAttack } from "../action/action-attack";
import { BaseHeroAIModifier } from "../hero/hero-base";
import { ModeBase } from "./mode-base";
import { ModeEnum } from "./mode-enum";

export class ModeRetreat extends ModeBase {
  mode: ModeEnum = ModeEnum.RETREAT;

  GetDesire(heroAI: BaseHeroAIModifier): number {
    let desire = 0;
    if (heroAI.mode === ModeEnum.RETREAT) {
      desire += 0.4;
    }

    // 血量减少时，desire从0开始递增至1
    const curretHealthPercentage = heroAI.GetHero().GetHealthPercent();
    desire = (100 - curretHealthPercentage) / 100;

    // 游戏开始前，在防御塔攻击范围内，desire为1
    if (heroAI.gameTime < 300) {
      const nearestTower = heroAI.FindNearestEnemyBuildingsInvulnerable();
      if (nearestTower) {
        const distanceThanRange = ActionAttack.GetDistanceToAttackRange(
          nearestTower,
          heroAI.GetHero(),
        );

        const towerBufferRange = 200;
        const distanceThanRangeWithBuffer = distanceThanRange - towerBufferRange;

        // 靠近防御塔攻击范围+200以内时，每减少100，desire增加0.1
        if (distanceThanRangeWithBuffer <= 0) {
          desire += Math.floor(distanceThanRangeWithBuffer / 100) * 0.1;
        }
        // 防御塔攻击范围内时，desire额外增加0.5
        if (distanceThanRange <= 0) {
          desire += 0.5;
        }
      }
    }

    return desire;
  }
}
