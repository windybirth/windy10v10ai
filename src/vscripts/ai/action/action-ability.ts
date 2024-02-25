import { BaseHeroAIModifier } from "../hero/hero-base";

export interface CastCoindition {
  target?: {
    healthPercentLessThan?: number;
  };
  self?: {
    healthPercentMoreThan?: number;
  };
}

export class ActionAbility {
  static CastAbilityOnEnemyHero(
    ai: BaseHeroAIModifier,
    ability: CDOTABaseAbility | undefined,
    condition?: CastCoindition,
  ): boolean {
    if (!ability) {
      return false;
    }

    if (!ability.IsFullyCastable()) {
      return false;
    }

    if (ai.FindNearestEnemyHero() === undefined) {
      return false;
    }

    const hero = ai.GetHero();

    const enemies = FindUnitsInRadius(
      hero.GetTeamNumber(),
      hero.GetAbsOrigin(),
      undefined,
      this.GetFullCastRange(hero, ability),
      UnitTargetTeam.ENEMY,
      UnitTargetType.HERO,
      UnitTargetFlags.NONE,
      FindOrder.ANY,
      false,
    );
    if (enemies.length === 0) {
      return false;
    }
    const target = enemies[0];

    if (condition) {
      if (this.IsConditionBreak(condition, hero, target)) {
        return false;
      }
    }

    return this.CastAbilityOnEnemy(hero, ability, target);
  }

  protected static CastAbilityOnEnemy(
    self: CDOTA_BaseNPC_Hero,
    ability: CDOTABaseAbility,
    target: CDOTA_BaseNPC,
  ): boolean {
    print(`[AI] CastAbilityOnEnemy ${ability.GetAbilityName()} on ${target.GetUnitName()}`);
    // if ability is point target
    if (this.IsAbilityBehavior(ability, AbilityBehavior.UNIT_TARGET)) {
      print(`[AI] CastAbilityOnEnemy ${ability.GetAbilityName()} on target`);
      self.CastAbilityOnTarget(target, ability, self.GetPlayerOwnerID());
      return true;
    } else if (this.IsAbilityBehavior(ability, AbilityBehavior.POINT)) {
      print(`[AI] CastAbilityOnEnemy ${ability.GetAbilityName()} on point`);
      self.CastAbilityOnPosition(target.GetAbsOrigin(), ability, self.GetPlayerOwnerID());
      return true;
    } else if (this.IsAbilityBehavior(ability, AbilityBehavior.AOE)) {
      print(`[AI] CastAbilityOnEnemy ${ability.GetAbilityName()} on position`);
      self.CastAbilityOnPosition(target.GetAbsOrigin(), ability, self.GetPlayerOwnerID());
      return true;
    }

    return false;
  }

  /**
   * @return 施法距离 + 施法距离加成
   */
  public static GetFullCastRange(self: CDOTA_BaseNPC_Hero, ability: CDOTABaseAbility): number {
    const range = ability.GetCastRange(self.GetAbsOrigin(), undefined);
    const castRangeIncrease = self.GetCastRangeBonus();
    return range + castRangeIncrease;
  }

  private static IsAbilityBehavior(ability: CDOTABaseAbility, behavior: AbilityBehavior): boolean {
    const abilityBehavior = ability.GetBehavior() as number;
    // check is behavior bit set in abilityBehavior
    const isBitSet = (abilityBehavior & behavior) === behavior;
    return !!isBitSet;
  }

  private static IsConditionBreak(
    condition: CastCoindition,
    self: CDOTA_BaseNPC_Hero,
    target: CDOTA_BaseNPC,
  ): boolean {
    if (condition.self) {
      if (condition.self.healthPercentMoreThan) {
        if (self.GetHealthPercent() < condition.self.healthPercentMoreThan) {
          return true;
        }
      }
    }
    if (condition.target) {
      if (condition.target.healthPercentLessThan) {
        if (target.GetHealthPercent() > condition.target.healthPercentLessThan) {
          return true;
        }
      }
    }

    return false;
  }
}
