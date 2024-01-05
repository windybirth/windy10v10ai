import { BaseHeroAIModifier } from "./hero/hero-base";

export class AI {
  constructor() {
    // TODO set timer to update AI
  }

  // enable AI for hero
  static EnableAI(hero: CDOTA_BaseNPC_Hero) {
    if (hero.HasModifier(BaseHeroAIModifier.name)) {
      // remove old modifier
      print(`[AI] EnableAI RemoveModifierByName ${hero.GetUnitName()}`);
      hero.RemoveModifierByName(BaseHeroAIModifier.name);
    }
    hero.AddNewModifier(hero, undefined, BaseHeroAIModifier.name, {});
  }
}
