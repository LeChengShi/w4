let commonEventChance : UInt = 30

let rareEventChance : UInt = 10

let superRareEventChance : UInt = 1

pub let commonEvent = ["Sun", "Moon"]

pub let rareEvent = ["Hurricane"]

pub let superRareEvent = ["Win"]

let commonEventAmount : Int = commonEvent.length()

let rareEventAmount : Int = rareEvent.length()

let superRareEventAmount : Int = superRareEvent.length()

pub fn getEvent() -> String {
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
