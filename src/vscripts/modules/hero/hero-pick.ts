import { PlayerHelper } from "../../helper/player-helper";

export class HeroPick {
  static PickHumanHeroes() {
    PlayerHelper.ForEachPlayer((playerId) => {
      if (PlayerHelper.IsHumanPlayerByPlayerId(playerId)) {
        if (PlayerResource.HasSelectedHero(playerId)) {
          return;
        }
        PlayerResource.GetPlayer(playerId)?.MakeRandomHeroSelection();
      }
    });
  }

  static PickBotHeroes() {
    math.randomseed(GameRules.GetGameTime());

    let nameList = HeroPick.BotNameList;
    if (GameRules.Option.gameDifficulty === 6) {
      nameList = HeroPick.BotNameN6List;
    }

    const radiantPlayerNumberCurrent = PlayerResource.GetPlayerCountForTeam(DotaTeam.GOODGUYS);
    const direPlayerNumberCurrent = PlayerResource.GetPlayerCountForTeam(DotaTeam.BADGUYS);

    const radiantBotNumber = GameRules.Option.radiantPlayerNumber - radiantPlayerNumberCurrent;
    const direBotNumberNumber = GameRules.Option.direPlayerNumber - direPlayerNumberCurrent;

    print(`radiantBotNumber: ${radiantBotNumber}`);
    print(`direBotNumberNumber: ${direBotNumberNumber}`);

    // 移除玩家已经选择的英雄
    PlayerHelper.ForEachPlayer((playerId) => {
      if (PlayerHelper.IsHumanPlayerByPlayerId(playerId)) {
        const heroName = PlayerResource.GetSelectedHeroName(playerId);
        const index = nameList.indexOf(heroName);
        if (index >= 0) {
          nameList.splice(index, 1);
        }
      }
    });

    for (let i = 0; i < direBotNumberNumber; i++) {
      const name = HeroPick.GetHeroName(nameList);
      Tutorial.AddBot(name, "", "unfair", false);
    }

    for (let i = 0; i < radiantBotNumber; i++) {
      const name = HeroPick.GetHeroName(nameList);
      Tutorial.AddBot(name, "", "unfair", true);
    }

    GameRules.GetGameModeEntity().SetBotThinkingEnabled(true);
    Tutorial.StartTutorialMode();

    // 添加金钱
    PlayerHelper.ForEachPlayer((playerId) => {
      if (!PlayerHelper.IsHumanPlayerByPlayerId(playerId)) {
        const startGold = GameRules.Option.startingGoldBot;
        PlayerResource.SetGold(playerId, startGold - 600, true);
      }
    });
  }

  static GetHeroName(nameList: string[]): string {
    if (nameList.length === 0) {
      // 如果没有英雄了，就随机一个，不过这个应该不会发生
      print("[ERROR] nameList is empty");
      return "npc_dota_hero_nevermore";
    }
    const i = math.random(0, nameList.length - 1);
    const name = nameList[i];
    nameList.splice(i, 1);
    return name;
  }

  static BotNameList = [
    //"npc_dota_hero_invoker",
    //"npc_dota_hero_antimage", // 不会放技能，只会物品和A人
    //"npc_dota_hero_spirit_breaker", // 不会放技能，只会物品和A人
    //"npc_dota_hero_silencer", // 不会放技能，只会物品和A人
    //"npc_dota_hero_mirana", // 不会放技能，只会物品和A人
    //"npc_dota_hero_furion", // 不会放技能，只会物品和A人
    //"npc_dota_hero_huskar", // 不会放技能，只会物品和A人
    //"npc_dota_hero_batrider",
    //"npc_dota_hero_obsidian_destroyer",
    //"npc_dota_hero_enchantress",
    //"npc_dota_hero_snapfire",
    //"npc_dota_hero_broodmother",
    //"npc_dota_hero_lycan",
    //"npc_dota_hero_arc_warden",
    //"npc_dota_hero_ancient_apparition",
    //"npc_dota_hero_treant",
    //"npc_dota_hero_rubick",
    //"npc_dota_hero_shredder",
    //"npc_dota_hero_razor", // 在泉水站着完全不动
    //"npc_dota_hero_tidehunter", // 在泉水站着完全不动
    "npc_dota_hero_tinker",
    "npc_dota_hero_abaddon",
    "npc_dota_hero_axe",
    "npc_dota_hero_bane",
    "npc_dota_hero_bounty_hunter",
    "npc_dota_hero_bloodseeker",
    "npc_dota_hero_bristleback",
    "npc_dota_hero_chaos_knight",
    "npc_dota_hero_crystal_maiden",
    "npc_dota_hero_dazzle",
    "npc_dota_hero_death_prophet",
    "npc_dota_hero_dragon_knight",
    "npc_dota_hero_drow_ranger",
    "npc_dota_hero_earthshaker",
    "npc_dota_hero_jakiro",
    "npc_dota_hero_juggernaut",
    "npc_dota_hero_kunkka",
    "npc_dota_hero_lich",
    "npc_dota_hero_lina",
    "npc_dota_hero_lion",
    "npc_dota_hero_luna",
    "npc_dota_hero_medusa",
    // "npc_dota_hero_meepo",
    "npc_dota_hero_necrolyte",
    "npc_dota_hero_nevermore",
    "npc_dota_hero_ogre_magi",
    "npc_dota_hero_omniknight",
    "npc_dota_hero_oracle",
    "npc_dota_hero_phantom_assassin",
    "npc_dota_hero_pudge",
    "npc_dota_hero_riki",
    "npc_dota_hero_sand_king",
    "npc_dota_hero_shadow_shaman",
    "npc_dota_hero_skywrath_mage",
    "npc_dota_hero_sniper",
    "npc_dota_hero_spectre",
    "npc_dota_hero_sven",
    "npc_dota_hero_tiny",
    "npc_dota_hero_vengefulspirit",
    "npc_dota_hero_viper",
    "npc_dota_hero_warlock",
    "npc_dota_hero_windrunner",
    "npc_dota_hero_witch_doctor",
    "npc_dota_hero_skeleton_king",
    "npc_dota_hero_zuus",
  ];

  static BotNameN6List = [
    "npc_dota_hero_medusa",
    "npc_dota_hero_abaddon",
    "npc_dota_hero_drow_ranger",
    "npc_dota_hero_necrolyte",
    "npc_dota_hero_omniknight",
    "npc_dota_hero_viper",
    "npc_dota_hero_spectre",
    "npc_dota_hero_bristleback",
    "npc_dota_hero_skeleton_king",
    // "npc_dota_hero_meepo",
    "npc_dota_hero_sniper",
    "npc_dota_hero_death_prophet",
    "npc_dota_hero_chaos_knight",
    "npc_dota_hero_lina",
    "npc_dota_hero_kunkka",
    "npc_dota_hero_dragon_knight",
    "npc_dota_hero_shadow_shaman",
    "npc_dota_hero_lich",
    "npc_dota_hero_warlock",
    "npc_dota_hero_crystal_maiden",

    "npc_dota_hero_zuus",
    "npc_dota_hero_oracle",
  ];
}
