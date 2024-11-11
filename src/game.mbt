let fruit : @wasm4.Sprite = @wasm4.sprite(
  b"\x00\xa0\x02\x00\x0e\xf0\x36\x5c\xd6\x57\xd5\x57\x35\x5c\x0f\xf0",
)

let random:@random.Rand = @random.Rand::new()

pub struct Block {
  mut width: Int
  mut height: Int
  mut x: Int
  mut y: Int
}

pub fn Block::new() -> Block {
  {
    width: 8,
    height: 8,
    x: 0,
    y: 0,
  }
}

pub struct Game {
  block : Block
  mut frame_count : Int
  mut prev_gamepad : @wasm4.GamePad
  mut fruit : Position
}


pub fn Game::new() -> Game {
  {
    block: Block::new(),
    frame_count: 0,
    prev_gamepad: @wasm4.GamePad::default(),
    fruit: Position::{
      x: random.int(limit=0),
      y: random.int(limit=0),
    },
  }
}
pub fn input(self : Game) -> Unit {
  let gamepad = @wasm4.get_gamepad()
  if gamepad != self.prev_gamepad {
    if gamepad.button_down {
      self.block.width = self.block.width + 1
    }
    if gamepad.button_left {
      self.block.height = self.block.height + 1
    }
    if gamepad.button_right {
      self.block.x = self.block.x + 1
    }
    if gamepad.button_up {
      self.block.y = self.block.y + 1
    }
  }
  self.prev_gamepad = gamepad
}
