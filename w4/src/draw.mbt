
struct Position {
  mut x : Int
  mut y : Int
}

struct Color {
  mut index : UInt
  mut palette : UInt
}

let inipos : Position = { x: 0, y: 0 }

fn drawBlock(self:Game) -> Unit {
  for i in [0,1,2]{
    self.block[i].x=20+45*i
  }
  for i in [0,1,2]{
     @wasm4.set_draw_colors(index=self.block[i].color.index, self.block[i].color.palette)
     @wasm4.rect(self.block[i].x, self.block[i].y, self.block[i].width, self.block[i].height)
  }
 
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
}

pub fn changeColor(self:Block)->Unit{
  self.color.index += 1
  if self.color.index >= 5 {
      if self.color.palette < 4 {
          self.color.palette += 1
          self.color.index = 1
      }else{
          self.color.palette = 1
          self.color.index = 1
      }
    }
  }
