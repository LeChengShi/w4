
struct Position {
  mut x : Int
  mut y : Int
}

struct Color {
  mut index : UInt
  mut palette : UInt
}

let inipos : Position = { x: 0, y: 0 }

let color : Color = { index: 1, palette: 1 }

fn drawTile(mousepos:Position) -> Unit {
    @wasm4.set_draw_colors(index=color.index, color.palette)
  @wasm4.rect(mousepos.x, mousepos.y, 80, 80)
}
fn none() -> Unit {

  ///    if mousepos.x <= 80 {
  ///        mousepos.x += 1;
  ///    } else {
  ///        mousepos.x = 0;
  ///    }
  ///    if mousepos.y <= 80 {
  ///        mousepos.y += 1;
  ///    } else {
  ///        mousepos.y = 0;
  ///    }
  if @wasm4.get_gamepad(index=1).button_right && inipos.x < 80 {
    inipos.x += 1
  }
  if @wasm4.get_gamepad(index=1).button_left && inipos.x > 0 {
    inipos.x -= 1
  }
  if @wasm4.get_gamepad(index=1).button_down && inipos.y < 80 {
    inipos.y += 1
  }
  if @wasm4.get_gamepad(index=1).button_up && inipos.y > 0 {
    inipos.y -= 1
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
