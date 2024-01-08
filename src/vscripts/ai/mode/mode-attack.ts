import { ActionAttack } from "../action/action-attack";
import { BaseHeroAIModifier } from "../hero/hero-base";
import { ModeBase } from "./mode-base";
import { ModeEnum } from "./mode-enum";

export class ModeAttack extends ModeBase {
  mode: ModeEnum = ModeEnum.ATTACK;

  GetDesire(heroAI: BaseHeroAIModifier): number {
    let desire = 0;
    const dotaTime = heroAI.gameTime;

    if (heroAI.mode === ModeEnum.RETREAT) {
      desire -= 0.4;
    }
    if (heroAI.mode === ModeEnum.ATTACK) {
      desire += 0.1;
    }

    if (dotaTime < 1) {
      // 0:00
      const nearestHero = heroAI.FindNearestEnemyHero();
      if (nearestHero) {
        const nearestTower = heroAI.FindNearestEnemyBuildingsInvulnerable();
        if (nearestTower) {
          const distanceToTowerRange = ActionAttack.GetDistanceToAttackRange(
            nearestTower,
            heroAI.GetHero(),
          );
          if (distanceToTowerRange > 400) {
            desire += 0.61;
          }
        } else {
          desire += 0.65;
        }
      }
    }
    return desire;
  }
}
