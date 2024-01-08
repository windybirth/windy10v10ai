import { BaseModifier, registerModifier } from "../../utils/dota_ts_adapter";
import { ActionAttack } from "../action/action-attack";
import { ActionFind } from "../action/action-find";
import { ActionMove } from "../action/action-move";
import { ModeEnum } from "../mode/mode-enum";
import { HeroUtil } from "./hero-util";

@registerModifier()
export class BaseHeroAIModifier extends BaseModifier {
  protected readonly ThinkInterval: number = 0.3;
  protected readonly ThinkIntervalTool: number = 0.3;

  protected readonly FindRadius: number = 1600;

  protected hero: CDOTA_BaseNPC_Hero;
  public GetHero(): CDOTA_BaseNPC_Hero {
    return this.hero;
  }

  // 当前状态
  protected mode: ModeEnum = ModeEnum.RUNE;
  public GetMode(): ModeEnum {
    return this.mode;
  }

  // 技能
  protected ability_1: CDOTABaseAbility | undefined;
  protected ability_2: CDOTABaseAbility | undefined;
  protected ability_3: CDOTABaseAbility | undefined;
  protected ability_4: CDOTABaseAbility | undefined;
  protected ability_5: CDOTABaseAbility | undefined;
  protected ability_utli: CDOTABaseAbility | undefined;

  protected heroState = {
    currentHealth: 0,
    maxHealth: 0,
    currentMana: 0,
    maxMana: 0,
    currentLevel: 0,
  };

  protected aroundEnemyHeroes: CDOTA_BaseNPC[] = [];
  protected aroundEnemyCreeps: CDOTA_BaseNPC[] = [];
  protected aroundEnemyBuildings: CDOTA_BaseNPC[] = [];

  Init() {
    this.hero = this.GetParent() as CDOTA_BaseNPC_Hero;
    print(`[AI] HeroBase OnCreated ${this.hero.GetUnitName()}`);
    // 初始化技能
    this.ability_1 = this.hero.GetAbilityByIndex(0);
    this.ability_2 = this.hero.GetAbilityByIndex(1);
    this.ability_3 = this.hero.GetAbilityByIndex(2);
    this.ability_4 = this.hero.GetAbilityByIndex(3);
    this.ability_5 = this.hero.GetAbilityByIndex(4);
    this.ability_utli = this.hero.GetAbilityByIndex(5);

    // 初始化Think
    if (IsInToolsMode()) {
      this.StartIntervalThink(this.ThinkIntervalTool);
    } else {
      this.StartIntervalThink(this.ThinkInterval);
    }
  }

  Think(): void {
    this.hero = this.GetParent() as CDOTA_BaseNPC_Hero;
    if (this.NoAction()) {
      return;
    }

    this.FindAround();
    this.ThinkMode();
  }

  DontRushTower(): boolean {
    const tower = this.FindNearestEnemyBuilding();
    if (!tower) {
      return false;
    }

    const isInTowerRange = ActionAttack.IsInAttackRange(tower, this.hero);
    if (!isInTowerRange) {
      return false;
    }

    // go away from tower
    print(`[AI] HeroBase DontRushTower ${this.hero.GetUnitName()}`);
    const towerPos = tower.GetAbsOrigin();
    const heroPos = this.hero.GetAbsOrigin();
    const direction = heroPos.__sub(towerPos).Normalized();
    ActionMove.MoveHeroToDirection(this.hero, direction, 100);
    return true;
  }

  // ---------------------------------------------------------
  // Think Mode
  // ---------------------------------------------------------
  ThinkMode(): void {
    this.mode = GameRules.AI.FSA.GetMode(this);
    print(`[AI] HeroBase ThinkMode ${this.hero.GetUnitName()} mode ${this.mode}`);
    switch (this.mode) {
      case ModeEnum.RUNE:
        this.ThinkRune();
        break;
      case ModeEnum.ATTACK:
        this.ThinkAttack();
        break;
      case ModeEnum.LANING:
        this.ThinkLaning();
        break;
      case ModeEnum.GANKING:
        this.ThinkGanking();
        break;
      case ModeEnum.PUSH:
        this.ThinkPush();
        break;
      default:
        print(`[AI] HeroBase ThinkMode ${this.hero.GetUnitName()} mode ${this.mode} not found`);
        break;
    }
  }

  ThinkRune(): void {
    print(`[AI] HeroBase ThinkRune ${this.hero.GetUnitName()}`);
    if (this.aroundEnemyHeroes.length > 0) {
      this.ThinkAttack();
      return;
    }
  }

  ThinkAttack(): void {
    if (this.DontRushTower()) {
      return;
    }
    print(`[AI] HeroBase ThinkAttack ${this.hero.GetUnitName()}`);
    const target = this.FindNearestEnemyHero();
    if (!target) {
      return;
    }

    if (this.IsInAbilityPhase()) {
      print(`[AI] HeroBase ThinkAttack 正在施法中 ${this.hero.GetUnitName()}`);
      return;
    }

    // TODO 使用技能

    if (this.IsInAttackPhase()) {
      print(`[AI] HeroBase ThinkAttack 正在攻击中 ${this.hero.GetUnitName()}`);
      return;
    }
    ActionAttack.Attack(this.hero, target);
  }

  ThinkLaning(): void {
    print(`[AI] HeroBase ThinkLaning ${this.hero.GetUnitName()}`);
    if (this.DontRushTower()) {
      return;
    }
  }

  ThinkGanking(): void {
    print(`[AI] HeroBase ThinkGanking ${this.hero.GetUnitName()}`);
  }

  ThinkPush(): void {
    print(`[AI] HeroBase ThinkPush ${this.hero.GetUnitName()}`);
  }

  NoAction(): boolean {
    if (HeroUtil.NotActionable(this.hero)) {
      return true;
    }

    return false;
  }

  // ---------------------------------------------------------
  // Check
  // ---------------------------------------------------------
  IsInAbilityPhase(): boolean {
    if (this.hero.IsChanneling()) {
      return true;
    }

    if (this.ability_1 && this.ability_1.IsInAbilityPhase()) {
      return true;
    }
    if (this.ability_2 && this.ability_2.IsInAbilityPhase()) {
      return true;
    }
    if (this.ability_3 && this.ability_3.IsInAbilityPhase()) {
      return true;
    }
    if (this.ability_4 && this.ability_4.IsInAbilityPhase()) {
      return true;
    }
    if (this.ability_5 && this.ability_5.IsInAbilityPhase()) {
      return true;
    }
    if (this.ability_utli && this.ability_utli.IsInAbilityPhase()) {
      return true;
    }

    return false;
  }

  IsInAttackPhase(): boolean {
    return this.hero.IsAttacking();
  }

  // ---------------------------------------------------------
  // private
  // ---------------------------------------------------------

  private FindAround(): void {
    this.aroundEnemyHeroes = ActionFind.FindEnemyHeroes(this.hero, this.FindRadius);
    this.aroundEnemyCreeps = ActionFind.FindEnemyCreeps(this.hero, this.FindRadius);
    this.aroundEnemyBuildings = ActionFind.FindEnemyBuildings(this.hero, this.FindRadius);
  }

  private FindNearestEnemyHero(): CDOTA_BaseNPC | undefined {
    if (this.aroundEnemyHeroes.length === 0) {
      return undefined;
    }

    const target = this.aroundEnemyHeroes[0];
    return target;
  }

  private FindNearestEnemyCreep(): CDOTA_BaseNPC | undefined {
    if (this.aroundEnemyCreeps.length === 0) {
      return undefined;
    }

    const target = this.aroundEnemyCreeps[0];
    return target;
  }

  private FindNearestEnemyBuilding(): CDOTA_BaseNPC | undefined {
    if (this.aroundEnemyBuildings.length === 0) {
      return undefined;
    }

    const target = this.aroundEnemyBuildings[0];
    return target;
  }

  // ---------------------------------------------------------
  // DotaModifierFunctions
  // ---------------------------------------------------------
  // modifier functions
  OnCreated() {
    if (IsClient()) {
      return;
    }

    const delay = RandomFloat(3, 4);
    print(`[AI] HeroBase OnCreated delay ${delay}`);
    Timers.CreateTimer(delay, () => {
      this.Init();
    });
  }

  OnIntervalThink(): void {
    this.Think();
  }

  IsPurgable(): boolean {
    return false;
  }

  RemoveOnDeath(): boolean {
    return false;
  }

  IsHidden(): boolean {
    return true;
  }
}
