pub fn start() -> Unit {
  game.coin += 10
}

let game : Game = Game::new()

pub fn update() -> Unit {
  @wasm4.text("G a c h a", 44, 6)
  runEvents()
  if game.coin == 0 {
    gameOver()
  }
  game.time += 1
  drawBlock(game)
  drawCoin(game)
  drawBall(game)
  game.input()
}
