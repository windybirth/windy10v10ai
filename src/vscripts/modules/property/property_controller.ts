import type { PlayerProperty } from "../../api/player";
import {
  property_attackspeed_bonus_constant,
  property_attack_range_bonus,
  property_cannot_miss,
  property_cast_range_bonus_stacking,
  property_cooldown_percentage,
  property_health_regen_percentage,
  property_ignore_movespeed_limit,
  property_incoming_damage_percentage,
  property_lifesteal,
  property_magical_resistance_bonus,
  property_mana_regen_total_percentage,
  property_movespeed_bonus_constant,
  property_physical_armor_bonus,
  property_preattack_bonus_damage,
  property_spell_amplify_percentage,
  property_spell_lifesteal,
  property_stats_agility_bonus,
  property_stats_intellect_bonus,
  property_stats_strength_bonus,
  property_status_resistance_stacking,
  property_evasion_constant,
} from "../../modifiers/property/property_declare";

export class PropertyController {
  private static propertyValuePerLevel = new Map<string, number>();
  private static propertyDataDrivenName = new Map<string, string>();
  constructor() {
    print("PropertyController init");
    PropertyController.propertyValuePerLevel.set(property_cooldown_percentage.name, 4);
    PropertyController.propertyValuePerLevel.set(property_cast_range_bonus_stacking.name, 25);
    PropertyController.propertyValuePerLevel.set(property_spell_amplify_percentage.name, 5);
    PropertyController.propertyValuePerLevel.set(property_status_resistance_stacking.name, 4);
    PropertyController.propertyValuePerLevel.set(property_evasion_constant.name, 4);
    PropertyController.propertyValuePerLevel.set(property_magical_resistance_bonus.name, 4);
    PropertyController.propertyValuePerLevel.set(property_incoming_damage_percentage.name, -4);
    PropertyController.propertyValuePerLevel.set(property_attack_range_bonus.name, 25);
    PropertyController.propertyValuePerLevel.set(property_health_regen_percentage.name, 0.3);
    PropertyController.propertyValuePerLevel.set(property_mana_regen_total_percentage.name, 0.3);
    PropertyController.propertyValuePerLevel.set(property_lifesteal.name, 10);
    PropertyController.propertyValuePerLevel.set(property_spell_lifesteal.name, 8);
    PropertyController.propertyValuePerLevel.set(property_ignore_movespeed_limit.name, 0.125);
    PropertyController.propertyValuePerLevel.set(property_cannot_miss.name, 0.125);

    // multi level property must end with '_level_'
    PropertyController.propertyDataDrivenName.set(
      property_movespeed_bonus_constant.name,
      "modifier_player_property_movespeed_bonus_constant_level_",
    );

    PropertyController.propertyDataDrivenName.set(
      property_physical_armor_bonus.name,
      "modifier_player_property_physical_armor_bonus_level_",
    );
    PropertyController.propertyDataDrivenName.set(
      property_preattack_bonus_damage.name,
      "modifier_player_property_preattack_bonus_damage_level_",
    );
    PropertyController.propertyDataDrivenName.set(
      property_attackspeed_bonus_constant.name,
      "modifier_player_property_attackspeed_bonus_constant_level_",
    );
    PropertyController.propertyDataDrivenName.set(
      property_stats_strength_bonus.name,
      "modifier_player_property_stats_strength_bonus_level_",
    );
    PropertyController.propertyDataDrivenName.set(
      property_stats_agility_bonus.name,
      "modifier_player_property_stats_agility_bonus_level_",
    );
    PropertyController.propertyDataDrivenName.set(
      property_stats_intellect_bonus.name,
      "modifier_player_property_stats_intellect_bonus_level_",
    );
  }

  public static addModifier(hero: CDOTA_BaseNPC_Hero, property: PlayerProperty) {
    const propertyValuePerLevel = PropertyController.propertyValuePerLevel.get(property.name);
    if (propertyValuePerLevel) {
      const value = propertyValuePerLevel * property.level;
      if (value != 0) {
        hero.RemoveModifierByName(property.name);
        hero.AddNewModifier(hero, undefined, property.name, {
          value,
        });
      }
    } else {
      const dataDrivenName = PropertyController.propertyDataDrivenName.get(property.name);
      if (dataDrivenName) {
        this.refreshDataDrivenPlayerProperty(hero, dataDrivenName, property.level);
      }
    }
  }

  public static RefreshPlayerProperty(property: PlayerProperty) {
    for (let i = 0; i < PlayerResource.GetPlayerCount(); i++) {
      if (PlayerResource.IsValidPlayer(i)) {
        const steamId = PlayerResource.GetSteamAccountID(i);
        if (steamId == property.steamId) {
          const hero = PlayerResource.GetSelectedHeroEntity(i);
          if (hero) {
            PropertyController.addModifier(hero, property);
          }
        }
      }
    }
  }

  private static refreshPlayerPropertyWhereLevelUp(keys: DotaPlayerGainedLevelEvent) {
    const hero = EntIndexToHScript(keys.hero_entindex) as CDOTA_BaseNPC_Hero;
    const level = keys.level;
    const dataDrivenNameList = ["modifier_player_property_movespeed_bonus_constant_level_"];
    for (const dataDrivenName of dataDrivenNameList) {
      // TODO check level
      this.refreshDataDrivenPlayerProperty(hero, dataDrivenName, level);
    }
  }

  private static refreshDataDrivenPlayerProperty(
    hero: CDOTA_BaseNPC_Hero,
    dataDrivenName: string,
    level: number,
  ) {
    if (level == 0) {
      return;
    }

    if (dataDrivenName.endsWith("_level_")) {
      // for 1-8 level
      for (let i = 1; i <= 8; i++) {
        hero.RemoveModifierByName(`${dataDrivenName}${i}`);
      }
      dataDrivenName = dataDrivenName + level;
    } else {
      hero.RemoveModifierByName(dataDrivenName);
    }

    const modifierItem = CreateItem(
      "item_player_modifiers",
      undefined,
      undefined,
    ) as CDOTA_Item_DataDriven;
    modifierItem.ApplyDataDrivenModifier(hero, hero, dataDrivenName, {
      duration: -1,
    });
    UTIL_RemoveImmediate(modifierItem);
  }
}