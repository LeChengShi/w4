pub fn start() -> Unit {

}

pub fn update() -> Unit {

  ///    if inipos.x <= 80 {
  ///        inipos.x += 1;
  ///    } else {
  ///        inipos.x = 0;
  ///    }
  ///    if inipos.y <= 80 {
  ///        inipos.y += 1;
  ///    } else {
  ///        inipos.y = 0;
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

  if @wasm4.get_mouse().left {
    let mousepos:Position={x:@wasm4.get_mouse().x, y:@wasm4.get_mouse().y}
    drawTile(mousepos)
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
