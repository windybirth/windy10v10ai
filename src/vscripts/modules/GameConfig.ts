export class GameConfig {
  constructor() {
    SendToServerConsole("dota_max_physical_items_purchase_limit 9999"); // 用来解决物品数量限制问题

    GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.GOODGUYS, 10); // 设置天辉队伍人数上限
    GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.BADGUYS, 10); // 设置夜魇队伍人数上限
    GameRules.LockCustomGameSetupTeamAssignment(false); // 锁定队伍分配
    GameRules.EnableCustomGameSetupAutoLaunch(true); // 是否自动开始游戏
    GameRules.SetCustomGameSetupAutoLaunchDelay(50); // 游戏设置时间
    GameRules.SetCustomGameSetupRemainingTime(3); // 游戏设置剩余时间
    // GameRules.SetCustomGameSetupTimeout(3); // 游戏设置阶段超时
    GameRules.SetHeroSelectionTime(45); // 选择英雄阶段的持续时间
    GameRules.SetHeroSelectPenaltyTime(15); // 选择英雄超时惩罚时间
    GameRules.SetStrategyTime(15); // 选完英雄的策略阶段的持续时间
    GameRules.SetShowcaseTime(0); // 选完英雄进游戏前的展示时间
    GameRules.SetPreGameTime(45); // 进入游戏后号角吹响前的准备时间
    // GameRules.SetPostGameTime(30); // 游戏结束后时长
    // GameRules.SetSameHeroSelectionEnabled(true); // 是否允许选择相同英雄
    // GameRules.SetStartingGold(0); // 设置初始金钱
    // GameRules.SetGoldTickTime(0); // 设置工资发放间隔
    // GameRules.SetGoldPerTick(0); // 设置工资发放数额
    // GameRules.SetHeroRespawnEnabled(false); // 是否允许英雄重生
    // GameRules.SetCustomGameAllowMusicAtGameStart(false); // 是否允许游戏开始时的音乐
    // GameRules.SetCustomGameAllowHeroPickMusic(false); // 是否允许英雄选择阶段的音乐
    // GameRules.SetCustomGameAllowBattleMusic(false); // 是否允许战斗阶段音乐
    // GameRules.SetUseUniversalShopMode(true); // 是否启用全地图商店模式（在基地也可以购买神秘商店的物品）* 这个不是设置在任何地方都可以购买，如果要设置这个，需要将购买区域覆盖全地图
    // GameRules.SetHideKillMessageHeaders(true); // 是否隐藏顶部的英雄击杀信息
    GameRules.SetCustomGameEndDelay(30);

    const game: CDOTABaseGameMode = GameRules.GetGameModeEntity();
    // game.SetRemoveIllusionsOnDeath(true); // 是否在英雄死亡的时候移除幻象
    game.SetFreeCourierModeEnabled(true); // 是否启用免费信使模式
    game.SetSelectionGoldPenaltyEnabled(false); // 是否启用选择英雄时的金钱惩罚（超时每秒扣钱）
    game.SetLoseGoldOnDeath(false); // 是否在英雄死亡时扣除金钱
    game.SetCustomBuybackCostEnabled(true); // 是否启用自定义买活价格
    // game.SetBuybackEnabled(false); // 是否允许买活
    // game.SetDaynightCycleDisabled(true); // 是否禁用白天黑夜循环
    // game.SetForceRightClickAttackDisabled(true); // 是否禁用右键攻击
    // game.SetHudCombatEventsDisabled(true); // 是否禁用战斗事件（左下角的战斗消息）
    // game.SetCustomGameForceHero(`npc_dota_hero_phoenix`); // 设置强制英雄（会直接跳过英雄选择阶段并直接为所有玩家选择这个英雄）
    // game.SetUseCustomHeroLevels(true); // 是否启用自定义英雄等级
    // game.SetCustomHeroMaxLevel(1); // 设置自定义英雄最大等级
    // game.SetCustomXPRequiredToReachNextLevel({
    //     // 设置自定义英雄每个等级所需经验，这里的经验是升级到这一级所需要的*总经验）
    //     1: 0,
    // });
    // game.SetDaynightCycleDisabled(true); // 是否禁用白天黑夜循环
    // game.SetDeathOverlayDisabled(true); // 是否禁用死亡遮罩（灰色的遮罩）

    // 设置自定义的队伍人数上限，这里的设置是10个队伍，每个队伍1人
    // GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.GOODGUYS, 1);
    // GameRules.SetCustomGameTeamMaxPlayers(DotaTeam.BADGUYS, 1);
    // for (let team = DotaTeam.CUSTOM_1; team <= DotaTeam.CUSTOM_8; ++team) {
    //     GameRules.SetCustomGameTeamMaxPlayers(team, 1);
    // }

    if (IsInToolsMode()) {
      print("[GameConfig] IsInToolsMode set");
      GameRules.SetCustomGameSetupAutoLaunchDelay(10);
      // GameRules.SetHeroSelectionTime(10);
      // GameRules.SetHeroSelectPenaltyTime(10); // 选择英雄超时惩罚时间
      GameRules.SetStrategyTime(10);
      // GameRules.SetPreGameTime(300);
    }
  }
}
