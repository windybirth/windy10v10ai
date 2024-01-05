export class ActionItem {
  static BuyItem(bot: CDOTA_BaseNPC_Hero, item: string) {
    const itemIndex = bot.FindItemInInventory(item);
    // 没有该物品
  }
}
