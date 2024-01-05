export class Move {
  static MoveHero(bot: CDOTA_BaseNPC_Hero, pos: Vector) {
    bot.MoveToPosition(pos);
  }

  static MoveAround(bot: CDOTA_BaseNPC_Hero, pos: Vector, radius: number) {
    const randomPos = pos.__add(RandomVector(radius));
    bot.MoveToPosition(randomPos);
  }
}
