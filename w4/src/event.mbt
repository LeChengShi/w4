let commonEventChance : UInt = 30

let rareEventChance : UInt = 10

let superRareEventChance : UInt = 1

pub let commonEvent = ["Sun", "Moon"]

pub let rareEvent = ["Hurricane"]

pub let superRareEvent = ["Win"]

let commonEventAmount : Int = commonEvent.length()

let rareEventAmount : Int = rareEvent.length()

let superRareEventAmount : Int = superRareEvent.length()

pub struct Event {
  mut sunAmount : UInt
  mut moonAmount : UInt
}

let event : Event = { sunAmount: 0, moonAmount: 0 }

pub fn runEvents() -> Unit {
  if game.time % 300 == 0 {
    game.coin += event.sunAmount
    game.coin -= event.moonAmount
  }
}

pub fn identifyEventEvent() -> String {
  let rand = game.time % 100
  if rand < commonEventChance {
    getCommonEvent()
  } else if rand < commonEventChance + rareEventChance {
    getRareEvent()
  } else if rand < commonEventChance + rareEventChance + superRareEventChance {
    getSuperRareEvent()
  } else {
    "None"
  }
}

fn getCommonEvent() -> String {
  let rand = randomer.int(limit=commonEventAmount)
  commonEvent[rand]
}

fn getRareEvent() -> String {
  let rand = randomer.int(limit=rareEventAmount)
  rareEvent[rand]
}

fn getSuperRareEvent() -> String {
  let rand = randomer.int(limit=superRareEventAmount)
  superRareEvent[rand]
}

pub fn identifyEvent(event : String) -> Unit {
  match event {
    "None" => return
    "Sun" => runSunEvent()
    "Moon" => runMoonEvent()
  }
}

fn runSunEvent() -> Unit {
  event.sunAmount += 1
}

fn runMoonEvent() -> Unit {
  event.moonAmount += 1
}
