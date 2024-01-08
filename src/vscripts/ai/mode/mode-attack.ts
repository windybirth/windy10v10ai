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
          print("distanceToTowerRange: " + distanceToTowerRange);
          if (distanceToTowerRange > 200) {
            desire += 0.8;
          }
        } else {
          print("no nearest tower");
          desire += 0.8;
        }
      }
    }
    return desire;
  }
}
