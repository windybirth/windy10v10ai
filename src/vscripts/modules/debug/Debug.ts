import { Move } from "../../ai/action/move";
import { reloadable } from "../../utils/tstl-utils";
import { CMD } from "./debug-cmd";

@reloadable
export class Debug {
  DebugEnabled = false;
  // 在线测试白名单
  OnlineDebugWhiteList = [
    136407523, // windy
  ];

  private CreateHero: CDOTA_BaseNPC_Hero[] = [];

  constructor() {
    // 工具模式下开启调试
    this.DebugEnabled = IsInToolsMode();
    ListenToGameEvent(`player_chat`, (keys) => this.OnPlayerChat(keys), this);
  }

  OnPlayerChat(keys: GameEventProvidedProperties & PlayerChatEvent): void {
    const steamid = PlayerResource.GetSteamAccountID(keys.playerid);

    if (!this.OnlineDebugWhiteList.includes(steamid)) {
      return;
    }

    const strs = keys.text.split(" ");
    const cmd = strs[0];
    const args = strs.slice(1);

    if (cmd === "-debug") {
      this.DebugEnabled = !this.DebugEnabled;
    }

    // 只在允许调试的时候才执行以下指令
    // commands that only work in debug mode below:
    if (!this.DebugEnabled) return;

    const player = PlayerResource.GetPlayer(keys.playerid);

    // v 获取当前vector
    if (cmd === CMD.v) {
      const hero = PlayerResource.GetSelectedHeroEntity(keys.playerid);
      const pos = hero.GetAbsOrigin();
      const vectorString = `Vector(${Math.floor(pos.x)}, ${Math.floor(pos.y)}, ${Math.floor(
        pos.z,
      )})`;
      this.log(`当前位置: ${vectorString}`);
    }

    if (cmd === CMD.botcreate) {
      this.log(`botcreate`);
      // remove old hero
      for (const hero of this.CreateHero) {
        hero.RemoveSelf();
      }
      this.CreateHero = [];

      // create hero tinker for test
      const tinker = CreateHeroForPlayer("npc_dota_hero_tinker", player);
      tinker.SetAbsOrigin(Vector(-6968, -6406, 384));
      this.CreateHero.push(tinker);
    }

    if (cmd === CMD.botmove) {
      this.log(`botmove`);
      const tinker = this.CreateHero[0];
      Move.MoveAround(tinker, tinker.GetAbsOrigin(), 500);
      // ExecuteOrderFromTable({
      //   OrderType: UnitOrder.MOVE_TO_POSITION,
      //   UnitIndex: tinker.GetEntityIndex(),
      //   Position: Vector(-6968, -6406, 384),
      //   Queue: false,
      // });
    }

    // 其他的测试指令写在下面
    if (cmd.startsWith("get_key_v3")) {
      const version = args[0];
      const key = GetDedicatedServerKeyV3(version);
      this.log(`${version}: ${key}`);
    }

    if (cmd.startsWith("get_key_v2")) {
      const version = args[0];
      const key = GetDedicatedServerKeyV2(version);
      this.log(`${version}: ${key}`);
    }
  }

  log(message: string) {
    print(`[Debug] ${message}`);
    Say(HeroList.GetHero(0), message, false);
  }
}
