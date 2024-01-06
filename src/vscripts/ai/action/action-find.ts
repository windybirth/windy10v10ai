export class ActionFind {
  static FindEnemyHero(self: CDOTA_BaseNPC_Hero, range: number): CDOTA_BaseNPC_Hero | undefined {
    const enemies = FindUnitsInRadius(
      self.GetTeamNumber(),
      self.GetAbsOrigin(),
      undefined,
      range,
      UnitTargetTeam.ENEMY,
      UnitTargetType.HERO,
      UnitTargetFlags.FOW_VISIBLE + UnitTargetFlags.NO_INVIS,
      FindOrder.CLOSEST,
      false,
    );

    if (enemies.length > 0) {
      return enemies[0] as CDOTA_BaseNPC_Hero;
    }

    return undefined;
  }

  static FindEnemyCreep(
    self: CDOTA_BaseNPC_Hero,
    range: number,
  ): CDOTA_BaseNPC_Creature | undefined {
    const enemies = FindUnitsInRadius(
      self.GetTeamNumber(),
      self.GetAbsOrigin(),
      undefined,
      range,
      UnitTargetTeam.ENEMY,
      UnitTargetType.BASIC,
      UnitTargetFlags.FOW_VISIBLE + UnitTargetFlags.NO_INVIS,
      FindOrder.CLOSEST,
      false,
    );

    if (enemies.length > 0) {
      return enemies[0] as CDOTA_BaseNPC_Creature;
    }

    return undefined;
  }

  static FindEnemyBuilding(self: CDOTA_BaseNPC_Hero): CDOTA_BaseNPC_Building | undefined {
    const enemies = this.FindEnemies(self, 1600, UnitTargetType.BUILDING);

    if (enemies.length > 0) {
      return enemies[0] as CDOTA_BaseNPC_Building;
    }

    return undefined;
  }

  static FindEnemies(
    self: CDOTA_BaseNPC_Hero,
    radius: number,
    typeFilter: UnitTargetType,
  ): CDOTA_BaseNPC[] {
    const enemies = FindUnitsInRadius(
      self.GetTeamNumber(),
      self.GetAbsOrigin(),
      undefined,
      radius,
      UnitTargetTeam.ENEMY,
      typeFilter,
      UnitTargetFlags.FOW_VISIBLE + UnitTargetFlags.NO_INVIS,
      FindOrder.CLOSEST,
      false,
    );

    return enemies;
  }
}
