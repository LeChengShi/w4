pub fn start() -> Unit {
  game.coin += 10
}

let game : Game = Game::new()

pub fn update() -> Unit {
  game.time += 1
  drawBlock(game)
  drawCoin(game)
  drawBall(game)
  game.input()
}
