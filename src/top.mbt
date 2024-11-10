pub fn start() -> Unit {

}

struct Position {
  mut x : Int
  mut y : Int
}

struct Color {
  mut index : UInt
  mut palette : UInt
}

let pos : Position = { x: 0, y: 0 }

let color : Color = { index: 1, palette: 1 }

pub fn update() -> Unit {
  @wasm4.set_draw_colors(index=color.index, color.palette)
  @wasm4.rect(pos.x, pos.y, 80, 80)
  ///    if pos.x <= 80 {
  ///        pos.x += 1;
  ///    } else {
  ///        pos.x = 0;
  ///    }
  ///    if pos.y <= 80 {
  ///        pos.y += 1;
  ///    } else {
  ///        pos.y = 0;
  ///    }
  if @wasm4.get_gamepad(index=1).button_right && pos.x < 80 {
    pos.x += 1
  }
  if @wasm4.get_gamepad(index=1).button_left && pos.x > 0 {
    pos.x -= 1
  }
  if @wasm4.get_gamepad(index=1).button_down && pos.y < 80 {
    pos.y += 1
  }
  if @wasm4.get_gamepad(index=1).button_up && pos.y > 0 {
    pos.y -= 1
  }
  if @wasm4.get_gamepad(index=1).button_1 {
    @wasm4.tone_note_mode(
      (@wasm4.Note::new(60, bend=10), None),
      @wasm4.ADSR::new(60),
      @wasm4.ADSRVolume::new(100),
      @wasm4.ToneFlag::new(),
    )
  }
  if @wasm4.get_gamepad(index=1).button_2 {
    color.index += 1
    if color.index >= 5 {
        if color.palette < 4 {
            color.palette += 1
            color.index = 1
        }else{
            color.palette = 1
            color.index = 1
        }
    }
  }
}
